#! /bin/bash

pushd `dirname $0` > /dev/null
MY_PATH=`pwd`
popd > /dev/null

USER_DIR=`realpath $1`
STAGE_DIR=`realpath $2`
STAGE="stage_02"
NEXT_STAGE=`basename $MY_PATH`

if [ ! -d $USER_DIR/$STAGE ]; then 
	exit;
fi

if [ -d $USER_DIR/$NEXT_STAGE ]; then 
	exit;
fi

echo -n Validating $STAGE for `basename $USER_DIR.....`

FILE="$USER_DIR/$STAGE/blame"
if [ ! -f $FILE ] ; then
	echo 'FAILED!!!'
	exit;
fi

RESULT=`cat $FILE`
ANSWER="hofmann"

if [ "$RESULT" == "$ANSWER" ] ; then 
	echo 'SUCCESS!!!'
	echo "Next Stage $NEXT_STAGE"
	cp -r $STAGE_DIR/$NEXT_STAGE/contents $USER_DIR/$NEXT_STAGE
else 
	echo 'FAILED!!!'
fi



