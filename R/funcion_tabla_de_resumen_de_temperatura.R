
#' Creación de tabla que resume temperatura de abrigo
#'
#' La función `tabla_resumen_temperatura` genera un resumen estadístico por estación para la temperatura registrada a 150 cm de altura. El resumen incluye el valor mínimo, máximo y promedio de las temperaturas registradas en el conjunto de datos proporcionado. Esta función es útil para analizar tendencias y variabilidad de las temperaturas por estación.
#'
#' @details
#' La función realiza las siguientes operaciones:
#' - Agrupa los datos por el identificador de la estación (`id`).
#' - Calcula las estadísticas básicas (mínimo, máximo y promedio) para la columna `temperatura_abrigo_150cm`.
#' - Maneja valores faltantes (`NA`) excluyéndolos del cálculo mediante el argumento `na.rm = TRUE`.
#'
#' El data frame de entrada debe contener al menos las siguientes columnas:
#' - `id`: Identificador único para cada estación o grupo.
#' - `temperatura_abrigo_150cm`: Un valor numérico que representa las temperaturas registradas a 150 cm de altura.
#'
#' Si el argumento `datos` no es un data frame, la función lanzará un error y no procederá.
#'
#' @param datos Un `data.frame` que contiene las estaciones y las temperaturas registradas.
#' Debe incluir al menos las columnas `id` y `temperatura_abrigo_150cm`.
#'
#' @return
#' Un `data.frame` que contiene el resumen estadístico por estación con las siguientes columnas:
#' - `id`: Identificador de la estación.
#' - `min_temp`: Temperatura mínima registrada para la estación (excluyendo valores faltantes).
#' - `max_temp`: Temperatura máxima registrada para la estación.
#' - `mean_temp`: Temperatura promedio registrada para la estación.
#' @examples
#' data(metadatos_completos)
#' tabla_resumen_temperatura(metadatos_completos)
#'
#'
#' @export
#'
tabla_resumen_temperatura <- function(datos) {
  if (!is.data.frame(datos)) {
    cli::cli_abort("El argumento 'datos' debe ser un dataframe.")
  }
  resumen <- datos %>%
    dplyr::group_by(id) %>%
    dplyr::summarise(
      min_temp = min(temperatura_abrigo_150cm, na.rm = TRUE),
      max_temp = max(temperatura_abrigo_150cm, na.rm = TRUE),
      mean_temp = mean(temperatura_abrigo_150cm, na.rm = TRUE)
    )
  return(resumen)
}

