#!/bin/bash

VERSION=3.0.6
FILE_RELEASE=pivx-${VERSION}-x86_64-linux-gnu.tar.gz
URL_RELEASE=https://github.com/PIVX-Project/PIVX/releases/download/v${VERSION}/${FILE_RELEASE}

function pivx_install() {
	echo "$(tput setaf 1)[INSTALL] PIVX MN $(tput sgr0)"
	pushd ~/
    	wget ${URL_RELEASE}
        tar -zxvf ${FILE_RELEASE}
	    pushd ~/pivx-${VERSION}/bin/
            ./pivxd
    	popd
	popd
	echo "$(tput setaf 1)[INSTALL] PIVX MN Complete! $(tput sgr0)"	
}

function pivx_run() {
	echo "$(tput setaf 1)[RUN] PIVX Wallet $(tput sgr0)"	
    pushd ~/pivx-${VERSION}/bin/
    	./pivxd
    popd
}

function pivx_stop() {
	echo "$(tput setaf 1)[STOP] PIVX Wallet$(tput sgr0)"	
	pkill pivxd
}

function pivx_update() {
	pivx_run
	git pull
	pivx_install
	pivx_stop
}

function pivx_conf() {
	echo "~/.pivx/pivx.conf"
}

COMMAND=$1

if [ "${COMMAND}" = "install" ]; then 
	pivx_install
fi

if [ "${COMMAND}" = "run" ]; then 
	pivx_run
fi

if [ "${COMMAND}" = "stop" ]; then 
	pivx_stop
fi

if [ "${COMMAND}" = "update" ]; then 
	pivx_update
fi