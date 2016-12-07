get_libraries <- function(filenames_list) { 
  lapply(filenames_list,function(thelibrary){    
    if (do.call(require,list(thelibrary)) == FALSE) 
      do.call(install.packages,list(thelibrary)) 
    do.call(library,list(thelibrary))
  })
}

libraries_used=c("stringr","gtools","foreign","reshape2","digest","timeDate","devtools","knitr","graphics",
                 "grDevices","xtable","sqldf","stargazer","TTR","quantmod","shiny",
                 "Hmisc","vegan","fpc","GPArotation","FactoMineR","cluster",
                 "psych","stringr","googleVis", "png","ggplot2","googleVis", "gridExtra","RcppArmadillo","xts","DescTools")

get_libraries(libraries_used)

options(stringsAsFactors=FALSE)

library(Hmisc)  # for latexTranslate

loading_timer <- function(text = "Calculation in progress...",
                          imgused = "www/loading.gif", wait=1000) {
  tagList(
    singleton(tags$head(
      tags$link(rel="stylesheet", type="text/css",href="style.css")
    ))
    ,div(class="loading-timer",p(text),img(src=imgused))
    ,tags$script(sprintf(
      "	setInterval(function(){
      if ($('html').hasClass('shiny-busy')) {
      setTimeout(function() {
      if ($('html').hasClass('shiny-busy')) {
      $('div.loading-timer').show()
      }
      }, %d)  		    
      } else {
      $('div.loading-timer').hide()
      }
},100)
      ",wait)
    )
  )	
  }


#####

#
#
#




