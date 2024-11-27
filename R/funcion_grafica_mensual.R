#' Creación de gráfico de temperatura promedio mensual por estación
#'
#' La función `grafico_temperatura_mensual` genera un gráfico de líneas que muestra la evolución de la temperatura promedio mensual agrupada por estaciones. El gráfico es altamente personalizable, permitiendo modificar los colores asignados a cada estación y el título del gráfico.
#'
#' @details
#' Esta función procesa los datos ingresados para calcular la temperatura promedio mensual agrupada por estación (`id`). Los valores de temperatura se agrupan por mes y estación, se calcula el promedio mensual y se genera un gráfico de líneas. Si no se especifican colores, la función selecciona automáticamente colores aleatorios para las líneas del gráfico.
#'
#' Las columnas requeridas en el data frame de entrada (`datos`) son:
#' - `id`: Un identificador único para cada estación o grupo.
#' - `fecha`: Una columna de tipo fecha (`Date`) que indica la fecha de la medición.
#' - `temperatura_abrigo_150cm`: Una columna numérica que contiene los valores de temperatura.
#'
#' @param datos Un `data.frame` que contiene los datos a graficar. Debe incluir las columnas `id`, `fecha` y `temperatura_abrigo_150cm`.
#' @param colores Un vector de colores personalizados para las líneas del gráfico. Si no se proporciona, se generarán colores aleatorios.
#' @param titulo Un string que especifica el título del gráfico. Por defecto es "Temperatura".
#'

#'
#' @return
#' Un objeto de clase `ggplot` que representa un gráfico de líneas con la temperatura promedio mensual para cada estación.
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
    dplyr::mutate(mes = lubridate::month(fecha)) %>%
    dplyr::group_by(id, mes) %>%
    dplyr::summarise(mean_temp = mean(temperatura_abrigo_150cm, na.rm = TRUE), .groups = 'drop') %>%
    ggplot2::ggplot(aes(x = mes, y = mean_temp, color = id)) +
    ggplot2::geom_line() +
    ggplot2::scale_color_manual(values = colores) +
    ggplot2::labs(title = titulo, x = "Mes", y = "Temperatura Promedio")

  return(grafico)

}


