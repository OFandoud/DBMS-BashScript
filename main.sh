#!/bin/bash

if [ $# -eq 0 ];
then

mkdir Data 2>> ./.error.log
clear
fi
echo "Welcome To DBMS app using Bash Script.."
echo -e "\nAUTHOR\nWritten by: Omar Fandoud & Ismael Atallah. "
function mainMenu {
  echo -e "\n+---------Main Menu-------------+"
  echo "| 1. Select DB                  |"
  echo "| 2. Create DB                  |"
  echo "| 3. Drop DB                    |"
  echo "| 4. Rename DB                  |"
  echo "| 5. Show DBs                   |"
  echo "| 0. Exit                       |"
  echo "+-------------------------------+"
  echo -e "Enter Choice: \c"
  read ch
  case $ch in
    1)  ./select-db.sh ;;
    2)   ./create-db.sh ;;
    3)   ./drop-db.sh ;;
    4)  ./rename-db.sh ;;
    5)  echo -e "\n====== Databases ========"
        ls -1 ./Data 
        echo -e "==========================="
         mainMenu;;
    0) exit ;;
    *) echo " Wrong Choice " ; mainMenu;
  esac
}

mainMenu

