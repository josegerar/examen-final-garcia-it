library(shiny)
source("functions.R")
source("dataController/cancionesController.R")
source("dataController/emisoraController.R")
source("dataController/programaRadialController.R")

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  #carga de datos-------------------------------------------------------
  dataCanciones = getDataCanciones()
  dRCanciones <-
    reactiveValues(data = getTable(dataCanciones, "canciones"))
  
  dataEmisoras = getDataEmisoras()
  dREmisoras <-
    reactiveValues(data = getTable(dataEmisoras, "emisoras"))
  
  dataProgramasRadiales = getDataProgramaRadial()
  dRProgramasRadiales <-
    reactiveValues(data = getTable(dataProgramasRadiales, "programasradiales"))
  #---------------------------------------------------------------------
  
  #eventos de control de crud de canciones------------------------------
  observeEvent(input$btnGuardarCancion, {
    idc = as.numeric(input$idcancion)
    if (idc > 0) {
      editarCancion(idc, input$nombrecancion)
    } else{
      guardarCancion(input$nombrecancion)
    }
    updateNumericInput(session, "idcancion", value = 0)
    updateTextInput(session, "nombrecancion", value = "")
    dataCanciones = getDataCanciones()
    dRCanciones$data = getTable(dataCanciones, "canciones")
  })
  
  observeEvent(input$button_canciones_edit, {
    selectedRow <- as.numeric(strsplit(input$button_canciones_edit, "_")[[1]][3])
    for (i in seq_len(nrow(dataCanciones))) {
      if (dataCanciones[i,][1] == selectedRow) {
        updateNumericInput(session, "idcancion", value = as.numeric(dataCanciones[i,][1]))
        updateTextInput(session, "nombrecancion", value = as.character(dataCanciones[i,][2]))
      }
    }
  })
  
  observeEvent(input$button_canciones_delete, {
    selectedRow <- as.numeric(strsplit(input$button_canciones_delete, "_")[[1]][3])
    borrarCancion(selectedRow)
    dataCanciones = getDataCanciones()
    dRCanciones$data = getTable(dataCanciones, "canciones")
  })
  #--------------------------------------------------------------------
  
  #eventos de control de crud de emisoras------------------------------
  observeEvent(input$btnGuardarEmisora, {
    idc = as.numeric(input$idemisora)
    if (idc > 0) {
      editarEmisora(idc, input$nombreemisora, input$canalEmisora)
    } else{
      guardarEmisora(input$nombreemisora, input$canalEmisora)
    }
    updateNumericInput(session, "idemisora", value = 0)
    updateTextInput(session, "nombreemisora", value = "")
    updateTextInput(session, "canalEmisora", value = "")
    dataEmisoras = getDataEmisoras()
    dREmisoras$data = getTable(dataEmisoras, "emisoras")
  })
  
  observeEvent(input$button_emisoras_edit, {
    selectedRow <- as.numeric(strsplit(input$button_emisoras_edit, "_")[[1]][3])
    for (i in seq_len(nrow(dataEmisoras))) {
      if (dataEmisoras[i,][1] == selectedRow) {
        updateNumericInput(session, "idemisora", value = as.numeric(dataEmisoras[i,][1]))
        updateTextInput(session, "nombreemisora", value = as.character(dataEmisoras[i,][2]))
        updateTextInput(session, "canalEmisora", value = as.character(dataEmisoras[i,][3]))
      }
    }
  })
  
  observeEvent(input$button_emisoras_delete, {
    selectedRow <- as.numeric(strsplit(input$button_emisoras_delete, "_")[[1]][3])
    borrarEmisora(selectedRow)
    dataEmisoras = getDataEmisoras()
    dREmisoras$data = getTable(dataEmisoras, "emisoras")
  })
  
  #eventos de control de crud de programa_radial-----------------------------------------------------
  observeEvent(input$btnGuardarProgramaRadial, {
    idc = as.numeric(input$idprogramaradial)
    if (idc > 0) {
      editarProgramaRadial(
        idc, 
        input$nombreprogramaradial, 
        input$selectemisoraprogramaradial,
        strftime(input$horainicioprogramaradial, "%R"),
        strftime(input$horafinprogramaradial, "%R"),
        input$selectinteractivoprogramaradial
      )
    } else{
      guardarProgramaRadial(
        input$nombreprogramaradial, 
        input$selectemisoraprogramaradial,
        strftime(input$horainicioprogramaradial, "%R"),
        strftime(input$horafinprogramaradial, "%R"),
        input$selectinteractivoprogramaradial
      )
    }
    updateNumericInput(session, "idprogramaradial", value = 0)
    updateTextInput(session, "nombreprogramaradial", value = "")
    dataProgramasRadiales = getDataProgramaRadial()
    dRProgramasRadiales <-
      reactiveValues(data = getTable(dataProgramasRadiales, "programasradiales"))
  })
  
  #--------------------------------------------------------------------------------------------------
  
  #carga de datos en las datatables------------------------------------------------------------------
  observe({
    output$tablaCanciones <- DT::renderDataTable(
      dRCanciones$data,
      server = FALSE,
      escape = FALSE,
      selection = 'none'
    )
    
    output$tablaEmisoras <- DT::renderDataTable(
      dREmisoras$data,
      server = FALSE,
      escape = FALSE,
      selection = 'none'
    )
    
    output$tablaProgramaRadial <- DT::renderDataTable(
      dRProgramasRadiales$data,
      server = FALSE,
      escape = FALSE,
      selection = 'none'
    )
    
    listaEmisorasSelect = getLisColumData(dataEmisoras[1], dataEmisoras[2])
    updateSelectInput(
      session,
      "selectemisoraprogramaradial",
      choices = listaEmisorasSelect,
      selected = tail(listaEmisorasSelect, 1)
    )
    
    output$textoutput <- renderText({
      input$selectinteractivoprogramaradial
    })
  })
  #--------------------------------------------------------------------------------------------------
}