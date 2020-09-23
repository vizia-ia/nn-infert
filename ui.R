library(shiny)

#FRONT END - USUÁRIO

ui <- pageWithSidebar(
  
  # Page header
  headerPanel('NN infert'),
  
  # Input values
  sidebarPanel(
    
    tags$label(h3('Entre com os dados a seguir')),
    
    numericInput(inputId = 'idade', label = 'Qual a idade da paciente?',
                 value = 0, min = 10, max = 60, step = 1, width = NULL),
    
    numericInput(inputId = 'paridade', label = 'A paciente tem quantos filhos?',
                 value = 0, min = 1, max = 6, step = 1, width = NULL),
    
    numericInput(inputId = 'induzido', label = 'A paciente teve quantos abortos induzidos?',
                 value = 0, min = 0, max = 2, step = 1, width = NULL),
    
    numericInput(inputId = 'espontaneo', label = 'A paciente teve quantos abortos induzidos?',
                 value = 0, min = 0, max = 2, step = 1, width = NULL),
    
    actionButton(inputId = "botao", label = "Calcule", 
                 class = "btn btn-primary")
  ),
  
  mainPanel(
    tags$label(h3('Status/Output')), # Texto do código Status/Output, desnecessário isso aqui...
    verbatimTextOutput('contents'),
    h3('Probabilidade da paciente ser infértil'),
    tableOutput('tabledata') # Resultado da previsão
    
  )
)