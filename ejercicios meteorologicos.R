metadatos_url <- "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/metadatos_completos.csv"
metadatos_archivo <- "D:\\Mis Documentos\\LCD 2024\\Programacion II\\Paquete meteorologico\\datos\\metadatos_completos.csv"
download.file(url = metadatos_url, destfile = metadatos_archivo)  

estacion_NH0472_url <- "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0472.csv"
estacion_NH0472_archivo <- "D:\\Mis Documentos\\LCD 2024\\Programacion II\\Paquete meteorologico\\datos\\NH0472.csv"
download.file(url = estacion_NH0472_url, destfile = estacion_NH0472_archivo)  

estacion_NH0910_url <- "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0910.csv"
estacion_NH0910_archivo <- "D:\\Mis Documentos\\LCD 2024\\Programacion II\\Paquete meteorologico\\datos\\NH0910.csv"
download.file(url = estacion_NH0910_url, destfile = estacion_NH0910_archivo)  

estacion_NH0046_url <- "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0046.csv"
estacion_NH0046_archivo <- "D:\\Mis Documentos\\LCD 2024\\Programacion II\\Paquete meteorologico\\datos\\NH0046.csv"
download.file(url = estacion_NH0046_url, destfile = estacion_NH0046_archivo)  

estacion_NH0098_url <- "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0098.csv"
estacion_NH0098_archivo <- "D:\\Mis Documentos\\LCD 2024\\Programacion II\\Paquete meteorologico\\datos\\NH0098.csv"
download.file(url = estacion_NH0098_url, destfile = estacion_NH0098_archivo)  

estacion_NH0437_url <- "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0437.csv"
estacion_NH0437_archivo <- "D:\\Mis Documentos\\LCD 2024\\Programacion II\\Paquete meteorologico\\datos\\NH0437.csv"
download.file(url = estacion_NH0437_url, destfile = estacion_NH0437_archivo)  

# ------------

library(readr)
metadatos_completo <- read_csv("D:\\Mis Documentos\\LCD 2024\\Programacion II\\Paquete meteorologico\\datos")
estacion_NH0472 <- read_csv("D:\\Mis Documentos\\LCD 2024\\Programacion II\\Paquete meteorologico\\datos\\NH0472.csv")
estacion_NH0910 <- read_csv("D:\\Mis Documentos\\LCD 2024\\Programacion II\\Paquete meteorologico\\datos\\NH0910.csv")
estacion_NH0046 <- read_csv("D:\\Mis Documentos\\LCD 2024\\Programacion II\\Paquete meteorologico\\datos\\NH0046.csv")
estacion_NH0098 <- read_csv("D:\\Mis Documentos\\LCD 2024\\Programacion II\\Paquete meteorologico\\datos\\NH0098.csv")
estacion_NH0437 <- read_csv("D:\\Mis Documentos\\LCD 2024\\Programacion II\\Paquete meteorologico\\datos\\NH0437.csv")



# ------------



estaciones <- rbind(estacion_NH0472, estacion_NH0910, estacion_NH0046, estacion_NH0098, estacion_NH0437)
write.csv(estaciones, "D:\\Mis Documentos\\LCD 2024\\Programacion II\\Paquete meteorologico\\datos\\estaciones_merged.csv", row.names = FALSE)



# ------------



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