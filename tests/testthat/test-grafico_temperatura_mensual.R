library(testthat)
library(ggplot2)

test_that("grafico_temperatura_mensual funciona correctamente", {
  expect_error(grafico_temperatura_mensual(123),
               "El argumento 'datos' debe ser un dataframe.")
  expect_true(inherits(grafico_temperatura_mensual(NH0046), "ggplot"))

  grafico_con_titulo <- grafico_temperatura_mensual(NH0098, titulo = "Título personalizado")
  expect_true(grepl("Título personalizado", grafico_con_titulo$labels$title))

})
