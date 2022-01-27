#!/bin/bash

PKNum=$(awk -F: '{if ($3==1) print NR;}' Data/$1/.$2) 
PKName=$(awk -F: '{if ($3==1) print $1;}' Data/$1/.$2) 
echo -e "\n====== Table containts ========"
               cat Data/$1/$2
echo "==========================="

read -p "Enter $PKName value to delete the record :" input  
isFound="$(cut -f$PKNum -d: Data/$1/$2 |grep -w $input)"

if [ -n $isFound ]
then 
    recordNumber=$(awk -F: -v fieledNum=$PKNum -v fieledVal=$input 'BEGIN{recordNumber=0;} {if ($fieledNum==fieledVal){ recordNumber=NR; }} END {print recordNumber;}' Data/$1/$2)
    sed -i "$recordNumber d" Data/$1/$2
    echo "one Record is deleted"
else
    echo "Not found any record match "
fi
