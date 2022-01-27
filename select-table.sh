#!/bin/bash

#it take DB name and table name as prameters 
echo "select one of the following  "
echo $(ls Data/$1)

select choice in $( ls Data/$1)
    do
        . table-menu.sh $1 $choice
        break
    done