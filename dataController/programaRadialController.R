source("dataController/postgresController.R")

guardarProgramaRadial <- function(nombre, emisora_id, hora_inicio, hora_fin, interactivo) {
  dbExecute(con,
            paste("INSERT INTO public.programa_radial(nombre, emisora_id, hora_inicio, hora_fin, interactivo)"
                  , "VALUES ('",nombre,"', ",emisora_id,", '",hora_fin,"', '",hora_fin,"', '",interactivo,"');") ,
            immediate = TRUE)
}


getDataProgramaRadial = function() {
  query <- dbSendQuery(con,
                       "SELECT id, nombre, emisora_id, hora_inicio, hora_fin, interactivo FROM public.programa_radial")
  data <- dbFetch(query)
  dbClearResult(query)
  return(data)
}

borrarProgramaRadial <- function(id){
  dbExecute(conn = con, paste("delete from public.programa_radial where id=", id))
}

editarProgramaRadial <- function(id, nombre, emisora_id, hora_inicio, hora_fin, interactivo){
  dbExecute(
    conn = con,
    paste("update public.programa_radial set nombre=ltrim(rtrim('",nombre,"')), emisora_id=" , emisora_id , 
          ", hora_inicio='",hora_inicio,"', hora_fin='",hora_fin,"', interactivo='",interactivo,"'  where id=", id)
    , immediate = TRUE
    
  )
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