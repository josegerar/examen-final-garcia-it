library(shiny)
library(shinydashboard)
library(DT)
library(shinyTime)
source("functions.R")
source("dataController/programaRadialController.R")

dataProgramasRadiales = getDataProgramaRadial()

tabProgramaRealizado <- tabItem(
  tabName = "programarealizado",
  h2("Programas realizados"),
  fluidPage(
    fluidRow(
      column(
        width = 6,
        conditionalPanel(
          condition = "1==0",
          numericInput(
            inputId = "idprogramarrealizado",
            label = "Id programa realizado",
            value = 0
          )
        ),
        selectInput(
          inputId = 'selectprogramaradialrealizado',
          label = "Seleccione el programa radial",
          choices = getLisColumData(columid = dataProgramasRadiales[1], columname = dataProgramasRadiales[2])
        ),
        dateInput("fechaprogramarealizado", "Fecha de programa realizado:", value = Sys.Date())
      ),
      column(
        width = 6,
        timeInput("horainicioprogramarealizado", "Hora inicio de programa (hh:MM:ss):"),
        timeInput("horafinprogramarealizado", "Hora fin de programa (hh:MM:ss):"),
        textOutput(outputId = "textoutput")
      )
    ),
    actionButton(inputId = "btnGuardarProgramaRealizado", label = "Guardar Programa radial"),
    hr(),
    DT::dataTableOutput("tablaProgramaRealizado")
  )
)