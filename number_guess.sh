#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -c"

RANDOM_NUMBER=$(shuf -i 1-10 -n 1)

NUMBER_OF_GUESSES=1

function GUESS_NUMBER() {
  read GUESS
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
  echo "That is not an integer, guess again:"
  ((NUMBER_OF_GUESSES++))
  GUESS_NUMBER
  elif [[ $GUESS -lt $RANDOM_NUMBER ]]
  then
  echo "It's higher than that, guess again:"
  ((NUMBER_OF_GUESSES++))
  GUESS_NUMBER
  elif [[ $GUESS -gt $RANDOM_NUMBER ]]
  then
  echo "It's lower than that, guess again:"
  ((NUMBER_OF_GUESSES++))
  GUESS_NUMBER
  else
  echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
  USER_ID=$(echo $($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME';") | grep -Eo '\s[0-9]+\s' | grep -Eo '[0-9]+')
  INSERT_GAME=$($PSQL "INSERT INTO games(user_id, score) VALUES($USER_ID, $NUMBER_OF_GUESSES);")
  fi
}

echo "Enter your username:"
read USERNAME

if [[ -z $USERNAME ]]
then
echo "Please enter a username to play"
exit
fi

USERNAME_QUERY=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME';")
git 
if [[ $USERNAME_QUERY =~ (0 rows) ]]
then
INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
echo "Welcome, $USERNAME! It looks like this is your first time here."
echo "Guess the secret number between 1 and 1000:"
GUESS_NUMBER "$USERNAME"
else
USER_ID=$(echo $($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME';") | grep -Eo '\s[0-9]+\s' | grep -Eo '[0-9]+')
GAMES_PLAYED=$(echo $($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id = '$USER_ID';") | grep -Eo '\s[0-9]+\s' | grep -Eo '[0-9]+')
BEST_GAME=$(echo $($PSQL "SELECT MIN(score) FROM games WHERE user_id = '$USER_ID';") | grep -Eo '\s[0-9]+\s' | grep -Eo '[0-9]+')
echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
echo "Guess the secret number between 1 and 1000:"
GUESS_NUMBER "$USERNAME"
fi