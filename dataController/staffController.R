source("dataController/postgresController.R")

guardarStaff <- function(nombre, rol_id, programa_id) {
  dbExecute(con,
            paste("INSERT INTO public.staff(nombre, rol_id, programa_id) "
                  , "VALUES ('",nombre,"', ",rol_id,", ",programa_id,");") ,
            immediate = TRUE)
}

getDataStaff = function() {
  query <- dbSendQuery(con,
                       "SELECT id, nombre, rol_id, programa_id FROM public.staff")
  data <- dbFetch(query)
  dbClearResult(query)
  return(data)
}

borrarStaff <- function(id){
  dbExecute(conn = con, paste("delete from public.staff where id=", id))
}


editarStaff <- function(id, nombre, rol_id, programa_id){
  dbExecute(
    conn = con,
    paste("update public.staff set nombre=ltrim(rtrim('",nombre,"')), rol_id=" , rol_id , 
          ", programa_id=",programa_id,", where id=", id)
    , immediate = TRUE
  )
}