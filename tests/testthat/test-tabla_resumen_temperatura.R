#library(testthat)

test_that("tabla_resumen_temperatura funciona correctamente", {
  expect_error(object = tabla_resumen_temperatura(123), regexp = "El argumento 'datos' debe ser un dataframe.")
})

