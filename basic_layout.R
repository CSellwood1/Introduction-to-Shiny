#how to lay out a user-interface
library(shiny)

#read an image in
wfarm <- base64enc::dataURI(file="www/UKwindfarm.png", mime="image/png")#add it to ui to print it
#read in a csv of habitat cover in GB
habitats<- read.csv("C:\\Users\\nick\\Documents\\Newcastle\\Fourth Year\\BIO8068 Management and Visualisation of Data\\Introduction-to-Shiny\\www\\habitats.csv")


# Define UI ----
ui <- fluidPage(
  #add a title panel
  titlePanel("title panel"),
  
  sidebarLayout(
    sidebarPanel("sidebar panel",
                 h3("a button"),
                 actionButton(inputId = "my_submitstatus", label = "Submit"),
    radioButtons(inputId = "selection_group", 
                       h3("Select a habitat"), 
                       choices = list("Woodland" = 1, 
                                      "Grassland" = 2, 
                                      "Urban" = 3),
                       selected = 1),
    sliderInput("bins",
                "Bin number:",
                min = 1,
                max = 100,
                value = 30)),
    
    mainPanel("main panel"), position = c("right")),
  mainPanel(
    h1("This is the main heading for my app"),
    h2("here is a subheading"),
    p("This website will be to help planners assess potential windfarm development areas in Cumbria, and achieve a" ,strong("balance"), "between different",em("interest groups"),
"and other users."),

plotOutput(outputId = "habitats_plot")
),
#add image
img(src=wfarm)
)

# Define server logic ----
server <- function(input, output) {
  output$habitats_plot <- renderPlot(hist(habitats[, as.numeric(input$selection_group)]))
  
}

# Run the app ----
shinyApp(ui = ui, server = server)

