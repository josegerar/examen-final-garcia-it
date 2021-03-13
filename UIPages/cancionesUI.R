library(shiny)
library(shinydashboard)
library(DT)
tabCanciones <- tabItem(
  tabName = "canciones",
  h2("Canciones"),
  fluidPage(
    fluidRow(
      column(width = 1),
      column(
        width = 10,
        conditionalPanel(
          condition = "1==0",
          numericInput(
            inputId = "idcancion",
            label = "Id cancion",
            value = 0
          )
        ),
        textInput(
          inputId = "nombrecancion",
          label = "Nombre de la cancion",
          value = ""
        )
      ),
      column(width = 1)
    ),
    actionButton(inputId = "btnGuardarCancion", label = "Guardar cancion"),
    hr(),
    DT::dataTableOutput("tablaCanciones")
  )
)
