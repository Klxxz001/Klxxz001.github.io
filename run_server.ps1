param(
    [ValidateRange(1024, 65535)]
    [int]$Port = 4000,
    [switch]$Build
)

$ErrorActionPreference = 'Stop'
$jekyllArguments = @('exec', 'jekyll')
if ($Build) {
    $jekyllArguments += 'build'
} else {
    $jekyllArguments += @('serve', '--host', '127.0.0.1', '--port', "$Port", '--livereload', '--force_polling')
}

if (Get-Command bundle -ErrorAction SilentlyContinue) {
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

$wslScript = @'
set -e
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
bundle check >/dev/null || bundle install
'@
$wslScript += "`n" + 'bundle ' + ($jekyllArguments -join ' ')
& wsl.exe -d Ubuntu --cd $PSScriptRoot -- bash -lc $wslScript
exit $LASTEXITCODE
