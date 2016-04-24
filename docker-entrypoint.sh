#!/bin/bash
set -e

# 
# The DynomiteDB build container performs the following actions:
# 1. Create .deb package
#
# Options:
# -v: tag version
#

# Reset getopts option index
OPTIND=1

# If set, then build a specific tag version. If unset, then build dev branch
version="0.0.0"

while getopts "v:" opt; do
    case "$opt" in
	v)  version=$OPTARG
		;;
    esac
done

#
# Build .deb package
#

# Update .deb build files
export DYNOMITEDB_VERSION=$version
sed -i 's/0.0.0/'${version}'/' /deb/changelog
sed -i 's/0.0.0/'${version}'/' /deb/control

/deb/fpm-build-deb.sh
