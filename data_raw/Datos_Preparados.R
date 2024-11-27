ids_estaciones <- c("NH0046", "NH0098", "NH0437", "NH0472", "NH0910")

union_datasets <- function(ids_estaciones) {

  metadatos_completos <- data.frame()
  for (id in ids_estaciones) {
    datos <- descargar_datos(id, "data_raw")
    metadatos_completos <- rbind(metadatos_completos, datos)
  }

  return(metadatos_completos)
}
metadatos_completos <- union_datasets(ids_estaciones)
usethis::use_data(metadatos_completos)
