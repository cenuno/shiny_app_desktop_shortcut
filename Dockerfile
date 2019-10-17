# Docker-based Geospatial toolkit for R, built on versioned Rocker images
# https://hub.docker.com/r/rocker/geospatial
FROM rocker/geospatial:3.5.3

# Install Ubuntu packages
# RUN apt-get update && apt-get install -y \
#     sudo \
#     gdebi-core

# # Download and install ShinyServer (latest version)
# RUN wget --no-verbose https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-12.04/x86_64/VERSION -O "version.txt" && \
#     VERSION=$(cat version.txt)  && \
#     wget --no-verbose "https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-12.04/x86_64/shiny-server-$VERSION-amd64.deb" -O ss-latest.deb && \
#     gdebi -n ss-latest.deb && \
#     rm -f version.txt ss-latest.deb

# Installing necessary R packages
RUN Rscript -e "options(repos = \
  list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2019-10-14/')); \
  install.packages('htmlwidgets'); \
  install.packages('leaflet'); \
  webshot::install_phantomjs(); \
  install.packages('shiny');"

# Copy configuration files into the Docker image
# COPY shiny-server.conf  /etc/shiny-server/shiny-server.conf

# # Copy local copy of Shiny app to the Docker image
# COPY /r/save_leaflet.R /srv/shiny-server/

# Make the ShinyApp available at port 80
# EXPOSE 80

# # Copy further configuration files into the Docker image
# COPY shiny-server.sh /usr/bin/shiny-server.sh

# copy the current folder into the path of the app
COPY . /usr/local/src/app

# set working directory to the app
WORKDIR /usr/local/src/app

# set the unix commands to run the app
CMD ["sh","laser.sh"]
