
library(dplyr)

# ¿Cuántas observaciones de temperatura se hicieron en cada estación?
estaciones %>%
  count(id)
# 1 NH0046 17041
# 2 NH0098 23733
# 3 NH0437 18929
# 4 NH0472 20425
# 5 NH0910 15553


# ¿Cuál es la temperatura mínima registrada y la máxima registrada en cada estación?
estaciones %>%
  group_by(id) %>%
  summarise(minimo = min(temperatura_abrigo_150cm_minima, na.rm = TRUE), maximo = max(temperatura_abrigo_150cm_maxima, na.rm = TRUE))
#    id     minimo maximo
# 1 NH0046  -15     41.5
# 2 NH0098   -8.3   45.4
# 3 NH0437   -5.6   44.5
# 4 NH0472   -8     42.1
# 5 NH0910   -8.5   43


# ¿Cuál es el promedio de la temperatura de abrigo a 150 cm en cada estación?
estaciones %>%
  group_by(id) %>%
  summarise(promedio = mean(temperatura_abrigo_150cm, na.rm = TRUE))
#    id    promedio
# 1 NH0046   17.3
# 2 NH0098   18.6
# 3 NH0437   20.2
# 4 NH0472   18.0
# 5 NH0910   17.7


# ¿Y el desvío estandar? Pista: la mayoría de las funciones tienen un argumento para sacar los NA del cálculo, revisá la documentación de mean() y de sd().
estaciones %>%
  group_by(id) %>%
  summarise(desviacion = sd(temperatura_abrigo_150cm, na.rm = TRUE))
#     id     desviacion
# 1 NH0046       5.90
# 2 NH0098       5.98
# 3 NH0437       5.77
# 4 NH0472       5.94
# 5 NH0910       6.12


# ¿Cuál es la proporción de NA en temperatura de abrigo a 150 cm? Pista: podés calcular la proporción como cantidad de NA dividido la cantidad total de observaciones.
# La función is.na() devuelve TRUE si el valor es un NA, al mismo tiempo TRUE es igual a 1 (así es como R lo interpreta) por lo que sum(is.na(variable)) te va a dar la cantidad de NA en esa variable.
estaciones %>%
  summarise(proporcion_na = sum(is.na(temperatura_abrigo_150cm)) / nrow(estaciones))
#      proporcion_na
# 1       0.00790


# ¿Cuál es el promedio anual de la temperatura de abrigo a 150 cm en cada estación?
# Pista, podés extraer el año de la variable fecha con anio = year(fecha) y usar esa nueva variable para agrupar los datos.


# ¿Cuál es la precipitación acumulada mensual en cada estación?
# Pista: la precipitación acumulada mensual es la suma de la precipitación en cada mes. En este caso necesitas agrupar los datos por año y mes, una posibilidad es usar floor_date(fecha, "month").



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
  resumen <- datos %>%
    group_by(estacion) %>%
    summarise(
      min_temp = min(temperatura_abrigo_150cm, na.rm = TRUE),
      max_temp = max(temperatura_abrigo_150cm, na.rm = TRUE),
      mean_temp = mean(temperatura_abrigo_150cm, na.rm = TRUE)
    )
  return(resumen)
}


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
