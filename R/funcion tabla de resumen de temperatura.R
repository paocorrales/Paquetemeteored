
#' Creación de tabla que resume temperatura de abrigo
#'
#' La función `tabla_resumen_temperatura` crea una tabla que resume la temperatura_abrigo_150cm para las diferentes estaciones
#'
#' @param datos
#' data.frame de las estaciones en las que queremos resumir sus temperatura abrigo y hacer la tabla resumen
#'
#' @return
#' Devuelve una tabla en forma de resumen de la temperatura abrigo de las estaciones ingresadas
#'
#' @export
#'
#' @examples
#' tabla_resumen_temperatura(datos)
#'
tabla_resumen_temperatura <- function(datos) {
  if (!is.data.frame(datos)) {
    cli::cli_abort("El argumento 'datos' debe ser un dataframe.")
  }
  resumen <- datos %>%
    group_by(estacion) %>%
    summarise(
      min_temp = min(temperatura_abrigo_150cm, na.rm = TRUE),
      max_temp = max(temperatura_abrigo_150cm, na.rm = TRUE),
      mean_temp = mean(temperatura_abrigo_150cm, na.rm = TRUE)
    )
  return(resumen)
}
