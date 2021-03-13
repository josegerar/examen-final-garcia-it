source("dataController/postgresController.R")

guardarProgramaRadial <- function(nombre, emisora_id, hora_inicio, hora_fin, interactivo) {
  con = openConnectionPostgres()
  dbExecute(con,
            paste0("INSERT INTO public.programa_radial(nombre, emisora_id, hora_inicio, hora_fin, interactivo)"
                  , "VALUES ('",nombre,"', ",emisora_id,", '",hora_fin,"', '",hora_fin,"', '",interactivo,"');") ,
            immediate = TRUE)
  dbDisconnect(con)
}


getDataProgramaRadial = function() {
  con = openConnectionPostgres()
  query <- dbSendQuery(con,
                       "SELECT id, nombre, emisora_id, hora_inicio, hora_fin, interactivo FROM public.programa_radial")
  data <- dbFetch(query)
  dbClearResult(query)
  dbDisconnect(con)
  return(data)
}

borrarProgramaRadial <- function(id){
  con = openConnectionPostgres()
  dbExecute(conn = con, paste0("delete from public.programa_radial where id=", id))
  dbDisconnect(con)
}

editarProgramaRadial <- function(id, nombre, emisora_id, hora_inicio, hora_fin, interactivo){
  con = openConnectionPostgres()
  dbExecute(
    conn = con,
    paste0("update public.programa_radial set nombre='",nombre,"', emisora_id=" , emisora_id , 
          ", hora_inicio='",hora_inicio,"', hora_fin='",hora_fin,"', interactivo='",interactivo,"'  where id=", id)
    , immediate = TRUE
  )
  dbDisconnect(con)
}

getindexEsInteractivo <- function(val){
  indexEsInteractivo = "SI"
  if(val == 1){
    indexEsInteractivo = "SI"
  } 
  if(val == 0){
    indexEsInteractivo = "NO"
  }
  return(indexEsInteractivo)
}