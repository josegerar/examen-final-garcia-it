source("dataController/postgresController.R")

guardarEmisora <- function(nombre, canal) {
  con = openConnectionPostgres()
  dbExecute(con,
            paste0("INSERT INTO public.emisora_canal(nombre, canal) VALUES ('"
                  , nombre, "', ", canal ,")") ,
            immediate = TRUE)
  dbDisconnect(con)
}

getDataEmisoras = function() {
  con = openConnectionPostgres()
  query <- dbSendQuery(con,
                       "SELECT id, nombre, canal FROM public.emisora_canal")
  data <- dbFetch(query)
  dbClearResult(query)
  dbDisconnect(con)
  return(data)
}

borrarEmisora <- function(id){
  con = openConnectionPostgres()
  dbExecute(conn = con, paste0("delete from public.emisora_canal where id=", id))
  dbDisconnect(con)
}

editarEmisora <- function(id, nombre, canal){
  con = openConnectionPostgres()
  dbExecute(
    conn = con,
    paste0("update public.emisora_canal set nombre='", nombre, "', canal=" , canal , " where id=", id)
    , immediate = TRUE
  )
  dbDisconnect(con)
}
