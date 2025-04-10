

# Application 1

library(shiny)
library(bslib)
library(shinyjs)  

ui <- page_fluid(
  useShinyjs(),  
  
  imageOutput("image"),
  actionButton("update", "Buy in $75"), 
  textOutput("time"),
  
  actionButton("updateNew", "Not Buy"), 
  textOutput("timeNew")
)

server <- function(input, output, session) {
  output$image <- renderImage({ 
    list(src = "black.png", height = "90%") 
  }, deleteFile = FALSE) 
  
  output$time <- renderText({ 
    format("You already bought it")
  }) |> bindEvent(input$update)
  
  output$timeNew <- renderText({ 
    format("Too shame")
  }) |> bindEvent(input$updateNew)
  
  observeEvent(input$update, {
    disable("updateNew")  
  })
  
  observeEvent(input$updateNew, {
    disable("update")  
  })
}

shinyApp(ui = ui, server = server)
