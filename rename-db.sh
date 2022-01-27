 #!/bin/bash

 echo -e "\n====== Databases ========"
  ls -1 ./Data 
  echo -e "==========================="
  echo -e "Enter Current Database Name: \c"
  read dbName
  echo -e "Enter New Database Name: \c"
  read newName
  mv ./Data/$dbName ./Data/$newName 2>>./.error.log
  if [[ $? == 0 ]]; then
    echo -e "Database Renamed Successfully\n"
  else
    echo "Error Renaming Database"
  fi
 ./main.sh  0