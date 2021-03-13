source("dataController/postgresController.R")


getDataFacturacion = function() {
  con = openConnectionPostgres()
  query <- dbSendQuery(
    con,
    "select qa.id, qa.nombre, qa.clasificacion, qa.cadena_nacional, sp.repeticiones*qa.valor as valortotal ,
sp.programa_realizado_id
from(select sp.id, sp.nombre, sp.cantidad_segundos * sc.precio as valor,
sc.nombre as clasificacion, sp.cadena_nacional
from spot_publicitario as sp inner join spot_clasificacion sc on sp.id_clasificacion=sc.id) as qa
inner join spot_repeticiones sp on qa.id=sp.spot_id"
  )
  data <- dbFetch(query)
  dbClearResult(query)
  dbDisconnect(con)
  return(data)
}