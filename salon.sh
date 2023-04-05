#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

SERVICES_OFFERED=$($PSQL "SELECT service_id, name FROM services")

MAIN_MENU() {
    #echo -e "Please choose one of the following services:\n"
    echo "$SERVICES_OFFERED" | while read SERVICE_ID BAR NAME
    do
      # List the services offered
      echo "$SERVICE_ID) $NAME"
    done
    read SERVICE_ID_SELECTED
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    # Evaluate if service is null
    if [[ -z $SERVICE_NAME ]]
    then
          MAIN_MENU
    fi
    # Ask for the phone number
    echo -e "Please enter your phone number."
    read CUSTOMER_PHONE
    # Evaluate if the customer phone exists in the table customers
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    echo "El nombre es $CUSTOMER_NAME"
    if [[ -z $CUSTOMER_NAME ]] 
    then
          echo -e "Please enter your name."
          read CUSTOMER_NAME
          # We are going to insert the customer register
          INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    fi
    # Let's get the customer id
    echo "El customer NAME es $CUSTOMER_NAME"
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    echo "El customer ID es $CUSTOMER_ID"
    echo -e "Please enter your time for the appointment."
    read SERVICE_TIME
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN_MENU
