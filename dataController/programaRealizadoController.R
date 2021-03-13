source("dataController/postgresController.R")

guardarProgramaRealizado <- function(fecha_programa, hora_inico, hora_fin, programa_radial_id) {
  con = openConnectionPostgres()
  dbExecute(con,
            paste0("INSERT INTO public.programa_realizado(fecha_programa, hora_inico, hora_fin, programa_radial_id) "
                   , "VALUES ('",fecha_programa,"', '",hora_inico,"', '",hora_fin,"', ",programa_radial_id,");") ,
            immediate = TRUE)
  dbDisconnect(con)
}

getDataProgramasRealizados = function() {
  con = openConnectionPostgres()
  query <- dbSendQuery(con,
                       "SELECT id, fecha_programa, hora_inico, hora_fin, programa_radial_id FROM public.programa_realizado")
  data <- dbFetch(query)
  dbClearResult(query)
  dbDisconnect(con)
  return(data)
}

borrarProgramaRealizado <- function(id){
  con = openConnectionPostgres()
  dbExecute(conn = con, paste0("delete from public.programa_realizado where id=", id))
  dbDisconnect(con)
}

editarProgramaRealizado <- function(id, fecha_programa, hora_inico, hora_fin, programa_radial_id){
  con = openConnectionPostgres()
  query = paste0("update public.programa_realizado set fecha_programa='",fecha_programa,"', hora_inico='" , hora_inico , 
                 "', hora_fin='",hora_fin,"', programa_radial_id=",programa_radial_id,"  where id=", id)
  dbExecute(conn = con, query, immediate = TRUE)
  dbDisconnect(con)
}
