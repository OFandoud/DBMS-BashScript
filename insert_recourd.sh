#it take DB name and table name as prameters 
new=""
numOfColumn=$(wc -l < Data/$1/.$2)
for ((i=0;i<numOfColumn;i++)){
    columnName=$(awk -v i="$i" -F: '{if(NR == i+1) print $1}' Data/$1/.$2)
    columnType=$(awk -v i="$i" -F: '{if(NR == i+1) print $2}' Data/$1/.$2)
    isPK=$(awk -v i="$i" -F: '{if(NR == i+1) print $3}' Data/$1/.$2)
    #cheak if primary key or not 
    if [ $isPK -eq 1 ]
    then
        input=""
        #cheak if inuput is primary or not 
        while true
        do
            read -p"Enter $columnName: " input
            if [ -z $input ]
            then
                echo "Primary key can not be empty"
                continue
            fi
            typeset -i section=$i+1
            isFound="$(cut -f$section -d: Data/$1/$2 |grep -w $input)"
            if [ -z $isFound ]
            then 
                break
            else
                echo "value must be primary"
            fi                
        done
        
        if [ $columnType == "int" ]
        then
            while true 
                do 
                    case $input in 
                    ''|*[!0-9]*)
                        echo "value must be Numbers"
                        read -p"Enter $columnName: " input ;;
                    *)
                        if [ -z $new ]
                        then
                            new+=$input
                        else
                            new+=:$input
                        fi 
                        break;;
                    esac
                done
        else
            if [ -z $new ]
            then
                new+=$input
            else
                new+=:$input
            fi  
        fi       
    else
        read -p"Enter $columnName: " input
        if [ $columnType == "int" ]
        then
            while true 
                do 
                    case $input in 
                    ''|*[!0-9]*)
                        echo "value must be Numbers"
                        read -p"Enter $columnName: " input ;;
                    *)
                        if [ -z $new ]
                        then
                            new+=$input
                        else
                            new+=:$input
                        fi 
                        break;;
                    esac
                done
        else
            if [ -z $new ]
            then
                new+=$input
            else
                new+=:$input
            fi  
        fi
    fi
}
echo $new >> Data/$1/$2 