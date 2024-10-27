#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read INPUT

USER_NAME=$($PSQL "SELECT username FROM users WHERE username = '$INPUT'")
GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM users INNER JOIN games_info USING(user_id) WHERE username = '$USER_NAME'")
BEST_GAME=$($PSQL "SELECT MIN(total_guess) FROM users INNER JOIN games_info USING(user_id) WHERE username = '$USER_NAME'")

if [[ -z $USER_NAME ]]
  then
    INSERT_USER=$($PSQL "INSERT INTO users (username) VALUES ('$INPUT')")
    echo "Welcome, $INPUT! It looks like this is your first time here."
  else
    echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

RANDOM_NUMBER=$(( (RANDOM % 1000) + 1 ))

GUESS=1
echo "Guess the secret number between 1 and 1000:"

  while read NUM
  do
    if [[ ! $NUM =~ ^[0-9]+$ ]]
      then 
      echo "That is not an integer, guess again:"
      else
        if [[ $NUM -eq $RANDOM_NUMBER ]]
        then
        break;
        else 
          if [[ $NUM -gt $RANDOM_NUMBER ]]
          then
            echo -n "It's lower than that, guess again:"
           elif [[ $NUM -lt $RANDOM_NUMBER ]]
           then
            echo -n "It's higher than that, guess again:"
          fi
        fi
    fi
    GUESS=$(( $GUESS + 1 ))
  done

  if [[ $GUESS == 1 ]]
  then
    echo "You guessed it in $GUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"
  else
    echo "You guessed it in $GUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"
  fi

  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$INPUT'")
  INSERT_GAME=$($PSQL "INSERT INTO games_info (total_guess, user_id) VALUES ($GUESS, $USER_ID)")
