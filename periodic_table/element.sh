#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

MAIN_MENU() {
  # If not argument provided
  if [[ -z $ELEMENT ]]
  then
    echo "Please provide an element as an argument."
  else
    # Judge argument in 1|H|Hydrogen
    case $ELEMENT in
      1|H|Hydrogen)
        echo "The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius."
      ;;
      *) OTHER_CASE ;;
    esac
  fi
}

# Arguments in other case
OTHER_CASE() {
  if [[ $ELEMENT =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$ELEMENT;")
  else
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol='$ELEMENT';")
    NAME=$($PSQL "SELECT name FROM elements WHERE name='$ELEMENT';")
  fi
  # element not exists
  if [[ -z $ATOMIC_NUMBER && -z $SYMBOL && -z $NAME ]]
  then
    echo "I could not find that element in the database."
    # exist element
  else
    if [[ $ATOMIC_NUMBER ]]
    then
      RESULT=$($PSQL "SELECT symbol, name FROM elements WHERE atomic_number='$ELEMENT';")
      IFS="|" read SYMBOL NAME <<< $RESULT
    elif [[ $SYMBOL ]]
    then
      RESULT=$($PSQL "SELECT atomic_number, name FROM elements WHERE symbol='$ELEMENT';")
      IFS="|" read ATOMIC_NUMBER NAME <<< $RESULT
    else
      RESULT=$($PSQL "SELECT atomic_number, symbol FROM elements WHERE name='$ELEMENT';")
      IFS="|" read ATOMIC_NUMBER SYMBOL <<< $RESULT
    fi
    # get atomic type
    PROPERTIES=$($PSQL "SELECT e.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM properties p JOIN types e USING(type_id) WHERE p.atomic_number='$ATOMIC_NUMBER';")
    IFS="|" read TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT <<< $PROPERTIES
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi
}

ELEMENT=$1
MAIN_MENU