#it take DB name as a parameter
echo "select table to delete"
select choice in $( ls Data/$1)
    do
        read -p"are you sure you want to delete $choice table ?? y/N:  "  ans
        case $ans in
            [yY]*)
            rm Data/$1/$choice Data/$1/.$choice 
            echo "table $choice has been deleted"
            break
            ;;
            *)
            echo "canceled"
            break 
            ;;
        esac
    done