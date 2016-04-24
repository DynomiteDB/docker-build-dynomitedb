#!/bin/bash

#
# Build: DynomiteDB - DynomiteDB meta package
# OS:    Ubuntu
# Type:  .deb
#  

PACKAGE_NAME="dynomitedb"
VERSION=$DYNOMITEDB_VERSION
STATIC_FILES="LICENSE README.md"

#
# ****************************
# ** DO NOT EDIT BELOW HERE **
# ****************************
#

DEB=/deb
PACKAGE_ROOT=${DEB}/tmp/dynomitedb
LINTIAN=${PACKAGE_ROOT}/usr/share/lintian/overrides
STATIC=${PACKAGE_ROOT}/usr/local/dynomitedb/${PACKAGE_NAME}

#
# Create a packaging directory structure for the package
#
mkdir -p $PACKAGE_ROOT
# Static files
mkdir -p $STATIC
# lintian
mkdir -p $LINTIAN

# Set directory permissions for the package
chmod -R 0755 $PACKAGE_ROOT

# lintian
cp ${DEB}/${PACKAGE_NAME}.lintian-overrides ${LINTIAN}/${PACKAGE_NAME}
chmod 0644 ${LINTIAN}/${PACKAGE_NAME}

#
# DynomiteDB
#

# Static files
for s in $STATIC_FILES
do
    cp ${DEB}/usr/local/dynomitedb/${PACKAGE_NAME}/${s} $STATIC
done
chmod 0644 ${STATIC}/*

fpm \
	-f \
	-s dir \
	-t deb \
	-C ${PACKAGE_ROOT}/ \
	--directories ${PACKAGE_ROOT}/ \
	--deb-custom-control ${DEB}/control \
	--deb-changelog ${DEB}/changelog \
	-n "${PACKAGE_NAME}" \
	-v ${VERSION} \
	--epoch 0

# Run lintian
lintian *.deb
