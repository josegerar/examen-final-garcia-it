library(shiny)
library(shinydashboard)

source("UIPages/dashboardUI.R")
source("UIPages/cancionesUI.R")
source("UIPages/emisorasUI.R")
source("UIPages/programaRadialUI.R")
source("UIPages/staffUI.R")
source("UIPages/programaRealizadoUI.R")

# Define UI for application that draws a histogram
ui <- dashboardPage(
  dashboardHeader(title = "Radiodifusora"),
  dashboardSidebar(sidebarMenu(
    id = "tabs",
    menuItem("Dashboard", tabName = "dashboard", icon = icon("th")),
    menuItem("Canciones", tabName = "canciones", icon = icon("th")),
    menuItem("Emisoras", tabName = "emisoras", icon = icon("th")),
    menuItem("Programa radial", tabName = "programaradial", icon = icon("th")),
    menuItem("Staff", tabName = "staff", icon = icon("th")),
    menuItem("Programas realizados", tabName = "programarealizado", icon = icon("th"))
  )),
  dashboardBody(tabItems(tabDashboard,
                         tabCanciones,
                         tabEmisoras,
                         tabProgramaRadial,
                         tabStaff,
                         tabProgramaRealizado))
)