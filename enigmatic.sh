#! /bin/bash

pushd `dirname $0` > /dev/null
MY_PATH=`pwd`
popd > /dev/null

WATCH_DIR=$1

echo $MY_PATH
echo $WATCH_DIR



if [ `which inotifywait` == ""]; then
	echo "Please install inotify-tools"
	echo ""
	echo "For my Debian/Ubuntu friends"
	echo "	apt-get install inotify-tools"
	echo ""
	echo "For everyone else"
	echo "	https://github.com/rvoicilas/inotify-tools/wiki#wiki-info"
	echo ""
	exit
fi

inotifywait -mr -e modify -e create | $MY_PATH/processor.sh