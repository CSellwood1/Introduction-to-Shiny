#how to lay out a user-interface
library(shiny)

# Define UI ----
ui <- fluidPage(
  #add a title panel
  titlePanel("title panel"),
  
  sidebarLayout(
    sidebarPanel("sidebar panel"),
    mainPanel("main panel"), position = c("right")),
  mainPanel(
    h1("This is the main heading for my app"),
    h2("here is a subheading"),
    p("This website will be to help planners assess potential windfarm development areas in Cumbria, and achieve a strong balance between different interest groups and other users."))
    
)

# Define server logic ----
server <- function(input, output) {}

# Run the app ----
shinyApp(ui = ui, server = server)

