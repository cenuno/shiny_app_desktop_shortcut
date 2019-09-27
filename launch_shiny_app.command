#!/bin/bash

# run commands with delay ----
runWithDelay () {
  # note: this code comes from a great SO answer
  #       https://unix.stackexchange.com/a/102959/370723
    sleep $1;
    shift;
    "${@}";
}

# launch shiny app ----
# note: for this to launch, you need to specify an absolute path
# TODO: find way to launch with relative path
runWithDelay 3 open http://127.0.0.1:7990 &
Rscript /Users/cristiannuno/RStudio_All/shiny_desktop/r/save_leaflet.r
