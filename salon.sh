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
  #get service id
  read SERVICE_ID_SELECTED
  #if 1
  if [[ $SERVICE_ID_SELECTED == "1" ]]
  then
    #go to hair styling
    GET_INFO
    HAIR_STYLING
  #else if 2
  elif [[ $SERVICE_ID_SELECTED == "2" ]]
  then
    #go to manicure
    GET_INFO
    MANICURE
  #else if 3
  elif [[ $SERVICE_ID_SELECTED == "3" ]]
  then
    #go to pedicure
    GET_INFO
    PEDICURE
  #else
  else
    #return to main menu
    MAIN_MENU "fail"
  fi
}
function GET_INFO {
  #get phone number
  echo -e "\nPlease Enter Your Phone Number"
  #logic for if they aren't a customer
}
function HAIR_STYLING {
  echo "1"
}
function MANICURE {
  echo "2"
}
function PEDICURE {
  echo "3"
}
echo -e "\n~~~~ Salon ~~~~~\n"
MAIN_MENU
