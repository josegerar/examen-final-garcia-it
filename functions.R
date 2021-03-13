library(shiny)
library(utf8)

shinyInput <- function(FUN, len, id, ids, ...) {
  inputs <- character(len)
  for (i in seq_len(len)) {
    inputs[i] <- as.character(FUN(paste0(id, ids[i]), ...))
  }
  inputs
}

 update_select_input_data_colum = function(session, listaSelect, idlist, select_name){
  updateSelectInput(
    session,
    select_name,
    choices = listaSelect,
    selected = tail(listaSelect[idlist], 1)
  )
}

 update_select_input_data = function(session, data_proccess, label_search_data, select_name){
  updateSelectInput(
    session,
    select_name,
    choices = names(data_proccess),
    selected = tail(names(data_proccess)[get_index_fiel(data = data_proccess, label_search = label_search_data)], 1)
  )
}

getTable <- function(dataref, dataname) {
  datatb = data.frame(
    dataref,
    Accion = shinyInput(
      actionButton,
      nrow(dataref),
      paste0(dataname, '_', 'button_'),
      ids = dataref[, 1],
      label = "Editar",
      #onclick = 'Shiny.onInputChange(\"select_button_edit\",  this.id)'
      onclick = paste0('Shiny.onInputChange(\"button_', dataname,'_edit\", this.id)')
    ),
    Accion = shinyInput(
      actionButton,
      nrow(dataref),
      paste0(dataname, '_', 'button_'),
      ids = dataref[, 1],
      label = "Eliminar",
      #onclick = 'Shiny.onInputChange(\"button_delete\",  this.id)'
      onclick = paste0('Shiny.onInputChange(\"button_', dataname,'_delete\", this.id)')
    ),
    stringsAsFactors = FALSE,
    row.names = dataref$id
  )
  return(datatb)
}

getLisNames = function(data){
  listnames = list()
  for (i in 1:length(names(data))) {
    name = names(data)[i]
    listnames[name] = i
  }
  return(listnames)
}

getLisColumData = function(columid, columname){
  listnames = list()
  for (i in seq_len(nrow(columid))) {
    name = columname[i,1]
    listnames[name] = columid[i,1]
  }
  return(listnames)
}

getLisIndex = function(lista, indexsearch){
  listnames = names(lista)
  for (i in 1:length(listnames)) {
    if(indexsearch == as.numeric(lista[listnames[i]])){
      return(listnames[i])
    }
  }
  return(listnames[1])
}

getTimeFormated <- function(val){
  return(paste0(Sys.Date(), " ", val))
}
