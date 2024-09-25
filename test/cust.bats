#!/usr/bin/env bats

load 'test_helper/bats-support/load'
load 'test_helper/bats-file/load'
load 'test_helper/bats-assert/load'

######## SETUP TESTS ########
ROOTDIR="$(git rev-parse --show-toplevel)"
SOURCEFILE="${ROOTDIR}/utilities/cust.bash"
BASEHELPERS="${ROOTDIR}/utilities/misc.bash"
ALERTS="${ROOTDIR}/utilities/alerts.bash"

if test -f "${SOURCEFILE}" >&2; then
    source "${SOURCEFILE}"
else
    echo "Sourcefile not found: ${SOURCEFILE}" >&2
    printf "Can not run tests.\n" >&2
    exit 1
fi

setup() {

    TESTDIR="$(temp_make)"
    curPath="${PWD}"

    BATSLIB_FILE_PATH_REM="#${TEST_TEMP_DIR}"
    BATSLIB_FILE_PATH_ADD='<temp>'

    pushd "${TESTDIR}" &> /dev/null

    ######## DEFAULT FLAGS ########
    LOGFILE="${TESTDIR}/logs/log.txt"
    QUIET=false
    LOGLEVEL=OFF
    VERBOSE=false
    FORCE=false
    DRYRUN=false

    set -o errtrace
    set -o nounset
    set -o pipefail
    shopt -u nocasematch
}

teardown() {
    set +o nounset
    set +o errtrace
    set +o pipefail

    popd &> /dev/null
    temp_del "${TESTDIR}"
}

######## RUN TESTS ########

@test "_custTrim" {
    local text=$(_custTrim_ <<< "    some text  ")

    run echo "$text"
    assert_output "some text"
}
