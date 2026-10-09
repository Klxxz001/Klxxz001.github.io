param(
    [ValidateRange(1024, 65535)]
    [int]$Port = 4000,
    [switch]$Build,
    [switch]$Stop
)

$ErrorActionPreference = 'Stop'
if ($Build -and $Stop) {
    throw 'Use either -Build or -Stop, not both.'
}
$jekyllArguments = @('exec', 'jekyll')
if ($Build) {
    $jekyllArguments += 'build'
} else {
    $jekyllArguments += @('serve', '--host', '127.0.0.1', '--port', "$Port", '--livereload', '--force_polling')
}

if (-not $Stop -and (Get-Command bundle -ErrorAction SilentlyContinue)) {
    Push-Location $PSScriptRoot
    try {
        & bundle check
        if ($LASTEXITCODE -ne 0) {
            & bundle install
            if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
        }
        & bundle @jekyllArguments
        exit $LASTEXITCODE
    } finally {
        Pop-Location
    }
}

if (-not (Get-Command wsl.exe -ErrorAction SilentlyContinue)) {
    throw 'Install Ruby and Bundler, or enable an Ubuntu WSL distribution, before starting Jekyll.'
}

if ($Stop) {
    # Target only WSL Jekyll preview processes running in this project.
    $wslScript = @'
set -e
project_dir="$(pwd -P)"
stopped=0
for process_dir in /proc/[0-9]*; do
    [ -r "$process_dir/cmdline" ] || continue
    command_line="$(tr '\0' ' ' < "$process_dir/cmdline" 2>/dev/null)" || continue
    case "$command_line" in
        *jekyll*" serve "*) ;;
        *) continue ;;
    esac
    process_cwd="$(readlink -f "$process_dir/cwd" 2>/dev/null)" || continue
    [ "$process_cwd" = "$project_dir" ] || continue
    process_id="${process_dir##*/}"
    if kill -TERM "$process_id" 2>/dev/null; then
        printf 'Stopped homepage preview (PID %s).\n' "$process_id"
        stopped=1
    fi
done
if [ "$stopped" -eq 0 ]; then
    printf 'No running homepage preview found for this project.\n'
fi
'@
} else {
    $wslScript = @'
set -e
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
bundle check >/dev/null || bundle install
'@
    $wslScript += "`n" + 'bundle ' + ($jekyllArguments -join ' ')
}

# Windows PowerShell 5.1 strips nested quotes from native command arguments.
# Pass the UTF-8 script as an ASCII payload so Bash receives it unchanged.
$wslEncodedScript = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($wslScript.Replace("`r`n", "`n")))
& wsl.exe -d Ubuntu --cd $PSScriptRoot -- bash -lc "echo $wslEncodedScript | base64 --decode | bash"
exit $LASTEXITCODE
