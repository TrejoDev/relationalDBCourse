#!/bin/bash

# Database connection string
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Function to check if input is an integer
is_integer() {
  if [[ "$1" =~ ^-?[0-9]+$ ]]; then
    return 0 # True
  else
    return 1 # False
  fi
}

# Function to get user data from the database
get_user_data() {
  local username="$1"
  local query="SELECT games_played, best_game FROM users WHERE username='$username'"
  local result=$($PSQL "$query")
  if [[ -z "$result" ]]; then
    echo "" # User not found, return empty string
  else
    echo "$result" # Return games_played and best_game
  fi
}

# Function to insert new user into the database
insert_new_user() {
  local username="$1"
  local query="INSERT INTO users (username, games_played, best_game) VALUES ('$username', 0, NULL)"
  $PSQL "$query" > /dev/null # Discard output, just execute the query
}

# Function to update user data in the database
update_user_data() {
  local username="$1"
  local guesses="$2"
  local query_games_played="UPDATE users SET games_played = games_played + 1 WHERE username='$username'"
  $PSQL "$query_games_played" > /dev/null

  # Check if it's a new best game
  local best_game_db=$($PSQL "SELECT best_game FROM users WHERE username='$username'")
  if [[ -z "$best_game_db" ]]; then # No best game yet, or NULL in DB which is returned as empty string
    local query_best_game="UPDATE users SET best_game = $guesses WHERE username='$username'"
    $PSQL "$query_best_game" > /dev/null
  elif [[ "$guesses" -lt "$best_game_db" ]]; then
    local query_best_game="UPDATE users SET best_game = $guesses WHERE username='$username'"
    $PSQL "$query_best_game" > /dev/null
  fi
}
echo "Enter your username:"
# Get username input
read username

# Check username length 
username="${username:0:22}"


# Check if username exists
user_data=$(get_user_data "$username")

if [[ -z "$user_data" ]]; then
  # New user
  echo "Welcome, $username! It looks like this is your first time here."
  insert_new_user "$username"
else
  # Existing user
  IFS='|' read -r games_played best_game <<< "$user_data"
  if [[ -z "$best_game" ]]; then
      best_game="N/A" # Handle NULL best_game from DB for display.
  fi
  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
fi

# Generate secret number
secret_number=$(( RANDOM % 1000 + 1 ))
echo "Guess the secret number between 1 and 1000:"
guesses=0

# Guessing loop
while true; do
  read guess

  if ! is_integer "$guess"; then
    echo "That is not an integer, guess again:"
    continue
  fi

  guesses=$((guesses + 1))

  if [[ "$guess" -gt "$secret_number" ]]; then
    echo "It's lower than that, guess again:"
  elif [[ "$guess" -lt "$secret_number" ]]; then
    echo "It's higher than that, guess again:"
  else
    echo "You guessed it in $guesses tries. The secret number was $secret_number. Nice job!"
    update_user_data "$username" "$guesses"
    break
  fi
done