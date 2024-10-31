
#' Creación de tabla que resume temperatura de abrigo
#'
#' La función `tabla_resumen_temperatura`  calcula un resumen estadístico (mínimo, máximo y promedio) de la
#' temperatura registrada a 150 cm de altura para cada estación.
#'
#' @param datos
#' data.frame de las estaciones en las que queremos resumir sus temperatura abrigo y hacer la tabla resumen
#' Es obligatorio que sea un data frame, de lo contrario, la función lanzará un mensaje de error.
#'
#' @return
#' Una tabla con el resumen estadístico por estación, incluyendo las siguientes columnas:
#' - `estacion`: Identificador de la estación.
#' - `min_temp`: Temperatura mínima registrada para la estación (considerando NA en los datos).
#' - `max_temp`: Temperatura máxima registrada para la estación.
#' - `mean_temp`: Temperatura media registrada para la estación.
#'
#' @export
#'
#' @examples
#' tabla_resumen_temperatura(NH0910)
#'
#' @export
#'
tabla_resumen_temperatura <- function(datos) {
  if (!is.data.frame(datos)) {
    cli::cli_abort("El argumento 'datos' debe ser un dataframe.")
  }
  resumen <- datos %>%
    group_by(id) %>%
    summarise(
      min_temp = min(temperatura_abrigo_150cm, na.rm = TRUE),
      max_temp = max(temperatura_abrigo_150cm, na.rm = TRUE),
      mean_temp = mean(temperatura_abrigo_150cm, na.rm = TRUE)
    )
  return(resumen)
}

