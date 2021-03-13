source("dataController/postgresController.R")

guardarCancionReproducida <- function(programa_realizado_id, cancion_id, reproducciones) {
  con = openConnectionPostgres()
  dbExecute(con,
            paste0("INSERT INTO public.canciones_reproducidas(programa_realizado_id, cancion_id, reproducciones) "
                   , "VALUES (",programa_realizado_id,", ",cancion_id,", ",reproducciones,");") ,
            immediate = TRUE)
  dbDisconnect(con)
}

getDataCancionesReproducidas = function() {
  con = openConnectionPostgres()
  query <- dbSendQuery(con,
                       "SELECT id, programa_realizado_id, cancion_id, reproducciones FROM public.canciones_reproducidas;")
  data <- dbFetch(query)
  dbClearResult(query)
  dbDisconnect(con)
  return(data)
}


borrarCancionReproducida <- function(id){
  con = openConnectionPostgres()
  dbExecute(conn = con, paste0("delete from public.canciones_reproducidas where id=", id))
  dbDisconnect(con)
}


editarCancionReproducida <- function(id, programa_realizado_id, cancion_id, reproducciones){
  con = openConnectionPostgres()
  dbExecute(
    conn = con,
    paste0("update public.canciones_reproducidas set programa_realizado_id=",programa_realizado_id,
           ", cancion_id=" , cancion_id , ", reproducciones=",reproducciones," where id=", id)
    , immediate = TRUE
  )
  dbDisconnect(con)
}