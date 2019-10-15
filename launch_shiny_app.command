#!/bin/bash

# create relative path to shiny file ----
# note: this requires the directory to be cloned in the user's
#       home directory (~)
SHINY_APP_PATH=~/shiny_app_desktop_shortcut/r/save_leaflet.r

# run commands with delay ----
runWithDelay () {
  # note: this code comes from a great SO answer
  #       https://unix.stackexchange.com/a/102959/370723
    sleep $1;
    shift;
    "${@}";
}

# launch shiny app ----
runWithDelay 3 open http://127.0.0.1:7990 &
Rscript $SHINY_APP_PATH
