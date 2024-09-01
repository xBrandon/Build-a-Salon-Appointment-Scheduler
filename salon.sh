#!/bin/bash
PSQL="psql -U freecodecamp -d salon --tuples-only --csv -c"

function MAIN_MENU {
  if [[ $1 ]]
  then
    echo -e "\nInvalid Selection, Please Try Again\n"
  else
    echo -e "Hello Which Service Would You Like to Schedule?\n"
  fi
  #set id to 1 to start
  ID=1
  #get service name from id
  NAME=$($PSQL "SELECT name FROM services WHERE service_id=$ID")
  #print service options
  while [[ $NAME ]]
  do
    #print service id and name
    echo -e "$ID) $NAME\n"
    #increment id
    ((ID=ID+1))
    #get service next name
    NAME=$($PSQL "SELECT name FROM services WHERE service_id=$ID")
  done
  #read user selection
  read USER_SELECTION
  #if 1
  if [[ $USER_SELECTION == "1" ]]
  then
    #go to hair styling
    HAIR_STYLING
  #else if 2
  elif [[ $USER_SELECTION == "2" ]]
  then
    #go to manicure
    MANICURE
  #else if 3
  elif [[ $USER_SELECTION == "3" ]]
  then
    #go to pedicure
    PEDICURE
  #else
  else
    #return to main menu
    MAIN_MENU "fail"
  fi
}
function HAIR_STYLING {
  echo "Hair styling"
}
function MANICURE {
  echo "Manicure"
}
function PEDICURE {
  echo "Pedicure"
}

echo -e "\n~~~~ Salon ~~~~~\n"
MAIN_MENU
