#!/bin/bash

# change into the shiny_app_desktop_shortcut directory ----
cd shiny_app_desktop_shortcut/

# run commands with delay ----
runWithDelay () {
  # note: this code comes from a great SO answer
  #       https://unix.stackexchange.com/a/102959/370723
    sleep $1;
    shift;
    "${@}";
}

# launch shiny app ----
# note: requires the working directory to be
#       ~/shiny_app_desktop_shortcut/
runWithDelay 3 open http://127.0.0.1:7990 &
Rscript r/save_leaflet.r
