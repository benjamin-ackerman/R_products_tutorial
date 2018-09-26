library(shiny)
library(dplyr)
library(halloween)

shinyServer(function(input, output) {
  
  # Create the plot based on the two inputs of "n" and "bar"
  output$candyplot <- renderPlot({
    # Subset the data to just "bars" if "bar" == TRUE
    if(input$bar == TRUE){plot_dat = candy_data %>% filter(bar == 1)}
    if(input$bar == FALSE){plot_dat = candy_data}
    
    # Plot the top "n" candies
    plot_candy(plot_dat, n = input$n, candy_name_col = "competitorname", rank_col = "winpercent")
  })

})



















