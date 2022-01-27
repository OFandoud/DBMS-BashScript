#!/bin/bash

 echo -e "\n====== Table containts ========"
                  cat Data/$1/$2
    echo "===========================" 
                      
 # $2 table name
 # select name of column
 PKNum=$(awk -F: '{if ($3==1) print NR;}' Data/$1/.$2)  #1
PKName=$(awk -F: '{if ($3==1) print $1;}' Data/$1/.$2)  #id
read -p "Enter $PKName value to update the record :" input  #4
isFound="$(cut -f$PKNum -d: Data/$1/$2 |grep -w $input)"
if [ -n $isFound ]
then 
    recordNumber=$(awk -F: -v fieledNum=$PKNum -v fieledVal=$input 'BEGIN{recordNumber=0;} 
    {if ($fieledNum==fieledVal){ recordNumber=NR; }} END {print recordNumber;}' Data/$1/$2) #first line in table
    echo "Select record you want to update?"
    read old
    echo -e "Enter new value: \c"
    read new
    sed -i "$recordNumber s/$old/$new/" Data/$1/$2
    echo "one Record is updated"
else
    echo "Not found any record match "
fi

  