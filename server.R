#BIBLIOTECAS NECESSÁRIAS
library(shiny)

#CARREGAR MODELO
modelo = readRDS('model.rds')

#SERVIDOR

server<- function(input, output, session) {
  
  # Input Data
  datasetInput <- reactive({  
    
    df <- data.frame(
      Name = c("Idade",
               "Filhos",
               "Abortos induzidos",
               "Abortos espontaneos"),
      Value = as.character(c(input$idade,
                             input$paridade,
                             input$induzido,
                             input$espontaneo)),
      stringsAsFactors = FALSE)
    
    entrada <- t(df)
    write.table(entrada,"entrada.csv", sep=",", quote = FALSE, row.names = FALSE, col.names = FALSE)
    
    novos_dados <- read.csv(paste("entrada", ".csv", sep=""), header = TRUE)
    saida <- data.frame(Prediction=predict(modelo,novos_dados))
    print(saida)
    
  })
  
  # Status/Output Text Box
  output$contents <- renderPrint({
    if (input$botao>0) { 
      isolate("Resultado") 
    } else {
      return("Esperando entrada de dados.")
    }
  })
  
  # Prediction results table
  output$tabledata <- renderTable({
    if (input$botao>0) { 
      isolate(datasetInput()) 
    } 
  })
  
}