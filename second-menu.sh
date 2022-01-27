#!/bin/bash

echo -e "welcome to $1 DataBase \nselect one of the follwing\n"
while true
   do 
      echo "Press 0 to exit!"
      select choise in "List tables" "Create table" "Select table" "Delete table" "Back" 
         do 
            case $REPLY in
               1)
               #list tables
               echo -e "\n====== Tables ========"
                ls -1 ./Data/$1
               echo "==========================="
                  
                  break
                  ;;
               2)
               #Create table
                  . create-table.sh $1
                  break
                  ;;
               3)
               #Select table
                  . select-table.sh $1
                  break
                  ;;
               4)
               #delete table
                  . drop-table.sh $1
                  break
                  ;;
               5) #back to main
                   ./main.sh 0 ;;

               0)
                   exit ;;
               *) 
               #invalide choise
               echo "Invalid option, Please try again";;
            esac
         done
   done