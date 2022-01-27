#!/bin/bash
 echo -e "\n\nSelect all columns from $2 TABLE Where FIELD(OPERATOR)VALUE \n"
 echo -e "Enter required FIELD name: \c"
 read field
 echo $field
 fid=$(awk -F: '{if ($1=="'$field'")print NR}' Data/$1/.$2)
 echo $fid
   if [[ $fid == "" ]]
  then
    echo "Not Found"
    ./table-menu.sh $1 $2
  else
  echo -e "\nSupported Operators: [==, !=, >, <, >=, <=] \nSelect OPERATOR: \c"
    read op
    if [[ $op == "==" ]] || [[ $op == "!=" ]] || [[ $op == ">" ]] || [[ $op == "<" ]] || [[ $op == ">=" ]] || [[ $op == "<=" ]]
    then
      echo "use double quotes if you will enter text or nothing if you will enter numbers!"
      echo -e "\nEnter required VALUE: \c"
      read val
      res=$(awk -F: '{if ($'$fid$op$val') print $0}' Data/$1/$2 2>>./.error.log )
      if [[ $res == "" ]]
      then
        echo "Value Not Found"
       ./table-menu.sh $1 $2
      else
        awk -F: '{if ($'$fid$op$val') print $0}' Data/$1/$2 2>>./.error.log 
        ./table-menu.sh $1 $2
      fi
    else
      echo "Unsupported Operator\n"
      ./table-menu.sh $1 $2
    fi
  fi

