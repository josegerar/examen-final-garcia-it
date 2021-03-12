source("dataController/postgresController.R")

guardarEmisora <- function(nombre, canal) {
  dbExecute(con,
            paste("INSERT INTO public.emisora_canal(nombre, canal) VALUES ('"
                  , nombre, "', ", canal ,")") ,
            immediate = TRUE)
}

getDataEmisoras = function() {
  query <- dbSendQuery(con,
                       "SELECT id, nombre, canal FROM public.emisora_canal")
  data <- dbFetch(query)
  dbClearResult(query)
  return(data)
}

borrarEmisora <- function(id){
  dbExecute(conn = con, paste("delete from public.emisora_canal where id=", id))
}

editarEmisora <- function(id, nombre, canal){
  dbExecute(
    conn = con,
    paste("update public.emisora_canal set nombre='", nombre, "', canal=" , canal , " where id=", id)
    , immediate = TRUE
  )
}