library(shiny)
library(shinydashboard)
library(DT)
library(shinyTime)
source("functions.R")
source("dataController/programaRadialController.R")
source("dataController/rolStaffController.R")

dataProgramasRadiales = getDataProgramaRadial()
dataRolesStaff = getRolesStaff()

tabStaff <- tabItem(
  tabName = "staff",
  h2("Staff"),
  fluidPage(
    fluidRow(
      conditionalPanel(
        condition = "1==0",
        numericInput(
          inputId = "idstaff",
          label = "Id staff",
          value = 0
        )
      ),
      textInput(
        inputId = "nombrepersonastaff",
        label = "Nombre miembro de staff",
        value = ""
      ),
      selectInput(
        inputId = 'selectprogramaradialstaff',
        label = "Seleccione el programa radial al que pertenece",
        choices = getLisColumData(columid = dataProgramasRadiales[1], columname = dataProgramasRadiales[2])
      ),
      selectInput(
        inputId = 'selecttipostaffsstaff',
        label = "Seleccione el cargo",
        choices = getLisColumData(columid = dataRolesStaff[1], columname = dataRolesStaff[2])
      )
    ),
    actionButton(inputId = "btnGuardarStaff", label = "Guardar staff"),
    hr(),
    DT::dataTableOutput("tablaStaff")
  )
)