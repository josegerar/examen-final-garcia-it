library(DBI)
library(odbc)
openConnectionPostgres <- function(){
  return( DBI::dbConnect(
    odbc::odbc(),
    #Driver   = "PostgreSQL Unicode",
    Driver   = "PostgreSQL ODBC Driver(UNICODE)",
    Server   = "localhost",
    Database = "radiodifusora",
    UID      = "postgres",
    PWD      = "123456",
    Port     = 5432
  ))
}
