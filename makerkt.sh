#!/usr/bin/env bash
# Date: 29/06/2026
# Description: A script for programming Racket
# Author: omitida
#

filename=

function usage() {
    echo "Usage: $0 <option> <filename>"
    echo "  "

    echo "Available options:"
    echo "------------------"
    echo "-c: compile the Racket file."
    echo "-d: delete the compiled executable."
    echo "-h: show this help message."
    echo "-o: generate standalone Racket file."
    echo "-r: run the compiled executable."
    exit 1
}

function check_file() {
    filename="${1}"
    file_extension="${filename##*.}"
    file_basename="${filename%.*}"
    [ "${file_extension}" != "rkt" ] && { filename="${file_basename,,}.rkt"; }
}

RACKET="#lang racket

(displayln \"Hello, World!\")
"

if [ "${#}" -ne 2 ]; then
    usage
fi

optionstring="c:d:o:r:h"
while getopts "${optionstring}" opt; do
    case $opt in
        c)
            filename="${OPTARG}"
            echo "Compiling $filename..."
            check_file "${filename}"

            raco make "${filename}"
            ;;

        d)
            filename="${OPTARG}"
            echo "Deleting compiled executable..."

            while read -p -r "Are you sure you want to delete ${filename}? (y/n): " yn; do
                case "${yn}" in
                    [Yy]* ) rm -f "${filename}"; break;;
                    [Nn]* ) break;;
                    * ) echo "${filename} Not deleted. You can only delete by pressing 'y' or 'n'."
                ;;
            esac
        done
        ;;
        o)
            filename="${OPTARG}"
            echo "Generating standalone Racket file..."
            check_file "${filename}"
            echo "${RACKET}" > "${filename}"

            racket "${filename}"
            ;;
        r)
            filename="${OPTARG}"
            check_file "${filename}"

            ;;
        h)
            usage
            ;;
        *)
            echo "Invalid option: -${OPTARG}" >&2
            usage
            ;;
    esac
done
