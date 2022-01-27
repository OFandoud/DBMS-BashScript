#!/bin/bash

echo -e "\n====== Databases ========"
  ls -1 ./Data
  echo -e "==========================="
  echo -e "Enter Database Name: \c"
  read dbName
  rm -r ./Data/$dbName 2>>./.error.log
  if [[ $? == 0 ]]; then
    echo "Database Dropped Successfully"
  else
    echo "Database Not found"
    read -p "Back to Main Menu? press 0 to back and 1 to drop another db " answer
            if [ $answer -eq 1 ];
                then
                
                 ./drop-db.sh
              else 
                
                 ./main.sh
                 fi
  fi
  ./main.sh 0