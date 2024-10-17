# Trabajar con datos de temperatura que tenemos de convertir de una escala a otra
#' Convierte temperatura de farenheit a centigrados
#'
#' La función `convertir_farenheit_a_centigrados` toma una temperatura establecida en farenheit y la convierte a grados celcius.
#'
#' @param temp_max_hoy es el valor a convertir
#'
#' @return
#' Un vector numérico que es el valor de la temperatura en grados celcius
#'
#' @examples
#' convertir_farenheit_a_centigrados(90)
#' convertir_farenheit_a_centigrados(75)
#'
#' @export
#'
temp_max_hoy <- 53.7
temp_max_hoy_centigrados <- (temp_max_hoy - 32) * 5/9


convertir_farenheit_a_centigrados <- function(temp_max_hoy) {
  (temp_max_hoy - 32) * 5/9
}
convertir_farenheit_a_centigrados(90)
