#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`
BASEPATH=`dirname $SCRIPTPATH`

# activate our virtualenv
. `dirname $BASEPATH`/python/bin/activate

# save PID in lockfile
/proj/ads/soft/bin/mklock -d $SCRIPTPATH .graphics.lock $$ || {
	echo "$SCRIPT: cannot create lock file, aborting" 1>&2
	exit 1
}

echo "#############" `date` ": synching data sources #################"
python $BASEPATH/scripts/sync_graphics_data.py "$@" sync

echo "#############" `date` ": script completed ###################"

/proj/ads/soft/bin/rmlock -d $SCRIPTPATH .graphics.lock $$
