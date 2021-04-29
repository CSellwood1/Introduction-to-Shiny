#how to lay out a user-interface
library(shiny)

# Define UI ----
ui <- fluidPage(
  #add a title panel
  titlePanel("title panel"),
  
  sidebarLayout(
    sidebarPanel("sidebar panel"),
    mainPanel("main panel")
  )
  
)

# Define server logic ----
server <- function(input, output) {}

# Run the app ----
shinyApp(ui = ui, server = server)

