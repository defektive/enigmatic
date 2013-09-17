#! /bin/bash

WATCH_DIR=$1
STAGE_DIR=$2

echo "#######################"
echo "## Processing Stages"
echo "## using $STAGE_DIR"
echo "#######################"
echo
 while read dir event file ; do

	dir=`realpath $dir`
	echo $dir $event $file
	if [ "$dir" == "$WATCH_DIR" ]; then 
		echo "New user detected..."
		$STAGE_DIR/init.sh $WATCH_DIR/$file $STAGE_DIR
	else 
		USER_DIR=`dirname $dir`
		for validator in `ls $STAGE_DIR/*/validate.sh`; do
			$validator $USER_DIR $STAGE_DIR
		done
	fi
done

