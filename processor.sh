#! /bin/bash

while read dir event file ; do
	echo $file created or modified in $dir
done