#how to lay out a user-interface
library(shiny)

#read an image in
wfarm <- base64enc::dataURI(file="www/UKwindfarm.png", mime="image/png")#add it to ui to print it

# Define UI ----
ui <- fluidPage(
  #add a title panel
  titlePanel("title panel"),
  
  sidebarLayout(
    sidebarPanel("sidebar panel",
                 h3("a button"),
                 actionButton(inputId = "my_submitstatus", label = "Submit"),
    checkboxGroupInput(inputId = "my_checkgroup", 
                       h3("Checkbox group"), 
                       choices = list("Woodland" = 1, 
                                      "Grassland" = 2, 
                                      "Urban" = 3),
                       selected = 1)),
    
    mainPanel("main panel"), position = c("right")),
  mainPanel(
    h1("This is the main heading for my app"),
    h2("here is a subheading"),
    p("This website will be to help planners assess potential windfarm development areas in Cumbria, and achieve a" ,strong("balance"), "between different",em("interest groups"),
"and other users.")),
#add image
img(src=wfarm)
)

# Define server logic ----
server <- function(input, output) {}

# Run the app ----
shinyApp(ui = ui, server = server)

