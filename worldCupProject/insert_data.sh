#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE TABLE teams, games")
# get teams (from winners)
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
	if [[ $ROUND != 'round' ]]
	then
		# get winner team_id
    echo Winner is $WINNER - Opponent is $OPPONENT
		TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")	
		# if not found
		if [[ -z $TEAM_ID ]]
		then
			# insert team
			echo $($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      # get next team_id
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")	
		fi
  fi
done
# get teams (from losers)
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $ROUND != 'round' ]]
	then
		# get opponent team_id
		TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")	
		# if not found
		if [[ -z $TEAM_ID ]]
		then
			# insert team
			echo $($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      # get next team_id
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")	
		fi
		
	fi
done
# get games
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $ROUND != 'round' ]]
	then
		# get winner and opponent ids
		WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
		OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
		# get game_id
		GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year='$YEAR' AND round='$ROUND' AND winner_id='$WINNER_ID'")
		# if not found
			# insert game
			echo $($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$WINNER_GOALS', '$OPPONENT_GOALS')")
			# get next game_id
			GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year='$YEAR' AND round='$ROUND' AND winner_id='$WINNER_ID'")
	fi
done