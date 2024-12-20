#!/bin/bash

# Program to schedule salon appoinments

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n***** Salon Services *****\n"

MAIN_MENU() {
	if [[ $1 ]]
  	then
    	echo -e "\n$1"
  	fi

	echo "Please choose a service:"
	echo -e "\n1) Cut\n2) Color\n3) Style"
	read SERVICE_ID_SELECTED

	# if input is not a number
	if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
	then
		# return to main menu
		MAIN_MENU "Not a valid number"
	else
		# find service
		SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
		# if service not valid
		if [[ -z $SERVICE_NAME ]]
		then
			# return to main menu
			MAIN_MENU "That is not an available service"
		else
			# get customer info
			echo -e "Please enter your phone number:"
			read CUSTOMER_PHONE
			CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
			# if customer doesn't exist
			if [[ -z $CUSTOMER_NAME ]]
			then
				# get customer name
				echo -e "Please enter your name:"
				read CUSTOMER_NAME

				# insert new customer
				INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) values('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
			fi

			# get appointment time
			echo -e "What time would you like to come for your appointment?"
			read SERVICE_TIME

			# get customer id
			CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

			# insert appointment
			INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

			echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed 's/ |/"/') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed 's/ |/"/')."
		fi
	fi
}

MAIN_MENU

