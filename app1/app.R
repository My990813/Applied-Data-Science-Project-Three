library(shiny)
library(bslib)
library(shinyjs)

ui <- fluidPage(
  theme = bs_theme(bootswatch = "minty", version = 5),
  useShinyjs(),
  
  tags$head(
    tags$style(HTML("
      .card {
        background-color: #f8f9fa !important; 
        border-radius: 10px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      }

      .btn-sale {
        background-color: #e60000 !important;  /* true red */
        color: white !important;
        border: none;
      }

      .btn-sale:hover {
        background-color: #cc0000 !important;
      }
    "))
  ),
  
  titlePanel("🛍️ Welcome to the Super Graphic Store"),
  tags$hr(),
  
  fluidRow(
    column(4,
           div(class = "card",
               img(src = "item1.png", height = "200px", class = "card-img-top"),
               div(class = "card-body",
                   h5("Black Shirt"),
                   p("Classic black shirt — sleek, stylish, and always in fashion."),
                   actionButton("update", "Buy for $100 (-25% Sale!)", class = "btn-primary"),
                   textOutput("time")
               )
           )
    ),
    column(4,
           div(class = "card",
               img(src = "item2.png", height = "200px", class = "card-img-top"),
               div(class = "card-body",
                   h5("Jeans"),
                   p("Comfortable blue jeans — casual yet cool. Goes with anything."),
                   actionButton("buy2", "Buy for $75", class = "btn-primary")
               )
           )
    ),
    column(4,
           div(class = "card",
               img(src = "item3.png", height = "200px", class = "card-img-top"),
               div(class = "card-body",
                   h5("Black Dress"),
                   p("Elegant black dress — perfect for every evening occasion."),
                   actionButton("buy3", "Buy for $50", class = "btn-primary")
               )
           )
    )
  ),
  
  tags$hr(),
  actionButton("updateNew", "Don’t Buy Anything", class = "btn-outline-danger"),
  textOutput("timeNew")
)

server <- function(input, output, session) {
  output$time <- renderText({ 
    "You already bought it"
  }) |> bindEvent(input$update)
  
  output$timeNew <- renderText({ 
    "Too shame"
  }) |> bindEvent(input$updateNew)
  
  observeEvent(input$update, {
    disable("updateNew")
  })
  
  observeEvent(input$updateNew, {
    disable("update")
  })
}

shinyApp(ui = ui, server = server)
