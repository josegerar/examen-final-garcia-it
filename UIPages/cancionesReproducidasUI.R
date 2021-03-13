library(shiny)
library(shinydashboard)
library(DT)
library(shinyTime)
source("functions.R")
source("dataController/programaRadialController.R")
source("dataController/cancionesController.R")

dataProgramasRadiales = getDataProgramaRadial()
dataCanciones = getDataCanciones()

tabStaff <- tabItem(
  tabName = "cancionesreproducidas",
  h2("Canciones reproducidas"),
  fluidPage(
    fluidRow(
      conditionalPanel(
        condition = "1==0",
        numericInput(
          inputId = "idcancionreproducida",
          label = "Id canciones reproducidas",
          value = 0
        )
      ),
      selectInput(
        inputId = 'selectprogramaradialcancionesreproducidas',
        label = "Seleccione el programa radial al que pertenece",
        choices = getLisColumData(columid = dataProgramasRadiales[1], columname = dataProgramasRadiales[2])
      ),
      selectInput(
        inputId = 'selectcancionescancionesreproducidas',
        label = "Seleccione el cargo",
        choices = getLisColumData(columid = dataRolesStaff[1], columname = dataRolesStaff[2])
      )
    ),
    actionButton(inputId = "btnGuardarStaff", label = "Guardar staff"),
    hr(),
    DT::dataTableOutput("tablaStaff")
  )
)