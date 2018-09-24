library(shiny)
library(halloween)

shinyUI(fluidPage(

  # Title of the Shiny App:
  titlePanel("What are the most popular Halloween candies?"),

  # Show the options to customize the plot in a sidebar panel:
  sidebarLayout(
    sidebarPanel(
      # Have a slider for number of candies to plot:
      sliderInput("n",
                  "Number of top candies to plot:",
                  min = 1,
                  max = nrow(candy_data),
                  value = 10),
      # Have a checkbox indicating if the candy comes as a bar or not
      checkboxInput("bar",
                    "Only show candies that are packaged as a bar",
                    FALSE
      )
    ),

    # Show a plot of the top rated candies
    mainPanel(
      plotOutput("candyplot")
    )
  )
))
