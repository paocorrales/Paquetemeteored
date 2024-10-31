test_that("descargar_datos descarga el archivo correctamente", {
  # Define un ID de estación y un directorio de destino temporal
  id_estacion <- "NH0098"
  directorio_destino <- tempfile("datos_estacion")

  # Llama a la función
  datos <- descargar_datos(id_estacion, directorio_destino)

  # Verifica que los datos sean un dataframe
  expect_s3_class(datos, "data.frame")

  # Verifica que el archivo haya sido creado en el directorio
  expect_true(file.exists(file.path(directorio_destino, paste0(id_estacion, ".csv"))))

  # Limpia el directorio de prueba
  unlink(directorio_destino, recursive = TRUE)
})
