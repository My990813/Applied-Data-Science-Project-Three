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
        background-color: #e60000 !important;
        color: white !important;
        border: none;
        font-weight: bold;
      }

      .btn-sale:hover {
        background-color: #cc0000 !important;
      }
      
      .balance {
        font-size: 1.5em;
        font-weight: bold;
        color: #007bff;
        margin-bottom: 20px;
      }
    "))
  ),

  # Balance display section
  fluidRow(
    column(12,
           div(class = "balance",
               textOutput("balance_display")
           )
    )
  ),
  
  tags$hr(),

  titlePanel("🛍️ Welcome to the Super Graphic Store"),
  tags$hr(),

  fluidRow(
    column(4,
           div(class = "card",
               imageOutput("image1", height = "150px"),
               div(class = "card-body",
                   h5("Plain Black Shirt"),
                   p("Minimalist and versatile — a wardrobe staple for anyone into clean aesthetics."),
                   actionButton("update", "Buy for $100 & -25% Sale", class = "btn-sale"),
                   textOutput("time")
               )
           )
    ),
    column(4,
           div(class = "card",
               imageOutput("image2", height = "150px"),
               div(class = "card-body",
                   h5("Code Shirt"),
                   p("Perfect for CS students and data geeks — rep your love for binary code in style."),
                   actionButton("buy2", "Buy for $75", class = "btn-primary"),
                   textOutput("buy_msg2")
               )
           )
    ),
    column(4,
           div(class = "card",
               imageOutput("image3", height = "150px"),
               div(class = "card-body",
                   h5("Graphic Shirt"),
                   p("Bold prints and expressive design — let your shirt do the talking."),
                   actionButton("buy3", "Buy for $50", class = "btn-primary"),
                   textOutput("buy_msg3")
               )
           )
    )
  ),

  tags$hr(),
  actionButton("updateNew", "Don’t Buy Anything", class = "btn-outline-danger"),
  textOutput("timeNew"),

  tags$hr(),
  h4("⭐ Rate the Super Graphic Store"),
  radioButtons("rating", label = NULL,
               choices = c("⭐" = 1, "⭐⭐" = 2, "⭐⭐⭐" = 3, "⭐⭐⭐⭐" = 4, "⭐⭐⭐⭐⭐" = 5),
               inline = TRUE),
  textOutput("thankyou"),

  tags$hr(),
  h4("💬 Leave a Comment"),
  textAreaInput("comment", label = NULL, 
                placeholder = "Tell us what you think or how we can improve!", 
                rows = 4),
  actionButton("submit_comment", "Submit Comment", class = "btn-success"),
  textOutput("comment_response"),

  tags$hr()
)

server <- function(input, output, session) {
  # Initialize user's balance
  balance <- reactiveVal(75)

  # Display the remaining balance in the custom format
  output$balance_display <- renderText({
    paste("💰 Balance: $", balance())
  })

  # Load images
  output$image1 <- renderImage({
    list(src = "item1.png", height = "150px")
  }, deleteFile = FALSE)

  output$image2 <- renderImage({
    list(src = "item2.png", height = "150px")
  }, deleteFile = FALSE)

  output$image3 <- renderImage({
    list(src = "item3.png", height = "150px")
  }, deleteFile = FALSE)

  # Buy message for item1
  output$time <- renderText({ 
    "You already bought it"
  }) |> bindEvent(input$update)

  # Buy message for item2
  output$buy_msg2 <- renderText({
    "You already bought it"
  }) |> bindEvent(input$buy2)

  # Buy message for item3
  output$buy_msg3 <- renderText({
    "You already bought it"
  }) |> bindEvent(input$buy3)

  # Message for not buying anything
  output$timeNew <- renderText({ 
    "Too shame"
  }) |> bindEvent(input$updateNew)

  # Disable other actions when buying or not buying
  observeEvent(input$update, {
    if (balance() >= 75) {
      balance(balance() - 75)  # Correct price for sale item
      disable("update")
      output$time <- renderText({
        "You purchased this item with the sale!"
      })
    } else {
      output$time <- renderText({
        "Insufficient funds to buy this item."
      })
    }
  })

  observeEvent(input$buy2, {
    if (balance() >= 75) {
      balance(balance() - 75)
      disable("buy2")
      output$buy_msg2 <- renderText({
        "You purchased this item!"
      })
    } else {
      output$buy_msg2 <- renderText({
        "Insufficient funds to buy this item."
      })
    }
  })

  observeEvent(input$buy3, {
    if (balance() >= 50) {
      balance(balance() - 50)
      disable("buy3")
      output$buy_msg3 <- renderText({
        "You purchased this item!"
      })
    } else {
      output$buy_msg3 <- renderText({
        "Insufficient funds to buy this item."
      })
    }
  })

  # Store rating
  output$thankyou <- renderText({
    req(input$rating)
    paste("Thanks for rating us", paste(rep("⭐", as.numeric(input$rating)), collapse = ""), "!")
  })

  # Comment submission
  observeEvent(input$submit_comment, {
    comment <- input$comment
    if (nchar(comment) > 0) {
      output$comment_response <- renderText({
        paste("Thank you for your feedback:", comment)
      })
    } else {
      output$comment_response <- renderText({
        "Please write something before submitting!"
      })
    }
  })
}

shinyApp(ui = ui, server = server)
