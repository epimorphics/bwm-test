#!/bin/bash
#
# run tests
#
# $1 indicates which tests to run
# $2 is the server to test
#

set -e

# get the directory this script is in
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

pushd $DIR/$1 >/dev/null

export TEST_HOST=$2

bundle exec cucumber

popd >/dev/null