source("dataController/postgresController.R")

guardarCancion <- function(nombre) {
  con = openConnectionPostgres()
  dbExecute(con,
            paste0("INSERT INTO public.canciones(nombre) VALUES ('"
                  , nombre, "')") ,
            immediate = TRUE)
  dbDisconnect(con)
}

getDataCanciones = function() {
  con = openConnectionPostgres()
  query <- dbSendQuery(con,
                       "SELECT id, nombre FROM public.canciones")
  data <- dbFetch(query)
  dbClearResult(query)
  dbDisconnect(con)
  return(data)
}

borrarCancion <- function(id){
  con = openConnectionPostgres()
  dbExecute(conn = con, paste0("delete from public.canciones where id=", id))
  dbDisconnect(con)
}

editarCancion <- function(id, nombre){
  con = openConnectionPostgres()
  dbExecute(
    conn = con,
    paste0("update public.canciones set nombre='", nombre, "' where id=", id)
    , immediate = TRUE
  )
  dbDisconnect(con)
}