# runs shiny app in port 8080 localhost
shiny::runApp("r/save_leaflet.R",
              launch.browser = FALSE,
              port = 8080,
              host = "0.0.0.0")
