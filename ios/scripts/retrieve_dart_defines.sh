#!/bin/sh

OUTPUT_FILE="${SRCROOT}/Flutter/DartDefines.xcconfig"

function decode_url() { echo "${*}" | base64 --decode; }

: > $OUTPUT_FILE

IFS=',' read -r -a define_items <<<"$DART_DEFINES"

for index in "${!define_items[@]}"
do
    item=$(decode_url "${define_items[$index]}")
    if [ $(echo $item | grep 'FLAVOR') ] ; then
        echo $item >> $OUTPUT_FILE
        if [ $(echo $item | grep -v 'prod') ] ; then
            value=${item#*=}
            echo FLAVOR_SUFFIX=.${value} >> $OUTPUT_FILE
        fi
    fi
done