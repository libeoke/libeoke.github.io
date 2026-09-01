#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

# Homebrew版rubyを優先（システムのrubyが古いため）
if [ -d /opt/homebrew/opt/ruby/bin ]; then
  export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/4.0.0/bin:$PATH"
fi

bundle check --quiet 2>/dev/null || bundle install
bundle exec jekyll build

echo "ビルド完了: _site/index.html"

if [ "${1:-}" = "--open" ] && command -v open >/dev/null 2>&1; then
  open _site/index.html
fi
