#!/bin/bash

function print_syntax_and_exit {
  echo Syntax: create-txts.sh [-u] [-o \<output-dir\>] file1 file2 ...
  exit 1
}

SRCDIR=`dirname $0`
OUTPUTDIRECTORY="."
UPPERCASE="false"

# Process optional parameters.
while [[ $# -gt 0 && "$1" =~ ^(-u|-o)$ ]]
do
  if [ $1 = "-o" ]
  then
    shift
    if [ $# -lt 1 ]
      then
      print_syntax_and_exit
    fi
    OUTPUTDIRECTORY=$1
  elif [ $1 = "-u" ]
  then
    UPPERCASE="true"
  fi
  shift 
done

if [ $# -lt 1 ]
then
  print_syntax_and_exit
fi

# Process actual files.
while [[ $# -gt 0 ]]
do
  BASENAME=`basename $1 .xml`
  if [ ${BASENAME} = "changelog" ]
  then
    XSLTFILE="changelog-ascii.xslt"
  else
    XSLTFILE="ascii.xslt"
  fi
  if [ $UPPERCASE = "true" ]
  then
    BASENAME=`echo "${BASENAME}" | tr '[:lower:]' '[:upper:]'`
  fi
  OUTPUTFILENAME="${OUTPUTDIRECTORY}/${BASENAME}.md"
  echo "Converting \"$1\" to \"${OUTPUTFILENAME}\"."
  xsltproc -o "$OUTPUTFILENAME" "${SRCDIR}/${XSLTFILE}" "$1"
  shift
done

