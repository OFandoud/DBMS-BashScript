#!/bin/bash
echo  "Note: you should enter characters and hyphens only!"
  echo -e "Enter Database Name: \c"
  read dbName
   case $dbName in 
    *[A-Za-z'-'])
        mkdir ./Data/$dbName  2>>./.error.log
        if [ $? == 0 ] 
        then 
            echo -e "\nThe database $dbName has been created."
            ./main.sh 0
        else 
		    echo -e "\n Database $dbName already exist!!"
            read -p "Back to Main Menu? press 0 to back and 1 to create another db " answer1
            if [ $answer1 -eq 1 ];
                then
                
                 ./create-db.sh
              else 
                
                 ./main.sh 0
                 fi
        fi
        ;;
    *)
        echo -e "The name you entered is not a proper name for a database.\n"
		 read -p "Back to Main Menu? press 0 to back and 1 to create another db " answer
            if [ $answer -eq 1 ];
                then
                
                 ./create-db.sh
              else 
                
                 ./main.sh 0
                 fi
        
        ;;
    esac