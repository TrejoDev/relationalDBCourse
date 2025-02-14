#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

mostrar_info_elemento() {
  local elemento="$1"
  local query="SELECT e.atomic_number, e.symbol, e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type
    FROM elements e
    JOIN properties p ON e.atomic_number = p.atomic_number
    JOIN types t ON p.type_id = t.type_id"

  if [[ "$elemento" =~ ^[0-9]+$ ]]; then
    resultado=$($PSQL "$query WHERE e.atomic_number = $elemento")
  else
    resultado=$($PSQL "$query WHERE LOWER(e.name) = LOWER('$elemento') OR LOWER(e.symbol) = LOWER('$elemento')")
  fi

  if [[ -z "$resultado" ]]; then
    echo "I could not find that element in the database."
  else
    IFS="|" read -r atomic_number symbol name atomic_mass melting_point boiling_point type <<<"$resultado"
    echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point celsius and a boiling point of $boiling_point celsius."
  fi
}

if [[ -z "$1" ]]; then
  echo "Please provide an element as an argument."
  exit 0
fi

mostrar_info_elemento "$1"
