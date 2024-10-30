# Contribuyendo a Paquetemeteored
#
# Esto describe cómo proponer un cambio en Paquetemeteored. Para una discusión más detallada 
# sobre cómo contribuir a este y otros paquetes del tidyverse, consulta la 
# [guía de contribución al desarrollo](https://rstd.io/tidy-contrib) y nuestros 
# [principios de revisión de código](https://code-review.tidyverse.org/).

## Corregir errores tipográficos

# Puedes corregir errores tipográficos, ortográficos o gramaticales en la documentación 
# directamente usando la interfaz web de GitHub, siempre y cuando los cambios se realicen 
# en el archivo _fuente_. Esto generalmente significa que necesitarás editar los 
# [comentarios roxygen2](https://roxygen2.r-lib.org/articles/roxygen2.html) en un archivo `.R`, 
# no en un archivo `.Rd`. Puedes encontrar el archivo `.R` que genera el `.Rd` leyendo 
# el comentario en la primera línea.

## Cambios más grandes

# Si deseas realizar un cambio más grande, es recomendable primero crear un issue y 
# asegurarte de que alguien del equipo esté de acuerdo en que es necesario. Si has 
# encontrado un error (bug), por favor crea un issue que ilustre el error con un 
# [reprex](https://www.tidyverse.org/help/#reprex) mínimo (esto también te ayudará a escribir 
# una prueba unitaria, si es necesario). Consulta nuestra guía sobre 
# [cómo crear un buen issue](https://code-review.tidyverse.org/issues/) para más consejos.

### Proceso para pull request

# * Haz un fork del paquete y clónalo en tu computadora. Si no has hecho esto antes, 
#   te recomendamos usar `usethis::create_from_github("angelina1sys/Paquetemeteored", fork = TRUE)`.
# * Instala todas las dependencias de desarrollo con `devtools::install_dev_deps()`, 
#   y luego asegúrate de que el paquete pasa R CMD check ejecutando `devtools::check()`. 
#   Si R CMD check no pasa sin problemas, es buena idea pedir ayuda antes de continuar.
# * Crea una rama de Git para tu pull request (PR). Recomendamos usar `usethis::pr_init("descripcion-breve-del-cambio")`.
# * Haz tus cambios, haz commit en git, y luego crea un PR ejecutando `usethis::pr_push()`, 
#   y siguiendo las indicaciones en tu navegador. El título de tu PR debe describir brevemente el cambio. 
#   El cuerpo de tu PR debe contener `Fixes #numero-del-issue`.
# * Para cambios visibles al usuario, agrega un bullet al principio de `NEWS.md` 
#   (es decir, justo debajo del primer encabezado). Sigue el estilo descrito en 
#   <https://style.tidyverse.org/news.html>.

### Estilo del código

# * El nuevo código debe seguir la [guía de estilo](https://style.tidyverse.org) del tidyverse. 
#   Puedes usar el paquete [styler](https://CRAN.R-project.org/package=styler) para aplicar estos estilos, 
#   pero por favor no restyles el código que no esté relacionado con tu PR.
# * Usamos [roxygen2](https://cran.r-project.org/package=roxygen2), con 
#   [sintaxis de Markdown](https://cran.r-project.org/web/packages/roxygen2/vignettes/rd-formatting.html), 
#   para la documentación.
# * Usamos [testthat](https://cran.r-project.org/package=testthat) para pruebas unitarias. 
#   Las contribuciones que incluyan casos de prueba son más fáciles de aceptar.

## Código de conducta

# Por favor, ten en cuenta que el proyecto Paquetemeteored se publica con un 
# [Código de Conducta para Contribuyentes](CODE_OF_CONDUCT.md). Al contribuir a este proyecto, 
# aceptas cumplir con sus términos.
