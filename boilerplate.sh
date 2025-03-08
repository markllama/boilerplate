#!/bin/bash

# Define options for getopts(7p)
# https://www.gnu.org/software/bash/manual/bash.html#index-getopts
OPTSPEC="dhv"

# Define default values for arguments
DEFAULT_DEBUG=""    # Empty switch strings are False
DEFAULT_VERBOSE=""

DEFAULT=(
    ['VERBOSE']='',
    ['DEBUG']=''
)


# -------------------------------------------------------------------------
# The top most function should contain only logic
# -------------------------------------------------------------------------
function main() {
    
    # Process CLI arguments
    parse_args $*

    verbose Starting Processing

    debug DEBUG="${DEBUG}"
    debug VERBOSE="${VERBOSE}"

    verbose Ending Processing
}

# -----------------------------------------------------
# Process CLI arguments
# -----------------------------------------------------
function parse_args() {

    local opt # 
    
    # https://www.gnu.org/software/bash/manual/bash.html#index-getopts
    while getopts "${OPTSPEC}" opt ; do
	case $opt in
	    d)
		DEBUG=true
		;;
	
	    h)
		usage
		exit 0
		;;

	    v)
		VERBOSE=true
		;;

	    *)
		error Unknown option: $opt
		usage
		exit 1
	esac
    done

    : DEBUG=${DEBUG:=${DEFAULT[DEBUG]}}
    : VERBOSE=${VERBOSE:=${DEFAULT[VERBOSE]}}
}

# -----------------------------------------------------
# Utility Functions
# -----------------------------------------------------
function usage() {
    cat <<EOF
USAGE: $0 [-dhv]

-d     Print debug output

-h     Print this help text

-v     Print verbose output
EOF
}

#
# Runtime messaging
#
function debug() {
    local message="$*"

    [ -z "${DEBUG}" ] || echo "DEBUG: ${message}"
}

function error() {
    local message="$*"

    echo ERROR: "${message}" >&2
}

function verbose() {
    local message="$*"

    [ -z "${VERBOSE}" ] || echo "${message}"
}

# *************************************************************************
# All functions are defined. Start now
# *************************************************************************
main $*
