#!/usr/bin/env bash
# athanasios@akostopoulos.com
# a few functions that I keep reusing over and over again

# checks if $1 is in path
function do_we_have() {
    if ! hash $1 &> /dev/null
    then
        echo "[-] $1 not in PATH - whoopsie"
        exit 1
    fi
}

# root or dead
function we_need_root() {
if [ $EUID -ne 0 ]; then
    echo [-] "Must be root - exiting!"
    exit 1
fi
}

# death before root
function we_root() {
if [ $EUID -eq 0 ]; then
    echo [-] "Must NOT be root - exiting!"
    exit 1
fi
}
