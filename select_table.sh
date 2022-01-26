#it take DB name and table name as prameters 
echo "select one of the following  "
echo $(ls Data/$1)

select choice in $( ls Data/$1)
    do
        . select_table_menu.sh $1 $choice
        break
    done