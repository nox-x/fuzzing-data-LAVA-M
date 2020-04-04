#!/bin/bash

if [ -n "$1" ] && [ -d $1 ]
then
	cd $1
else
	echo "[-] Directory not found or not specified!"
	exit 1
fi

for FILE_PREFIX in afl-out-ASAN afl-out-ASAN-dump afl-out-ASAN-wo-trace afl-out-ASAN-wo-trace-dump afl-out-trace afl-out-trace-dump afl-out-wo-trace afl-out-wo-trace-dump
do

	PLOT_DATA_FILE="${FILE_PREFIX}-plot_data.dat"
	COVE_DATA_FILE="${FILE_PREFIX}-cov.dat"
	ZERO_TIME_STAMP=`sed -n "2{p;q;}" $PLOT_DATA_FILE | cut -d ',' -f 1`
	TARGET_FILE="${FILE_PREFIX}-covtime.dat"
	
	echo "current processing: ${FILE_PREFIX}"
	echo > $TARGET_FILE

	while read PLOT_DATA_LINE
	do
	
	[[ $PLOT_DATA_LINE == \#* ]] && continue
	
	PATH_NUM=`echo $PLOT_DATA_LINE | cut -d ' ' -f 4 | tr -d ','`
	TIME_STAMP=`echo $PLOT_DATA_LINE | cut -d ',' -f 1`
	COVERED=`sed -n "${PATH_NUM}{p;q;}" $COVE_DATA_FILE | cut -d ' ' -f 3`

	printf "%s %s\n" $(( $TIME_STAMP - $ZERO_TIME_STAMP )) $COVERED >> $TARGET_FILE

	done < $PLOT_DATA_FILE

done
