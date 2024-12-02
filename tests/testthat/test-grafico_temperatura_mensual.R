library(testthat)
library(ggplot2)

test_that("grafico_temperatura_mensual funciona correctamente", {
  expect_error(grafico_temperatura_mensual(123),
               "El argumento 'datos' debe ser un dataframe.")
  expect_true(inherits(grafico_temperatura_mensual(metadatos_completos), "ggplot"))

  grafico_con_titulo <- grafico_temperatura_mensual(metadatos_completos, titulo = "Título personalizado")
  expect_true(grepl("Título personalizado", grafico_con_titulo$labels$title))

})
