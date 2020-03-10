#!/bin/bash

set -e

if [ "$1" == "" ]
then
    echo "Usage: $0 FILENAME.MD"
    exit -1
fi


FILENAME=`echo $1 | cut -f1 -d'.'`
OUTFILENAME=`grep -m1 value $1 | cut -d'"' -f2`

mmark $FILENAME.md > $OUTFILENAME.xml

`which xml2rfc` --html $OUTFILENAME.xml 

`which xml2rfc` --text $OUTFILENAME.xml
