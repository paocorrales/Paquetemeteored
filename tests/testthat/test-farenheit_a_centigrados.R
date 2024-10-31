library(testthat)
test_that("farenheit_a_centigrados funciona correctamente", {
  expect_equal(farenheit_a_centigrados(32), 0)
  expect_equal(farenheit_a_centigrados(-40), -40)
  expect_error(farenheit_a_centigrados("10"),
               "temperatura_fahrenheit debe ser numerico.")
})
