#!/bin/bash

NAME="blueprint_flipper"
FILES="graphics locale prototypes control.lua data.lua info.json"

DEST="${NAME}_$V"
ZIP="${DEST}.zip"

if [[ "$V" == "" ]] ; then
    echo "error: \$V not set"
else
    [[ -e "$ZIP" ]] && rm "$ZIP"
    if [[ -f "$DEST" ]] ; then
        echo "error: '$DEST' exists and is not a folder"
    else
        [[ -d "$DEST" ]] || mkdir "$DEST"
        rm -rf "${DEST:?}/*" # avoid rm /* if $DEST is empty. thanks shellcheck!
        for f in $FILES ; do cp -a "$f" "$DEST" ; done
        zip -r "$ZIP" "$DEST"
    fi
fi
