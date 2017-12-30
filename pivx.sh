#!/bin/bash

VERSION=3.0.6
FILE_RELEASE=pivx-${VERSION}-x86_64-linux-gnu.tar.gz
URL_RELEASE=https://github.com/PIVX-Project/PIVX/releases/download/v${VERSION}/${FILE_RELEASE}

function pivx_install() {
	echo '[INSTALL] Strat install PIVX wallet'
	pushd ~/
    	    wget ${URL_RELEASE}
        	tar -zxvf ${FILE_RELEASE}
	        pushd ~/pivx-${VERSION}/bin/
                ./pivxd
    	    popd
	popd
	echo '[INSTALL] inished install!'
}

function pivx_run() {
	echo '[RUN] Run PIVX wallet'
    pushd ~/pivx-${VERSION}/bin/
    	./pivxd
    popd
}

function pivx_stop() {
	echo '[STOP] Stop PIVX wallet'
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