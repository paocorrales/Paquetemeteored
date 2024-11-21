#' Convertir temperatura de Fahrenheit a Celsius
#'
#' La función farenheit_a_centigrados convierte un valor de temperatura dado en grados Fahrenheit a su equivalente en grados Celsius.
#' Es útil para aplicaciones científicas, meteorológicas o en cualquier situación en la que se requiera este tipo de conversión.
#'
#' @param temperatura_fahrenheit numérico. Valor de la temperatura en grados Fahrenheit que se desea convertir.
#'        Debe ser un número real (positivo, negativo o cero). Si el argumento proporcionado no es numérico, la función arrojará un error claro y detallado.
#'
#' @details
#' La fórmula utilizada para la conversión es:
#' \deqn{C = (F - 32) * \frac{5}{9}}
#' donde:
#' - \eqn{F} es el valor en grados Fahrenheit ingresado como argumento.
#' - \eqn{C} es el valor resultante en grados Celsius.
#'
#' Esta función valida que el argumento proporcionado sea de tipo numérico.
#' Si el usuario proporciona un valor no numérico, como un carácter, un factor o una lista, se mostrará un mensaje de error detallado indicando el tipo de dato ingresado.
#'
#' @return
#' Devuelve un vector numérico con el valor convertido en grados Celsius.
#' Si el valor de entrada es un vector de temperaturas en Fahrenheit, la función aplicará la conversión a cada elemento del vector.
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


