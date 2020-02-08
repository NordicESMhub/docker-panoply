#!/bin/sh
#

SCRIPT=`readlink -f $0`
SCRIPTDIR=`dirname $SCRIPT`

java -Duser.home=/config/home -Xms512m -Xmx1600m -jar $SCRIPTDIR/jars/Panoply.jar "$@"

