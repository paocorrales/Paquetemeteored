#' Creación de gráfico de temperatura promedio mensual por estación
#'
#' La función `grafica_temperatura_mensual` genera un gráfico de líneas que muestra la temperatura promedio mensual agrupada por estación.
#' @details
#' Se puede personalizar el título del gráfico y los colores de las líneas.
#'
#'
#' @param datos data.frame que contiene los datos. Debe incluir las columnas:
#' `estacion`: Un factor o cadena que indica la estación del año.
#' `mes`: mes del año de forma numerica (id).
#' `temperatura_abrigo_150cm`: Un valor numérico que indica la temperatura medida.
#' @param colores en el caso de querer presonalizar los colores del grafico.
#' @param titulo Un string que especifica el título del gráfico.
#'
#' @import ggplot2
#' @import dplyr
#' @import lubridate
#'
#' @return
#' Un grafico de líneas con la temperatura promedio mensual para cada estación.
#' @examples
#'
#' grafico_temperatura_mensual(NH0910, "pink", "Temperatura")
#'
#'
#' @export
#'
#'
#'
#'
#'
grafico_temperatura_mensual <- function(datos, colores = NULL, titulo = "Temperatura") {
  if (!is.data.frame(datos)) {
    cli::cli_abort("El argumento 'datos' debe ser un dataframe.")}

  datos$fecha <- as.Date(datos$fecha)
  if (is.null(colores)) {
    colores <- sample(colors(), length(unique(datos$id)))



  }

  grafico <- datos %>%
    dplyr::mutate(mes = month(fecha)) %>%
    dplyr::group_by(id, mes) %>%
    dplyr::summarise(mean_temp = mean(temperatura_abrigo_150cm, na.rm = TRUE), .groups = 'drop') %>%
    ggplot2::ggplot(aes(x = mes, y = mean_temp, color = id)) +
    ggplot2::geom_line() +
    ggplot2::scale_color_manual(values = colores) +
    ggplot2::labs(title = titulo, x = "Mes", y = "Temperatura Promedio")

  return(grafico)

}


