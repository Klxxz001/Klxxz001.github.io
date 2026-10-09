#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
bundle check >/dev/null || bundle install
bundle exec jekyll serve --host 127.0.0.1 --port "${PORT:-4000}" --livereload --force_polling
