#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

tail -n +2 games.csv | cut -d, -f3,4 | tr ',' '\n' | sort | uniq > uniq_teams.txt

while read team
do
INSERT_INTO_TEAMS=$($PSQL "INSERT INTO teams(name) VALUES('$team');")
done < uniq_teams.txt

while read line
do
YEAR=$(echo "$line" | cut -d, -f1)
ROUND=$(echo "$line" | cut -d, -f2)
WINNER=$(echo "$line" | cut -d, -f3)
WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")
WINNER_GOALS=$(echo "$line" | cut -d, -f5)
OPPONENT=$(echo "$line" | cut -d, -f4)
OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")
OPPONENT_GOALS=$(echo "$line" | cut -d, -f6)
INSERT_INTO_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$WINNER_GOALS', '$OPPONENT_GOALS');")
done < <(tail -n +2 games.csv)
