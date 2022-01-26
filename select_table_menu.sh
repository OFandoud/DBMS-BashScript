#it take table name as prameter
echo -e "wellcome to $2 table \n\nselect one of the follwing\n"
while true
   do 
      echo "   "
      select choise in "Insert new record" "Select record" "Update recored" "Delete record" "Back"
         do 
            case $REPLY in
               1)
               #Insert record
                 . insert_recourd.sh $1 $2  
                  break
                  ;;
               2)
               #select record
                  echo "Select record"
                  break
                  ;;
               3)
               #Update recorde
                  echo "update recorde"
                  break
                  ;;
               4)
               #delete recourd
                  . delete_recourd.sh $1 $2
                  break
                  ;;
               5)
                  break 2 ;;
               *) 
               #invalide choise
               echo "Invalid option, Please try again";;
            esac
         done
   done