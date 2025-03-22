library(shiny)
library(ggplot2)
library(dplyr)

# Load dataset
data <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data", 
                 header = FALSE, stringsAsFactors = TRUE)
colnames(data) <- c("age", "workclass", "fnlwgt", "education", "education_num", "marital_status", 
                    "occupation", "relationship", "race", "sex", "capital_gain", "capital_loss", 
                    "hours_per_week", "native_country", "prediction")

# UI
ui <- fluidPage(
  titlePanel("Trends in Demographics and Income"),
  p("Explore the difference between people who earn less than 50K and more than 50K. You can filter the data by country, then explore various demographic information."),
  
  # Task 2: Select Country
  fluidRow(
    column(4, 
           selectInput("country", "Country:", 
                       choices = unique(data$native_country), 
                       selected = "United-States"))
  ),
  
  # Task 3: Select Continuous Variable & Graph Type
  fluidRow(
    column(4, wellPanel(
      h4("Select a continuous variable and graph type"),
      radioButtons("cont_var", "Continuous:", 
                   choices = c("Age" = "age", "Hours per Week" = "hours_per_week")),
      radioButtons("plot_type", "Graph:", 
                   choices = c("Histogram" = "hist", "Boxplot" = "box"))
    )),
    
    # Task 5: Continuous Variable Plot
    column(8, plotOutput("contPlot"))
  ),
  
  # Task 4: Select Categorical Variable & Stacking Option
  fluidRow(
    column(4, wellPanel(
      h4("Select a categorical variable"),
      radioButtons("cat_var", "Categorical:", 
                   choices = c("Education" = "education", "Workclass" = "workclass", "Sex" = "sex")),
      checkboxInput("stacked", "Stack bars", FALSE)
    )),
    
    # Task 6: Categorical Variable Plot
    column(8, plotOutput("catPlot"))
  )
)

# Server Logic
server <- function(input, output) {
  # Filter data by country
  filtered_data <- reactive({
    data %>% filter(native_country == input$country)
  })
  
  # Plot continuous variable
  output$contPlot <- renderPlot({
    ggplot(filtered_data(), aes_string(x = input$cont_var, fill = "prediction")) +
      {if (input$plot_type == "hist") geom_histogram(bins = 30, alpha = 0.7, position = "identity") else geom_boxplot()} +
      facet_wrap(~prediction) +
      theme_minimal() +
      labs(title = paste("Trend of", input$cont_var), x = input$cont_var, y = "Count")
  })
  
  # Plot categorical variable
  output$catPlot <- renderPlot({
    ggplot(filtered_data(), aes_string(x = input$cat_var, fill = "prediction")) +
      geom_bar(position = ifelse(input$stacked, "stack", "dodge")) +
      theme_minimal() +
      labs(title = paste("Trend of", input$cat_var), x = input$cat_var, y = "Count")
  })
}

# Run App
shinyApp(ui = ui, server = server)
