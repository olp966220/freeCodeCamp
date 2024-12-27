#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$((1 + $RANDOM % 10))

# get username
echo "Enter your username:"
read USER_NAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name = '$USER_NAME';")
# user id exists
if [[ $USER_ID ]]
then
  # get games_data
  GAMES_DATA=$($PSQL "SELECT COUNT(game_id), MIN(guesses) FROM games WHERE user_id = $USER_ID;")
  IFS="|" read GAMES_PLAYED BEST_GAME <<< $GAMES_DATA
  # print info
  echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else
  # user not exists
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
  # write user to database
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(user_name) VALUES ('$USER_NAME');")
  # get user id
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name = '$USER_NAME';")
fi


# play game
echo "Guess the secret number between 1 and 1000:"
read USER_INPUT

# input is not a number
if [[ ! $USER_INPUT =~ ^[0-9]+$ ]]
then
  echo "That is not an integer, guess again:"
fi

# compare
NUMBER_OF_GUESSES=1
while [[ $USER_INPUT != $SECRET_NUMBER ]];
do
  if [[ $USER_INPUT -lt $SECRET_NUMBER ]];
  then
    echo "It's lower than that, guess again:"
  elif [[ $USER_INPUT -gt $SECRET_NUMBER ]];
  then
    echo "It's higher than that, guess again:"
  fi
  read USER_INPUT
  ((NUMBER_OF_GUESSES++))
done
# guessed
if [[ $USER_INPUT == $SECRET_NUMBER ]]
then
  echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
  # write to games
  INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES);")
fi





