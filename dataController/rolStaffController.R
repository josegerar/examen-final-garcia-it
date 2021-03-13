source("dataController/postgresController.R")

getRolesStaff = function() {
  con = openConnectionPostgres()
  query <- dbSendQuery(con, "SELECT id, nombre FROM public.rol_staff")
  data <- dbFetch(query)
  dbClearResult(query)
  dbDisconnect(con)
  return(data)
}