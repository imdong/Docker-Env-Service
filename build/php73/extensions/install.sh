#!/bin/sh

echo
echo "============================================"
echo "Install extensions from   : install.sh"
echo "PHP version               : ${PHP_VERSION}"
echo "Extra Extensions          : ${PHP_EXTENSIONS}"
echo "Multicore Compilation     : ${MC}"
echo "Work directory            : ${PWD}"
echo "============================================"
echo

if [ "${PHP_EXTENSIONS}" != "" ]; then
    echo "---------- Install general dependencies ----------"
    apk add --no-cache autoconf g++ libtool make curl-dev libxml2-dev libevent-dev linux-headers --repository https://${ALPINE_REPOSITORIES}/alpine/edge/testing gnu-libiconv
fi

if [ -z "${EXTENSIONS##*,mbstring,*}" ]; then
    echo "---------- Install mbstring ----------"
    docker-php-ext-install ${MC} mbstring
fi

if [ -z "${EXTENSIONS##*,zend_test,*}" ]; then
    echo "---------- Install zend_test ----------"
    docker-php-ext-install ${MC} zend_test
fi

if [ -z "${EXTENSIONS##*,pdo_oci,*}" ]; then
    echo "---------- Install pdo_oci ----------"
    docker-php-ext-install ${MC} pdo_oci
fi

if [ -z "${EXTENSIONS##*,oci8,*}" ]; then
    echo "---------- Install oci8 ----------"
    docker-php-ext-install ${MC} oci8
fi

if [ -z "${EXTENSIONS##*,wddx,*}" ]; then
    echo "---------- Install wddx ----------"
    apk add --no-cache libxslt-dev
    docker-php-ext-install ${MC} wddx
fi

if [ -z "${EXTENSIONS##*,curl,*}" ]; then
    echo "---------- Install curl ----------"
    apk add --no-cache curl
    docker-php-ext-install ${MC} curl
fi

if [ -z "${EXTENSIONS##*,readline,*}" ]; then
    echo "---------- Install readline ----------"
    apk add --no-cache readline-dev
    apk add --no-cache libedit-dev
    docker-php-ext-install ${MC} readline
fi

if [ -z "${EXTENSIONS##*,recode,*}" ]; then
    echo "---------- Install recode ----------"
    apk add --no-cache recode-dev
    docker-php-ext-install ${MC} recode
fi
