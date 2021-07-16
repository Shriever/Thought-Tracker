#!/bin/bash

# Displays a pop up menu that asks for what the user is thinking about.

# Saves response in a text file (or hopefully a DB).

USER_THOUGHT=$(zenity --entry --text="What are you thinking about?")
THOUGHT_CONNOTATION=$(zenity --list --title="Is this thought positive, negative or neutral?" --column="Feeling:" Positive Neutral Negative)


if [[ "${?}" -ne 0 ]]
then
  echo 'Something went wrong! :('
  exit 1
fi
DATE=$(date +%D)
TIME=$(date +%T)

echo "${USER_THOUGHT} | ${THOUGHT_CONNOTATION} | Date: ${DATE} ${TIME}" >> ~/thoughts.txt

