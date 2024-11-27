#' Descargar datos meteorológicos de una estación específica
#'
#' La función `descargar_datos` permite descargar datos meteorológicos correspondientes a una estación específica, identificada por su ID único, y los almacena en un archivo CSV en el directorio especificado. Los datos se obtienen desde una pagina web. Esta función también verifica la validez del directorio destino, crea el directorio si no existe y maneja errores relacionados con conflictos de nombres.
#'
#' @param id_estacion Un string que representa el ID de la estación meteorológica. Los valores válidos son: "NH0098", "NH0046", "NH437", "NH472", y "NH0910".
#' @param directorio_destino Un string que especifica el directorio donde se guardará el archivo CSV descargado. Si el directorio no existe, será creado automáticamente. Si el nombre del directorio coincide con un archivo existente, se lanzará un error.
#'
#' @details
#' La función realiza los siguientes pasos:
#' 1. Verifica si el `directorio_destino` ya existe como un archivo y detiene la ejecución si ese es el caso.
#' 2. Crea el directorio especificado si no existe.
#' 3. Construye la URL del archivo CSV correspondiente al ID de la estación.
#' 4. Descarga el archivo CSV desde la URL y lo almacena en el directorio especificado.
#' 5. Lee el archivo CSV descargado utilizando `read.csv` y lo devuelve como un dataframe.
#'
#' @return
#' Un objeto de clase `tibble` que contiene los datos meteorológicos de la estación correspondiente. Los datos son leídos directamente del archivo CSV descargado.
#'
#' @export descargar_datos
#'
#' @examples
#' descargar_datos("NH0098", "data_raw")
#' descargar_datos("NH0910", "data_raw")
descargar_datos <- function(id_estacion, directorio_destino) {
  url_repositorio <- "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/"
  estacion_url <- paste0(url_repositorio, id_estacion, ".csv")

  # Verificar si el nombre del directorio está ocupado por un archivo
  if (file.exists(directorio_destino) && !dir.exists(directorio_destino)) {
    stop(paste("Error: El destino especificado", directorio_destino, "ya existe como archivo. Por favor, elige otro nombre para el directorio."))
  }

  # Crear la ruta completa para el archivo de destino
  ruta_archivo <- file.path(directorio_destino, paste0(id_estacion, ".csv"))

  # Crear el directorio si no existe
  if (!dir.exists(directorio_destino)) {
    dir.create(directorio_destino, recursive = TRUE)
  }

  # Descargar el archivo
  download.file(url = estacion_url, destfile = ruta_archivo)

  # Leer el archivo CSV
  datos <- read.csv(ruta_archivo)

  return(datos)
}
