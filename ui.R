library(shiny)
library(shinydashboard)

source("UIPages/dashboardUI.R")
source("UIPages/cancionesUI.R")
source("UIPages/emisorasUI.R")

# Define UI for application that draws a histogram
ui <- dashboardPage(
  dashboardHeader(title = "Radiodifusora"),
  dashboardSidebar(sidebarMenu(
    id = "tabs",
    menuItem("Dashboard", tabName = "dashboard", icon = icon("th")),
    menuItem("Canciones", tabName = "canciones", icon = icon("th")),
    menuItem("Canciones", tabName = "emisoras", icon = icon("th"))
  )),
  dashboardBody(tabItems(tabDashboard,
                         tabCanciones,
                         tabEmisoras))
)