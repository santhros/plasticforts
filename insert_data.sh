#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
FILENAME=games.csv
echo $($PSQL "TRUNCATE games, teams")
#
cat $FILENAME | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    # EValuate if the WINNER team exists in the table teams
    WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")"
    # If WINNER does not exist, create it
    if [[ -z $WINNER_ID ]]
    then
          WINNER_RESULT="$($PSQL "INSERT INTO teams(name) VALUES ('$WINNER')")"
    fi
    if [[ $WINNER_RESULT == "INSERT 0 1" ]]
    then
          echo "Insert team: $WINNER"
    fi
    WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")"
    # Evaluate if the OPPONENT team exists in the table teams
    OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")"
    # If OPPONENT does not exist, create it
    if [[ -z $OPPONENT_ID ]]
    then
          OPPONENT_RESULT="$($PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT')")"
    fi
    if [[ $OPPONENT_RESULT == "INSERT 0 1" ]]
    then
          echo "Insert team: $OPPONENT"
    fi
    OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")"
    # Insert the record in the games table
    INSERT_GAMES_RESULT="$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS) ")"
    if [[ $INSERT_GAMES_RESULT == "INSERT 0 1" ]]
    then
          echo "Insert games: $OPPONENT vs $WINNER"
    fi
  fi
done
