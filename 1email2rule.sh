#!/bin/bash


# print usage if no file is provided
if [ $# -ne 1 ] 
then 
echo 'Usage: This script takes a file of email:password pairs and divides duplicate
        email lines into separate files to prevent account lockout in 
        brute force attacks. The script must be run in the same dir as the pairs'
echo
echo ./1email2rule.sh pairs.txt
else
	##==Set up file for processing==
	FID=temp$RANDOM
	TEMP=temp$RANDOM
	cat $1 | sort > $FID	#Make sure the file is sorted
	grep "\S" $FID > $TEMP  #Remove blank lines
	cat $TEMP > $FID	#overwrite with cleaned file

	#PSEUDO:
	#	Loop through each line and compare the email to the previous one.
	#	 If equal, move line to new file
	LC=$(cat $FID | wc -l)  #Capture the line count
	echo $LC
	
	em0=''
    em1=''
    for (( i=1; i<=$LC; i++))
	do
        echo $i
        line=$(sed -n "$i"p $FID)
		em1=$(echo $line | cut -d '@' -f 1)
		echo $em1i
		if [ "$em0" = "$em1" ]; then
		    echo Duplicate, move to new file
            echo $line >> $1.d
		else
	 		echo not a duplicate or first
            sed -n "$i"p $FID >> $1.out
		fi	

        em0=$em1    
	done
	
	##==Cleanup==
	rm $FID
	rm $TEMP

    ##==Recurse==
    if [ -f $1.d ]
    then
            if [ -s $1.d ] 
            then
                    ./1email2rule.sh $1.d
            fi
    fi
   
    echo 'Removing temp files: '
    rm *.d
fi














