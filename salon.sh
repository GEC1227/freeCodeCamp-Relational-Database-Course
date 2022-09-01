#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -c"

DISPLAY_MAIN_MENU() {
if [[ $1 ]]
then
echo "$1"
fi

NUMSERVICES=$(echo $($PSQL "SELECT COUNT(service_id) FROM services;") | grep -Eo '\s{1}[0-9]+\s{1}')

i=1

while [[ $i -le $NUMSERVICES ]]
do
SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = '$i';" | grep -Eo '[A-Z]{1}[a-z]+')

echo $i\) "$SERVICE"

((i++))
done
}

DISPLAY_MAIN_MENU

echo -e "\nWelcome to the salon! Please select a service from the menu above: "
read SERVICE_ID_SELECTED

if [[ ! $SERVICE_ID_SELECTED =~ [1-5]{1} ]]
then
while [[ ! $SERVICE_ID_SELECTED =~ [1-5]{1} ]]
do
echo -e "\nPlease select a NUMBER from 1 to 5.\n"

DISPLAY_MAIN_MENU

echo -e "\nWelcome to the salon! Please select a service from the menu above: "
read SERVICE_ID_SELECTED
done
fi

echo -e "\nThanks! May I have your phone number? "
read CUSTOMER_PHONE

CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")

if [[ $CUSTOMER_NAME =~ '(0 rows)' ]]
then
echo -e "\nHmm ... We don't seem to have your phone number in our records. May I have your name, please? "
read CUSTOMER_NAME

INSERT_CUSTOMER_INFO=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE');")

echo -e "\nThanks $CUSTOMER_NAME! I've entered you into our database. What time would you like to schedule your appointment? "
read SERVICE_TIME

CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';" | grep -Eo '\s[0-9]+')

INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME');")

SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'" | grep -Eo '[A-Z]{1}[a-z]+')

echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
else
PARSED_CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed -E -e 's/name[^A-Za-z]+//' -e 's/\s\(.*//')

echo -e "\nThanks $PARSED_CUSTOMER_NAME! What time would you like to schedule your appointment? "
read SERVICE_TIME

CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';" | grep -Eo '\s[0-9]+')

INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME');")

SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'" | grep -Eo '[A-Z]{1}[a-z]+')

echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $PARSED_CUSTOMER_NAME."
fi

