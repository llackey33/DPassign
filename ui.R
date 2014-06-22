# ui.R

library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Instances of Esophogeal Cancer in People Like You"),
  sidebarPanel(
    h3("Your Information"),
    radioButtons("age", "Age",
                 c("25-34 years old", "35-44 years old", "45-54 years old",
                   "55-64 years old", "65-74 years old", 
                   "75+ years old" = "6")),
    radioButtons("alc", "Average Daily Alcohol Consumption",
                 c("0-2 drinks", "3-5 drinks", "6-8 drinks", 
                   "9 or more drinks")),
    radioButtons("tob", "Average Daily Tobacco Consumption",
                 c("0-9 cigarettes", "10 or more cigarettes"))
  ),
  mainPanel(
    h4("Among people"), verbatimTextOutput("ageid"),
    h4("old who consumed on average"), verbatimTextOutput("alcid"), 
    h4("per day and"), verbatimTextOutput("tobid"), h4("per day,"),
    verbatimTextOutput("cases"), h4("out of"),
    verbatimTextOutput("controls"), h4("were diagnosed with esophogeal cancer.")
  )
))
