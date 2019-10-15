FROM rocker/geospatial:3.5.3

RUN Rscript -e "options(repos = \
  list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2019-10-14/')); \
  install.packages('leaflet'); \
  install.packages('shiny'); \
  install.packages('mapview');"