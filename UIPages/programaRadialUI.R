library(shiny)
library(shinydashboard)
library(DT)
library(shinyTime)
source("functions.R")
source("dataController/emisoraController.R")

dataEmisoras = getDataEmisoras()

tabProgramaRadial <- tabItem(
  tabName = "programaradial",
  h2("Programa radial"),
  fluidPage(
    fluidRow(
      column(
        width = 6,
        conditionalPanel(
          condition = "1==0",
          numericInput(
            inputId = "idprogramaradial",
            label = "Id emisora",
            value = 0
          )
        ),
        textInput(
          inputId = "nombreprogramaradial",
          label = "Nombre del programa radial",
          value = ""
        ),
        selectInput(
          inputId = 'selectemisoraprogramaradial',
          label = "Seleccione la emisira",
          choices = getLisColumData(columid = dataEmisoras[1], columname = dataEmisoras[2])
        ),
        selectInput(
          inputId = 'selectinteractivoprogramaradial',
          label = "Es interactivo",
          choices = list("SI" = 'true', "NO" = 'false')
        )
      ),
      column(
        width = 6,
        timeInput("horainicioprogramaradial", "Hora inicio de programa (hh:MM:ss):"),
        timeInput("horafinprogramaradial", "Hora fin de programa (hh:MM:ss):")
      )
    ),
    actionButton(inputId = "btnGuardarProgramaRadial", label = "Guardar Programa radial"),
    hr(),
    DT::dataTableOutput("tablaProgramaRadial")
  )
)