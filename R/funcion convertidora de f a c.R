#' Convierte temperatura de farenheit a centigrados
#'
#' La función `farenheit_a_centigrados` convierte un valor de temperatura de grados Fahrenheit a grados Celsius.
#'
#' @param temperatura_fahrenheit numerico. Valor de temperatura en grados Fahrenheit que se desea convertir a grados Celsius.
#'  Debe ser un valor numérico; de lo contrario, la función devolverá un mensaje de error.
#' @return
#' Un vector numérico que es el valor de la temperatura en grados celcius
#' Si el valor de `temperatura_fahrenheit` no es numérico, la función lanza un error detallado.
#'
#' @examples
#' #convertir 90 grados fahrenheit a celsius
#' farenheit_a_centigrados(90)
#' #convertir 75 grados fahrenheit a celsius
#' farenheit_a_centigrados(75)
#'
#' @export
#'

farenheit_a_centigrados <- function(temperatura_fahrenheit) {
  if (!is.numeric(temperatura_fahrenheit)){
    cli::cli_abort(c(
      "temperatura_fahrenheit debe ser numerico.",
      "i" = "La variable ingresada es un {class(temperatura_fahrenheit)[1]}."
    ))
  }
  (temperatura_fahrenheit - 32) * 5/9
}

