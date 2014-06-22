# server.r

fxn <- function(x, y, z) {
  library(datasets)
  data <- esoph
  age <- as.numeric(substr(x, 1, 1))
  alc <- as.numeric(substr(y, 1, 1))
  tob <- as.numeric(substr(z, 1, 1))
  ages <- names(table(data$agegp))
  alcs <- names(table(data$alcgp))
  tobs <- names(table(data$tobgp))
  if (tob == 0) {
    tmp <- data[data$agegp == ages[age - 1] &
                  data$alcgp == alcs[alc / 3 + 1] &
                  data$tobgp == tobs[1], ]
  } else {
    tmp <- data[data$agegp == ages[age - 1] &
                  data$alcgp == alcs[alc / 3 + 1] &
                  data$tobgp != tobs[1], ]
  }
  cases <- sum(as.numeric(tmp$ncases))
  controls <- sum(as.numeric(tmp$ncontrols))
  out <- c(cases, cases + controls)
  return(out)
}

fxn.cases <- function(fxn.OUT) {
  return(fxn.OUT[1])
}

fxn.controls <- function(fxn.OUT) {
  return(fxn.OUT[2])
}

library(shiny)

shinyServer(
  function(input, output) {
    output$ageid <- renderPrint({input$age})
    output$alcid <- renderPrint({input$alc})
    output$tobid <- renderPrint({input$tob})
    output$cases <- renderPrint({fxn.cases(fxn(input$age, input$alc, 
                                               input$tob))})
    output$controls <- renderPrint({fxn.controls(fxn(input$age, input$alc, 
                                                     input$tob))})
  }
)
