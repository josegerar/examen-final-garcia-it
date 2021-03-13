source("dataController/postgresController.R")

guardarStaff <- function(nombre, rol_id, programa_id) {
  con = openConnectionPostgres()
  dbExecute(con,
            paste0("INSERT INTO public.staff(nombre, rol_id, programa_id) "
                  , "VALUES ('",nombre,"', ",rol_id,", ",programa_id,");") ,
            immediate = TRUE)
  dbDisconnect(con)
}

getDataStaff = function() {
  con = openConnectionPostgres()
  query <- dbSendQuery(con,
                       "SELECT id, nombre, rol_id, programa_id FROM public.staff")
  data <- dbFetch(query)
  dbClearResult(query)
  dbDisconnect(con)
  return(data)
}

borrarStaff <- function(id){
  con = openConnectionPostgres()
  dbExecute(conn = con, paste0("delete from public.staff where id=", id))
  dbDisconnect(con)
}


editarStaff <- function(id, nombre, rol_id, programa_id){
  con = openConnectionPostgres()
  dbExecute(
    conn = con,
    paste0("update public.staff set nombre='",nombre,"', rol_id=" , rol_id , 
          ", programa_id=",programa_id," where id=", id)
    , immediate = TRUE
  )
  dbDisconnect(con)
}
