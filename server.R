library(shiny)
source("dataController/cancionesController.R")
source("dataController/emisoraController.R")
source("functions.R")

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  
  dataCanciones = getDataCanciones()
  dRCanciones <-
    reactiveValues(data = getTable(dataCanciones, "canciones"))
  
  dataEmisoras = getDataEmisoras()
  dREmisoras <-
    reactiveValues(data = getTable(dataEmisoras, "emisoras"))
  
  observeEvent(input$btnGuardarCancion, {
    idc = as.numeric(input$idcancion)
    if (idc > 0) {
      editarCancion(idc, input$nombrecancion)
    } else{
      guardarCancion(input$nombrecancion)
    }
    updateNumericInput(session, "idcancion", value = 0)
    updateNumericInput(session, "nombrecancion", value = "")
    dataCanciones = getDataCanciones()
    dRCanciones$data = getTable(dataCanciones, "canciones")
  })
  
  observeEvent(input$button_canciones_edit, {
    selectedRow <- as.numeric(strsplit(input$button_canciones_edit, "_")[[1]][3])
    for (i in seq_len(nrow(dataCanciones))) {
      if (dataCanciones[i,][1] == selectedRow) {
        updateNumericInput(session, "idcancion", value = as.numeric(dataCanciones[i,][1]))
        updateNumericInput(session, "nombrecancion", value = as.character(dataCanciones[i,][2]))
      }
    }
  })
  
  observeEvent(input$button_canciones_delete, {
    selectedRow <- as.numeric(strsplit(input$button_canciones_delete, "_")[[1]][3])
    borrarCancion(selectedRow)
    dataCanciones = getDataCanciones()
    dRCanciones$data = getTable(dataCanciones, "canciones")
  })
  
  
  observe({
    output$tablaCanciones <- DT::renderDataTable(
      dRCanciones$data,
      server = FALSE,
      escape = FALSE,
      selection = 'none'
    )
  })
}