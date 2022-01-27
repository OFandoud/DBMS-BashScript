#!/bin/bash
 echo -e "\n====== Databases ========"
  ls -1 ./Data 
  echo "==========================="
  echo -e "Enter Database Name: \c"
  read dbName
  cd ./Data 2>>./.error.log
  if [ -d "$dbName" ]; then
    echo "Database $dbName was Successfully Selected"
   cd ..
    ./second-menu.sh $dbName

  else
    echo "Database $dbName wasn't found"
    read -p "Back to Main Menu? press 0 to back and 1 to select another db " answer
    if [ $answer -eq 1 ];
    then
    cd ..
     ./select-db.sh
     else 
     cd ..
     ./main.sh 0
     fi
    
  fi
