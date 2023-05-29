#!/bin/sh

set -e

gem install bundler -v 2.3.26
./bin/setup
bundle check

exec "$@"
