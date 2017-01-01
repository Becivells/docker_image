#!/bin/bash
set -e
set -x
export DEVPI_SERVERDIR=/devpi
[[ -f $DEVPI_SERVERDIR/.serverversion ]] || initialize=yes

if [[ $initialize = yes ]]; then
    devpi-server --port 3141 --serverdir $DEVPI_SERVERDIR --init
fi

devpi-server --start --host 0.0.0.0 --port 3141 --serverdir $DEVPI_SERVERDIR

