#!/bin/bash
# Script for querying periodic table elements
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# No argument provided
if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit
fi

INPUT=$1

# Determine query condition
if [[ $INPUT =~ ^[0-9]+$ ]]; then
  QUERY_CONDITION="atomic_number = $INPUT"
elif [[ $INPUT =~ ^[A-Za-z]{1,2}$ ]]; then
  QUERY_CONDITION="symbol = '$INPUT'"
else
  QUERY_CONDITION="name = '$INPUT'"
fi

# Query database
ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, types.type, atomic_mass, melting_point_celsius, boiling_point_celsius 
FROM elements 
JOIN properties USING(atomic_number) 
JOIN types USING(type_id) 
WHERE $QUERY_CONDITION;")

# If no result
if [[ -z $ELEMENT ]]; then
  echo "I could not find that element in the database."
  exit
fi

# Format output
echo "$ELEMENT" | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR MASS BAR MELT BAR BOIL
do
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
done