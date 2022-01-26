echo -e "wellcome to $1 Data Base \n\nselect one of the follwing\n"
while true
   do 
      echo "   "
      select choise in "List tables" "Create table" "Select table" "Delete table" "Back"
         do 
            case $REPLY in
               1)
               #list tables
                  ls ./Data/$1 
                  break
                  ;;
               2)
               #Create table
                  . create_table.sh $1
                  break
                  ;;
               3)
               #Select table
                  . select_table.sh $1
                  break
                  ;;
               4)
               #delete table
                  . drop_table.sh $1
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