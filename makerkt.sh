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
    echo "-p: create a package in a given directory with the same name."
    exit 1
}

function check_file() {
    filename="${1}"
    file_extension="${filename##*.}"
    file_basename="${filename%.*}"
    [ "${file_extension}" != "rkt" ] && { filename="${file_basename,,}.rkt"; }
}

RACKET="#lang racket

(displayln \"Start, Here!\")
"

RACKET_PROJECT="#lang racket

;; define sum-list function
(define (sum-list lst)
  (cond ((empty? lst) 0)
        (else (+ (first lst) (sum-list (rest lst))))))
;; export sum-list function
(provide sum-list)
"

function test_file() {
    echo "#lang racket

;; test sum-list function
(require \"${2}\")
(require rackunit)

(check-equal? (sum-list '(1 2 3)) 6)
" > "${1}"
}

if [ "${#}" -ne 2 ]; then
    usage
fi

optionstring="c:d:o:r:p:h"
while getopts "${optionstring}" opt; do
    case $opt in
        c)
            filename="${OPTARG}"
            echo "Compiling $filename..."
            check_file "${filename}"

            raco make "${filename}"
            racket"${filename}"
            ;;

        d)
            filename="${OPTARG}"
            echo "Deleting compiled executable..."

            while read -r -p "Are you sure you want to delete ${filename}? (y/n): " yn; do
                case "${yn}" in
                    [Yy]* ) rm -rf "${filename}"; break;;
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
            while read -r -p "How would you like to run ${filename}? (compile(c), script(s), run(r)): " choice; do
                case "${choice}" in
                    [Cc]* ) raco make "${filename}" ; racket "${filename}"; break;;
                    [Ss]* )
                        # make a tmp file
                        tmpfile="${filename}.tmp"
                        echo "#!/usr/bin/env racket" > "${tmpfile}"
                        cat "${filename}" >> "${tmpfile}"
                        mv "${tmpfile}" "${filename}"
                        chmod +x "${filename}"
                        "./${filename}"
                        break;;
                    [Rr]* )
                        chmod -x "${filename}"
                        perl -p -i -e 's|^#!.*$||' "${filename}"
                        racket "${filename}"; break;;
                    * ) echo "Invalid choice. You can only run by pressing 'c', 's', or 'r'."
                ;;
            esac
        done
        ;;
        p)
            dir="${OPTARG}"
            [ -d "${dir}" ] && { echo "Directory ${dir} already exists."; exit 1; }
            echo "Creating package in ${dir}..."
            mkdir "${dir}"
            cd "${dir}" || exit
            echo "${RACKET_PROJECT}" > "${dir}.rkt"
            test_file "test.rkt" "${dir}.rkt"
            raco pkg init
            raco test "${dir}.rkt"
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
