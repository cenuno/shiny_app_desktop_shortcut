# Save a Shiny App as a Desktop Shortcut

Packaging your [Shiny App](https://shiny.rstudio.com/) as a [Desktop Shortcut](https://www.pcmag.com/encyclopedia/term/51285/shortcut) will help non-technical stakeholders interact with your code. By allowing them to simply double-click on an icon, you're showing your work without needing them to see your code.

## Launching the Shiny App

Double-click on the file `launch_shiny_app.command`. This type of file is an executable file that does two things:

1. It runs the `r/save_leaflet.r` file; and
2. It opens the default browser so the user can see the Shiny app.

## Notes

### File Permission

When you open `launch_shiny_app.command`, it might not execute because the file did not maintain the appropriate access privilege. [To change permissions so the file does execute](https://askubuntu.com/a/29593/959090), run the following in the [Terminal](https://support.apple.com/guide/terminal/open-or-quit-terminal-apd5265185d-f365-44cb-8b09-71a064a42125/mac):

```bash
chmod u+x launch_shiny_app.command
```
### Credit
This repo was heavily influenced by Kevin Rosamont's Dec. 2017 blog [*Launching your shiny app in 2 clicks*](http://blog.rdata.lu/post/2017-12-26-launching-your-shiny-app-in-2-clicks/). The Shiny app [used in this example](r/save_leaflet.r) was made from a [Stack Overflow](https://stackoverflow.com/a/49332143/7954106) post.

## Session Information

```
─ Session info ───────────────────────────────────────────────────────
 setting  value                       
 version  R version 3.5.3 (2019-03-11)
 os       macOS Mojave 10.14.4        
 system   x86_64, darwin15.6.0        
 ui       RStudio                     
 language (EN)                        
 collate  en_US.UTF-8                 
 ctype    en_US.UTF-8                 
 tz       America/Los_Angeles         
 date     2019-09-26                  

─ Packages ───────────────────────────────────────────────────────────
 package     * version date       lib source        
 assertthat    0.2.0   2017-04-11 [1] CRAN (R 3.5.0)
 base64enc     0.1-3   2015-07-28 [1] CRAN (R 3.5.0)
 callr         3.2.0   2019-03-15 [1] CRAN (R 3.5.2)
 class         7.3-15  2019-01-01 [1] CRAN (R 3.5.3)
 classInt      0.3-1   2018-12-18 [1] CRAN (R 3.5.0)
 cli           1.0.1   2018-09-25 [1] CRAN (R 3.5.0)
 codetools     0.2-16  2018-12-24 [1] CRAN (R 3.5.3)
 colorspace    1.4-0   2019-01-13 [1] CRAN (R 3.5.2)
 crayon        1.3.4   2017-09-16 [1] CRAN (R 3.5.1)
 crosstalk     1.0.0   2016-12-21 [1] CRAN (R 3.5.0)
 DBI           1.0.0   2018-05-02 [1] CRAN (R 3.5.0)
 digest        0.6.18  2018-10-10 [1] CRAN (R 3.5.0)
 e1071         1.7-0.1 2019-01-21 [1] CRAN (R 3.5.2)
 htmltools     0.3.6   2017-04-28 [1] CRAN (R 3.5.0)
 htmlwidgets   1.3     2018-09-30 [1] CRAN (R 3.5.0)
 httpuv        1.5.0   2019-03-15 [1] CRAN (R 3.5.2)
 jsonlite      1.6     2018-12-07 [1] CRAN (R 3.5.0)
 later         0.8.0   2019-02-11 [1] CRAN (R 3.5.2)
 lattice       0.20-38 2018-11-04 [1] CRAN (R 3.5.3)
 leaflet     * 2.0.2   2018-08-27 [1] CRAN (R 3.5.0)
 magrittr      1.5     2014-11-22 [1] CRAN (R 3.5.0)
 mapview     * 2.6.3   2018-12-19 [1] CRAN (R 3.5.0)
 mime          0.6     2018-10-05 [1] CRAN (R 3.5.0)
 munsell       0.5.0   2018-06-12 [1] CRAN (R 3.5.0)
 png           0.1-7   2013-12-03 [1] CRAN (R 3.5.0)
 processx      3.3.0   2019-03-10 [1] CRAN (R 3.5.2)
 promises      1.0.1   2018-04-13 [1] CRAN (R 3.5.0)
 ps            1.3.0   2018-12-21 [1] CRAN (R 3.5.0)
 R6            2.4.0   2019-02-14 [1] CRAN (R 3.5.2)
 raster        2.8-19  2019-01-30 [1] CRAN (R 3.5.2)
 Rcpp          1.0.0   2018-11-07 [1] CRAN (R 3.5.0)
 rlang         0.3.1   2019-01-08 [1] CRAN (R 3.5.2)
 rsconnect     0.8.13  2019-01-10 [1] CRAN (R 3.5.2)
 rstudioapi    0.9.0   2019-01-09 [1] CRAN (R 3.5.2)
 satellite     1.0.1   2017-10-18 [1] CRAN (R 3.5.0)
 scales        1.0.0   2018-08-09 [1] CRAN (R 3.5.0)
 sessioninfo   1.1.1   2018-11-05 [1] CRAN (R 3.5.0)
 sf            0.7-3   2019-02-21 [1] CRAN (R 3.5.2)
 shiny       * 1.2.0   2018-11-02 [1] CRAN (R 3.5.0)
 sp            1.3-1   2018-06-05 [1] CRAN (R 3.5.0)
 units         0.6-2   2018-12-05 [1] CRAN (R 3.5.0)
 viridisLite   0.3.0   2018-02-01 [1] CRAN (R 3.5.0)
 webshot       0.5.1   2018-09-28 [1] CRAN (R 3.5.0)
 withr         2.1.2   2018-03-15 [1] CRAN (R 3.5.0)
 xtable        1.8-3   2018-08-29 [1] CRAN (R 3.5.0)
 yaml          2.2.0   2018-07-25 [1] CRAN (R 3.5.0)

[1] /Library/Frameworks/R.framework/Versions/3.5/Resources/library
```