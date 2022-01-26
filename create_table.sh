#it's take DB name as aprameter
name=""
while true 
do
    read -p "Enter table name: " name
    isFound=$(ls Data/$1 |grep $name)
    echo $isFound
    if [ -z $isFound ]
    then
        break
    else
        echo "Table is already existing"
    fi

done 
typeset -i num
read -p "Enter number of column: " num
for  ((i=0;i<$num;i++)){
    col_name=""
    while true 
    do

        echo "Enter column name: "
        read col_name
        if [ $i -eq 0 ]
        then
            break
        fi
        isFound=$(awk -v cName=$col_name -F: '{if($1==cName){print $1}}' Data/$1/.$name)
        if [ -z $isFound ]
        then
            break
        else
            echo "column is already existing"
        fi
    done    
    echo "Enter column type"
    meta=""
    meta+=$col_name
    select choice in "Integer" "String"
    do
    case $REPLY in
        1) meta+=:'int'
        break
        ;;
        2) meta+=:'string'
        break
        ;;
        esac
    done
    echo $meta:0 >> Data/$1/.$name
}
echo "select table Primary key"
select pk in $(awk -F: '{print $1}' Data/$1/.$name)
do
    column_data="$(awk -F: -v newPK=$pk '{if(newPK==$1){print $0}}' Data/$1/.$name)"
    newColumnData="${column_data%:0}:1"
    sed -i  "s/$column_data/$newColumnData/g" Data/$1/.$name
    break
done

touch Data/$1/$name 
echo "$name table has been created"