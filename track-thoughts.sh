#!/bin/bash

# Displays a pop up menu that asks for what the user is thinking about.

# Saves response in a database using a python script

EMAIL=${1}
if [[ -z "${EMAIL}" ]]
then
  echo 'Usage: ./track-thoughts <Email Address>'
  exit 1
fi

USER_THOUGHT=$(zenity --entry --text="What are you thinking about?")

if [[ "${?}" -ne 0 ]]
then
  echo 'Something went wrong! :('
  exit 1
fi

THOUGHT_CONNOTATION=$(zenity --list --title="Is this thought positive, negative or neutral?" --column="Feeling:" Positive Neutral Negative)

if [[ "${?}" -ne 0 ]]
then
  echo 'Something went wrong! :('
  exit 1
fi

DATE=$(date +%D)
TIME=$(date +%T)

# save thought data to a DB using python
python3 postThought.py "${USER_THOUGHT}" "${THOUGHT_CONNOTATION}" "${DATE}" "${TIME}" "${EMAIL}"

# display thought to terminal
echo "${USER_THOUGHT} | ${THOUGHT_CONNOTATION}"

exit 0