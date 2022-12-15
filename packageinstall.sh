#!/bin/sh
CHAPTER="$1"
PACKAGE="$2"

cat packages.csv | grep -i "$PACKAGE" | while read line; do
    str=( $line )
    FILENAME=${str[0]}
    DIRNAME=${str[1]}

    #echo "$FILENAME"
    #echo "$DIRNAME"

    mkdir -pv "$DIRNAME"
    
    echo "Extracting $FILENAME"
    tar -xf "$FILENAME" -C "$DIRNAME"
    
    pushd "$DIRNAME"
        # remove redundant directory if it exists
        if [ "$(ls -1A | wc -l)" == "1" ]; then
            echo "Moving Files"
            mv $(ls -1A)/* ./
        fi
        echo "Compiling $PACKAGE"
        sleep 5 # more user visibility

        # run compile script and store output in log file
        mkdir -pv "../log/chapter$CHAPTER"
        if ! source "../chapter$CHAPTER/$PACKAGE.sh" 2>&1 | tee "../log/chapter$CHAPTER/$PACKAGE.log"; then
            echo "Compiling $PACKAGE FAILED!"
            popd
            exit 1
        fi
        echo "Done Compiling $PACKAGE"

    popd
done