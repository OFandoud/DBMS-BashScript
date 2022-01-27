#!/bin/bash

#it take table name as prameter
echo -e "welcome to $2 table \nnselect one of the follwing\n"
while true
   do 
      echo "   "
      select choise in "Insert new record" "Select record" "Update record" "Delete record"  "Show table containt" "Back"
         do 
            case $REPLY in
               1)
               #Insert record
                 . insert-record.sh $1 $2  
                  break
                  ;;
               2)
               #select record
                  ./select-record.sh $1 $2
                  break
                  ;;
               3)
               #Update record
                  ./update-record.sh $1 $2
                  break
                  ;;
               4)
               #delete record
                  . delete-record.sh $1 $2
                  break
                  ;;
               5)
                  echo -e "\n====== Table containts ========"
                  cat Data/$1/$2
                  echo "==========================="  ;;

                6)
                  ./second-menu.sh $1
                  ;;
               *) 
               #invalide choise
               echo "Invalid option, Please try again";;
            esac
         done
   done