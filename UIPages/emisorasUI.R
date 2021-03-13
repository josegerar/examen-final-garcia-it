library(shiny)
library(shinydashboard)
library(DT)
tabEmisoras <- tabItem(
  tabName = "emisoras",
  h2("Emisoras"),
  fluidPage(
    fluidRow(
      column(width = 1),
      column(
        width = 10,
        conditionalPanel(
          condition = "1==0",
          numericInput(
            inputId = "idemisora",
            label = "Id emisora",
            value = 0
          )
        ),
        textInput(
          inputId = "nombreemisora",
          label = "Nombre de la emisora",
          value = ""
        ),
        numericInput(
          inputId = "canalEmisora",
          label = "Canal",
          value = 0,
          step= ".01"
        )
      ),
      column(width = 1)
    ),
    actionButton(inputId = "btnGuardarEmisora", label = "Guardar emisora"),
    hr(),
    DT::dataTableOutput("tablaEmisoras")
  )
)
