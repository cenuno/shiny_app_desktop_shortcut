#
# Author:   Cristian E. Nuno
# Date:     September 26, 2019
# Purpose:  A shiny app that allows the user to 
#           download a PNG of a leaflet map where the user
#           selects a list of points to be displayed on the map
#

# load necessary packages ----
library(shiny)
library(leaflet)
library(mapview)

# create user interface -----
ui <- 
  fluidPage(
    leafletOutput(outputId = "map"), 
    downloadButton(outputId = "save"), 
    textOutput(outputId = "old"), 
    textOutput(outputId = "new")
  )

# create server -----
server <- function(input, output, session) {
  
  # create foundational map ----
  map <- reactive({
    leaflet() %>%
      setView(lng = -117, lat = 37, zoom = 7) %>%
      addTiles() %>%
      addMarkers(lng = -115.172813, 
                 lat = 36.114647,
                 group = "Vegas") %>%
      addMarkers(lng = -119.538330, 
                 lat = 37.865101, 
                 group = "Yosemite") %>%
      addLayersControl(overlayGroups = c("Vegas", "Yosemite"),
                       options = layersControlOptions(collapsed = FALSE)) %>%
      hideGroup(group = "Yosemite")
  })
  
  # render foundational map ----
  output$map <- renderLeaflet({
    map()
  })
  
  # create reactive leaflet maps based on the user's actions ----
  user.map <- reactive({
    
    # create a series of if-else statements that flag user's click events -----
    # adding/removing overlay groups
    # and modify the map to meet the user's 
    # specifications
    if(is.null(input$map_groups)){
      
      # show no markers when no overlay groups are selected -----
      user.map <-
        map() %>%
        setView(lng = input$map_center$lng,
                lat = input$map_center$lat,
                zoom = input$map_zoom) %>%
        hideGroup(group = "Vegas") %>%
        hideGroup(group = "Yosemite") %>%
        removeLayersControl()
      
      # remove the zoom control from the map
      user.map$x$options <-
        append(
          x = user.map$x$options, 
          values = list("zoomControl" = FALSE)
        )
      
      # return user.map to the Global Environment
      return(user.map)
        
    } else if(identical(x = c( "Vegas", "Yosemite"), 
                        y = input$map_groups)){
      
      # show all markers when both groups are selected -----
      user.map <- 
        map() %>%
        setView(lng = input$map_center$lng,
                lat = input$map_center$lat,
                zoom = input$map_zoom) %>%
        showGroup(group = "Vegas") %>%
        showGroup(group = "Yosemite") %>%
        removeLayersControl() 
      
      # remove the zoom control from the map
      user.map$x$options <-
        append(
          x = user.map$x$options, 
          values = list("zoomControl" = FALSE)
        )
      
      # return user.map to the Global Environment
      return(user.map)
      
    } else if(input$map_groups == "Vegas"){
      
      # show only the Vegas group -----
      user.map <-
        map() %>%
        setView(lng = input$map_center$lng,
                lat = input$map_center$lat,
                zoom = input$map_zoom) %>%
        removeLayersControl()
      
      # remove the zoom control from the map
      user.map$x$options <-
        append(
          x = user.map$x$options, 
          values = list("zoomControl" = FALSE)
        )
      
      # return user.map to the Global Environment
      return(user.map)
      
    } else if(input$map_groups == "Yosemite"){
    
      # show only the Yosemite group -----
      user.map <-
        map() %>%
        setView(lng = input$map_center$lng,
                lat = input$map_center$lat,
                zoom = input$map_zoom) %>%
        hideGroup(group = "Vegas") %>%
        showGroup(group = "Yosemite") %>%
        removeLayersControl()
      
      # remove the zoom control from the map
      user.map$x$options <-
        append(
          x = user.map$x$options, 
          values = list("zoomControl" = FALSE )
        )
      
      # return user.map to the Global Environment
      return( user.map )
        
      } 
  })
  
  # enable the user to download a local PNG file of the leaflet map ----
  output$save <- downloadHandler(
    filename = "map.png",
    content = function(file){
      
      # place the reactive leaflet map inside of mapshot to 
      # save and download the map as a png
      mapshot(x = user.map(), file = file)
    }
  )
}

# run the shiny app ----
# note: the port is a communication endpoint 
#       (nothing special about 7990, just followed this blog:
#       http://blog.rdata.lu/post/2017-12-26-launching-your-shiny-app-in-2-clicks/)
shinyApp(ui, server, options = list("port" = 7990))

# end of script #
