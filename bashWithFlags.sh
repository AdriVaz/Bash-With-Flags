#!/bin/bash

############### USAGE ###############
function printUsage() {
	echo "Usage: $0 [-ab] -c <valueC> -d <valueD> <mandatoryParam1> <optionalParam1>"
}

############### FLAGS ###############
# Flags in getopt format. A colon (:) behind a param means a value to get
FLAGS=abc:d:
LONGFLAGS=paramA,paramB,paramC:,paramD:

eval set -- "`getopt --options=$FLAGS --longoptions=$LONGFLAGS --name "$0" -- "$@"`"

FLAGA=false
FLAGB=false
FLAGCVAL=""
FLAGDVAL=""

while true; do
	case "$1" in
		-a | --paramA) FLAGA=true ;;
		-b | --paramB) FLAGB=true ;;
		-c | --paramC) FLAGC="$2"; shift ;;
		-d | --paramD) FLAGD="$2"; shift ;;
		--) shift; break ;;
	esac
	shift
done

############### PARAM CHECH ###############
if [ $# -lt 1 ]; then
	printUsage
	exit
fi

############### MAIN PROGRAM ###############
echo "############### PARAMS ###############"
echo "FLAG A: $FLAGA"
echo "FLAG B: $FLAGB"
echo "FLAG C: $FLAGC"
echo "FLAG D: $FLAGD"
echo "MANDATORY: $1"
echo "OPTIONAL: $2"
