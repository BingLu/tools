#!/bin/sh

export PATH=$PATH:/home/albert-lu/mini2440/tools/arm/bin
export CROSS_COMPILE=arm-none-eabi-
export ARCH=arm

function gettop
{
    local TOPFILE=ctags
    if [ -f $TOPFILE ]; then
        PWD= /bin/pwd
    else 
        local HERE=$PWD
        T=
        while [ \( ! \( -f $TOPFILE \) \) -a \( $PWD != "/" \) ]; do
            cd .. > /dev/null
            T=`PWD= /bin/pwd`
        done
        cd $HERE > /dev/null
        if [ -f "$T/$TOPFILE" ]; then
            echo $T
        fi
    fi
}

function croot()
{
    T=$(gettop)
    if [ "$T" ]; then
        cd $(gettop)
    else
        echo "Couldn't locate the top of the tree.  Try setting TOP."
    fi
}
