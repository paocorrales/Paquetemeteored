#' Creación de gráfico de temperatura promedio mensual por estación
#'
#' La función `grafica_temperatura_mensual` genera un gráfico de líneas que muestra la temperatura promedio mensual agrupada por estación.
#' @details
#' Se puede personalizar el título del gráfico y los colores de las líneas.
#'
#'
#' @param datos data.frame que contiene los datos. Debe incluir las columnas:
#' `estacion`: Un factor o cadena que indica la estación del año.
#' `mes`: mes del año de forma numerica.
#' `temperatura_abrigo_150cm`: Un valor numérico que indica la temperatura medida.
#' @param colores en el caso de querer presonalizar los colores del grafico.
#' @param titulo Un string que especifica el título del gráfico.
#'
#' @return
#' Un grafico de líneas con la temperatura promedio mensual para cada estación.
#' @examples
#' datos_clima <- data.frame(
#'   estacion = rep(c("Verano", "Otoño", "Invierno", "Primavera"), each = 12),
#'   mes = rep(1:12, times = 4),
#'   temperatura_abrigo_150cm = runif(48, min = -5, max = 35)  # Temperaturas aleatorias
#' )
#'
#' # Generar el gráfico con los colores por defecto
#' grafico <- grafico_temperatura_mensual(datos_clima)
#' print(grafico)
#'
#' # Generar el gráfico con colores personalizados
#' mis_colores <- c("red", "blue", "green", "purple")
#' grafico_personalizado <- grafico_temperatura_mensual(datos_clima, colores = mis_colores, titulo = "Temperatura Estacional")
#' print(grafico_personalizado)
#'
#' @export
#'
#'
grafico_temperatura_mensual <- function(datos, colores = NULL, titulo = "Temperatura") {
  if (is.null(colores)) {
    colores <- sample(colors(), length(unique(datos$mes)))
  }

  grafico <- datos %>%
    group_by(estacion, mes) %>%
    summarise(mean_temp = mean(temperatura_abrigo_150cm, na.rm = TRUE)) %>%
    ggplot(aes(x = mes, y = mean_temp, color = estacion)) +
    geom_line() +
    scale_color_manual(values = colores) +
    labs(title = titulo, x = "Mes", y = "Temperatura Promedio")

  return(grafico)
}
