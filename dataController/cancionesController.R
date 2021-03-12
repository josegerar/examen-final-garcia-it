source("dataController/postgresController.R")

guardarCancion <- function(nombre) {
  dbExecute(con,
            paste("INSERT INTO public.canciones(nombre) VALUES ('"
                  , nombre, "')") ,
            immediate = TRUE)
}

getDataCanciones = function() {
  query <- dbSendQuery(con,
                       "SELECT id, nombre FROM public.canciones")
  data <- dbFetch(query)
  dbClearResult(query)
  return(data)
}

borrarCancion <- function(id){
  dbExecute(conn = con, paste("delete from public.canciones where id=", id))
}

editarCancion <- function(id, nombre){
  dbExecute(
    conn = con,
    paste("update public.canciones set nombre='", nombre, "' where id=", id)
    , immediate = TRUE
  )
}