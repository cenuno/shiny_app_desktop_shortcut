#!/bin/bash

# create relative path to shiny file ----
# note: this requires the directory to be cloned in the user's
#       home directory (~)
#SHINY_APP_PATH=r/run_app.R

# run commands with delay ----
runWithDelay () {
  # note: this code comes from a great SO answer
  #       https://unix.stackexchange.com/a/102959/370723
    sleep $1;
    shift;
    "${@}";
}

# launch shiny app ----
runWithDelay 3 open http://0.0.0.0:8080 &
Rscript r/run_app.R