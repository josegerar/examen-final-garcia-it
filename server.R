library(shiny)
source("functions.R")
source("graficos.R")
source("dataController/cancionesController.R")
source("dataController/emisoraController.R")
source("dataController/programaRadialController.R")
source("dataController/staffController.R")
source("dataController/programaRealizadoController.R")

dataRolesStaff = getRolesStaff()

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  #carga de datos---------------------------------------------------------------------------------------
  dataCanciones = getDataCanciones()
  dRCanciones <-
    reactiveValues(data = getTable(dataCanciones, "canciones"))
  #-----------------------------------------------------------------------------------------------------
  dataEmisoras = getDataEmisoras()
  dREmisoras <-
    reactiveValues(data = getTable(dataEmisoras, "emisoras"))
  #-----------------------------------------------------------------------------------------------------
  dataProgramasRadiales = getDataProgramaRadial()
  dRProgramasRadiales <-
    reactiveValues(data = getTable(dataProgramasRadiales, "programasradiales"))
  #-----------------------------------------------------------------------------------------------------
  dataStaff = getDataStaff()
  dRStaff <-
    reactiveValues(data = getTable(dataStaff, "staff"))
  #-----------------------------------------------------------------------------------------------------
  dataProgramasRealizados = getDataProgramasRealizados()
  dRProgramasRealizados <-
    reactiveValues(data = getTable(dataProgramasRealizados, "programarealizado"))
  #-----------------------------------------------------------------------------------------------------
  dataFacturacion = getDataFacturacion()
  RVFacturacion <- reactiveValues(data = dataFacturacion)
  
  #eventos de control de crud de canciones--------------------------------------------------------------
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
  #-----------------------------------------------------------------------------------------------------
  observeEvent(input$button_canciones_edit, {
    selectedRow <- as.numeric(strsplit(input$button_canciones_edit, "_")[[1]][3])
    for (i in seq_len(nrow(dataCanciones))) {
      if (dataCanciones[i,][1] == selectedRow) {
        updateNumericInput(session, "idcancion", value = as.numeric(dataCanciones[i,][1]))
        updateTextInput(session, "nombrecancion", value = as.character(dataCanciones[i,][2]))
      }
    }
  })
  #-----------------------------------------------------------------------------------------------------
  observeEvent(input$button_canciones_delete, {
    selectedRow <- as.numeric(strsplit(input$button_canciones_delete, "_")[[1]][3])
    borrarCancion(selectedRow)
    dataCanciones = getDataCanciones()
    dRCanciones$data = getTable(dataCanciones, "canciones")
  })
  
  #eventos de control de crud de emisoras---------------------------------------------------------------
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
  #-----------------------------------------------------------------------------------------------------
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
  #-----------------------------------------------------------------------------------------------------
  observeEvent(input$button_emisoras_delete, {
    selectedRow <- as.numeric(strsplit(input$button_emisoras_delete, "_")[[1]][3])
    borrarEmisora(selectedRow)
    dataEmisoras = getDataEmisoras()
    dREmisoras$data = getTable(dataEmisoras, "emisoras")
  })
  
  #eventos de control de crud de programa_radial--------------------------------------------------------
  observeEvent(input$btnGuardarProgramaRadial, {
    idc = as.numeric(input$idprogramaradial)
    if (idc > 0) {
      editarProgramaRadial(
        idc, 
        input$nombreprogramaradial, 
        input$selectemisoraprogramaradial,
        strftime(input$horainicioprogramaradial, "%T"),
        strftime(input$horafinprogramaradial, "%T"),
        input$selectinteractivoprogramaradial
      )
    } else{
      guardarProgramaRadial(
        input$nombreprogramaradial, 
        input$selectemisoraprogramaradial,
        strftime(input$horainicioprogramaradial, "%T"),
        strftime(input$horafinprogramaradial, "%T"),
        input$selectinteractivoprogramaradial
      )
    }
    updateNumericInput(session, "idprogramaradial", value = 0)
    updateTextInput(session, "nombreprogramaradial", value = "")
    listaEmisorasSelect = getLisColumData(dataEmisoras[1], dataEmisoras[2])
    updateSelectInput(
      session,
      "selectemisoraprogramaradial",
      choices = listaEmisorasSelect,
      selected = tail(listaEmisorasSelect, 1)
    )
    listaEsInteractivo = list("SI" = 'true', "NO" = 'false')
    updateSelectInput(
      session,
      "selectinteractivoprogramaradial",
      choices = listaEsInteractivo,
      selected = tail(listaEsInteractivo, 1)
    )
    updateTimeInput(session, "horainicioprogramaradial", value = strptime("00:00:00", "%T"))
    updateTimeInput(session, "horafinprogramaradial", value = strptime("00:00:00", "%T"))
    dataProgramasRadiales = getDataProgramaRadial()
    dRProgramasRadiales$data = getTable(dataProgramasRadiales, "programasradiales")
  })
  #-----------------------------------------------------------------------------------------------------
  observeEvent(input$button_programasradiales_edit, {
    dataProgramasRadiales = getDataProgramaRadial()
    selectedRow <- as.numeric(strsplit(input$button_programasradiales_edit, "_")[[1]][3])
    for (i in seq_len(nrow(dataProgramasRadiales))) {
      if (dataProgramasRadiales[i,][1] == selectedRow) {
        
        updateNumericInput(session, "idprogramaradial", value = as.numeric(dataProgramasRadiales[i,][1]))
        updateTextInput(session, "nombreprogramaradial", value = as.character(dataProgramasRadiales[i,][2]))
        
        listaEmisorasSelect = getLisColumData(dataEmisoras[1], dataEmisoras[2])
        listindex = getLisIndex(listaEmisorasSelect, as.numeric(dataProgramasRadiales[i,][3]))
        updateSelectInput(
          session,
          "selectemisoraprogramaradial",
          choices = listaEmisorasSelect,
          selected = tail(listaEmisorasSelect[listindex], 1)
        )
        listaEsInteractivo = list("SI" = 'true', "NO" = 'false')
        indexEsInteractivo = getindexEsInteractivo(as.numeric(dataProgramasRadiales[i,][6]))
        updateSelectInput(
          session,
          "selectinteractivoprogramaradial",
          choices = listaEsInteractivo,
          selected = tail(listaEsInteractivo[indexEsInteractivo], 1)
        )
        updateTimeInput(session, "horainicioprogramaradial", value = strptime(dataProgramasRadiales[i,][4], "%T"))
        updateTimeInput(session, "horafinprogramaradial", value = strptime(dataProgramasRadiales[i,][5], "%T"))
      }
    }
  })
  #-----------------------------------------------------------------------------------------------------
  observeEvent(input$button_programasradiales_delete, {
    selectedRow <- as.numeric(strsplit(input$button_programasradiales_delete, "_")[[1]][3])
    borrarProgramaRadial(selectedRow)
    dataProgramasRadiales = getDataProgramaRadial()
    dRProgramasRadiales$data = getTable(dataProgramasRadiales, "programasradiales")
  })

  #eventos de control de crud de staff------------------------------------------------------------------
  observeEvent(input$btnGuardarStaff, {
    idc = as.numeric(input$idstaff)
    if (idc > 0) {
      editarStaff(idc, input$nombrepersonastaff, input$selecttipostaffsstaff, input$selectprogramaradialstaff)
    } else{
      guardarStaff(input$nombrepersonastaff, input$selecttipostaffsstaff, input$selectprogramaradialstaff)
    }
    updateNumericInput(session, "idstaff", value = 0)
    updateTextInput(session, "nombrepersonastaff", value = "")
    listaStaffSelect = getLisColumData(dataProgramasRadiales[1], dataProgramasRadiales[2])
    updateSelectInput(
      session,
      "selectprogramaradialstaff",
      choices = listaStaffSelect,
      selected = tail(listaStaffSelect[1], 1)
    )
    listaRolStaffSelect = getLisColumData(dataRolesStaff[1], dataRolesStaff[2])
    updateSelectInput(
      session,
      "selecttipostaffsstaff",
      choices = listaRolStaffSelect,
      selected = tail(listaRolStaffSelect[1], 1)
    ) 
    dataStaff = getDataStaff()
    dRStaff$data = getTable(dataStaff, "staff")
  })
  #-----------------------------------------------------------------------------------------------------
  observeEvent(input$button_staff_edit, {
    dataStaff = getDataStaff()
    selectedRow <- as.numeric(strsplit(input$button_staff_edit, "_")[[1]][3])
    for (i in seq_len(nrow(dataStaff))) {
      if (dataStaff[i,][1] == selectedRow) {
        
        updateNumericInput(session, "idstaff", value = as.numeric(dataStaff[i,][1]))
        updateTextInput(session, "nombrepersonastaff", value = as.character(dataStaff[i,][2]))
        
        listaStaffSelect = getLisColumData(dataProgramasRadiales[1], dataProgramasRadiales[2])
        listindex = getLisIndex(listaStaffSelect, as.numeric(dataStaff[i,][4]))
        updateSelectInput(
          session,
          "selectprogramaradialstaff",
          choices = listaStaffSelect,
          selected = tail(listaStaffSelect[listindex], 1)
        )
        
        listaRolStaffSelect = getLisColumData(dataRolesStaff[1], dataRolesStaff[2])
        listindex = getLisIndex(listaRolStaffSelect, as.numeric(dataStaff[i,][3]))
        updateSelectInput(
          session,
          "selecttipostaffsstaff",
          choices = listaRolStaffSelect,
          selected = tail(listaRolStaffSelect[listindex], 1)
        ) 
        
      }
    }
  })
  #-----------------------------------------------------------------------------------------------------
  observeEvent(input$button_staff_delete, {
    selectedRow <- as.numeric(strsplit(input$button_staff_delete, "_")[[1]][3])
    borrarStaff(selectedRow)
    dataStaff = getDataStaff()
    dRStaff$data = getTable(dataStaff, "staff")
  })
  
  #eventos de control de crud de programa_realizado-----------------------------------------------------
  observeEvent(input$btnGuardarProgramaRealizado, {
    idc = as.numeric(input$idprogramarrealizado)
    if (idc > 0) {
      editarProgramaRealizado(
        idc, 
        as.character(input$fechaprogramarealizado), 
        strftime(input$horainicioprogramarealizado, "%T"),
        strftime(input$horafinprogramarealizado, "%T"),
        input$selectprogramaradialrealizado
      )
    } else{
      guardarProgramaRealizado(
        as.character(input$fechaprogramarealizado),
        strftime(input$horainicioprogramarealizado, "%T"),
        strftime(input$horafinprogramarealizado, "%T"),
        input$selectprogramaradialrealizado
      )
    }
    updateNumericInput(session, "idprogramarrealizado", value = 0)
    updateDateInput(session, "fechaprogramarealizado", value = Sys.Date())
    updateTimeInput(session, "horainicioprogramarealizado", value = strptime("00:00:00", "%T"))
    updateTimeInput(session, "horafinprogramarealizado", value = strptime("00:00:00", "%T"))
    listaProgramarealizadoSelect = getLisColumData(dataProgramasRadiales[1], dataProgramasRadiales[2])
    updateSelectInput(
      session,
      "selectprogramaradialrealizado",
      choices = listaProgramarealizadoSelect,
      selected = tail(listaProgramarealizadoSelect, 1)
    )
    dataProgramasRealizados = getDataProgramasRealizados()
    dRProgramasRealizados$data = getTable(dataProgramasRealizados, "programarealizado")
  })
  #-----------------------------------------------------------------------------------------------------
  observeEvent(input$button_programarealizado_edit, {
    dataProgramasRealizados = getDataProgramasRealizados()
    selectedRow <- as.numeric(strsplit(input$button_programarealizado_edit, "_")[[1]][3])
    for (i in seq_len(nrow(dataProgramasRealizados))) {
      if (dataProgramasRealizados[i,][1] == selectedRow) {
        updateNumericInput(session, "idprogramarrealizado", value = as.numeric(dataProgramasRealizados[i,][1]))
        updateDateInput(session, "fechaprogramarealizado", value = dataProgramasRealizados[i,][1,2])
        updateTimeInput(session, "horainicioprogramarealizado", value = strptime(dataProgramasRealizados[i,][3], "%T"))
        updateTimeInput(session, "horafinprogramarealizado", value = strptime(dataProgramasRealizados[i,][4], "%T"))
        listaProgramarealizadoSelect = getLisColumData(dataProgramasRadiales[1], dataProgramasRadiales[2])
        listindex = getLisIndex(listaProgramarealizadoSelect, as.numeric(dataProgramasRealizados[i,][5]))
        updateSelectInput(
          session,
          "selectprogramaradialrealizado",
          choices = listaProgramarealizadoSelect,
          selected = tail(listaProgramarealizadoSelect[listindex], 1)
        )
      }
    }
  })
  #-----------------------------------------------------------------------------------------------------
  observeEvent(input$button_programarealizado_delete, {
    selectedRow <- as.numeric(strsplit(input$button_programarealizado_delete, "_")[[1]][3])
    borrarProgramaRealizado(selectedRow)
    dataProgramasRealizados = getDataProgramasRealizados()
    dRProgramasRealizados$data = getTable(dataProgramasRealizados, "programarealizado")
  })
  
  #carga de datos en las datatables---------------------------------------------------------------------
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
    
    output$tablaStaff <- DT::renderDataTable(
      dRStaff$data,
      server = FALSE,
      escape = FALSE,
      selection = 'none'
    )
    
    output$tablaProgramaRealizado <- DT::renderDataTable(
      dRProgramasRealizados$data,
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
    
    listaStaffSelect = getLisColumData(dataProgramasRadiales[1], dataProgramasRadiales[2])
    updateSelectInput(
      session,
      "selectprogramaradialstaff",
      choices = listaStaffSelect,
      selected = tail(listaStaffSelect, 1)
    )
  })
  #-----------------------------------------------------------------------------------------------------
  #carga de datos en dashboard--------------------------------------------------------------------------
  observe({
    cantidad = as.integer(input$selectcantidadgraficos)
    variable = input$selectvariables
    g1 = 0
    g2 = 0
    g3 = 0
    g4 = 0
    if (cantidad >= 1) {
      g1 = as.integer(input$sgrafico1)
    }
    if (cantidad >= 2) {
      g2 = as.integer(input$sgrafico2)
    }
    if (cantidad >= 3) {
      g3 = as.integer(input$sgrafico3)
    }
    if (cantidad >= 4) {
      g4 = as.integer(input$sgrafico4)
    }
    output$resultadoFacturacion <- renderPlot({
      managerGraphics(RVFacturacion$data, variable, cantidad, g1, g2, g3, g4)
    })
  })
}