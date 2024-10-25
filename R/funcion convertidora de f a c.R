# Trabajar con datos de temperatura que tenemos de convertir de una escala a otra

#' Convierte temperatura de farenheit a centigrados
#'
#' La función `farenheit_a_centigrados` toma una temperatura establecida en farenheit y la convierte a grados celcius.
#'
#' @param temperatura_fahrenheit es el valor a convertir
#'
#' @return
#' Un vector numérico que es el valor de la temperatura en grados celcius
#'
#' @examples
#' farenheit_a_centigrados(90)
#' farenheit_a_centigrados(75)
#'
#' @export
#'

farenheit_a_centigrados <- function(temperatura_fahrenheit) {
  if (!is.numeric(temperatura_fahrenheit)){
    cli::cli_abort(c(
      "temperatura_fahrenheit debe ser numerico.",
      "i" = "La variable ingresada es un {class(temperatura_fahrenheit)[1]."
    ))
  }
  (temperatura_fahrenheit - 32) * 5/9
}

