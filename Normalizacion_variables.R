

Casas_boston<-read.csv("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/BostonHousing.csv")

#Convertimos el Dataset mediante la normal estandar.
#Se resta la media y se divide por la desviación típica (tipificamos la variable)

casas_boston_normalizado<-scale(Casas_boston)

View(casas_boston_normalizado)

scale(Casas_boston$AGE)

#Parametros, center= TRUE es centrar los datos, es decir, restar la media
#Scaled escala los datos, divide por la desviación típica

#Tipificamos
scale(Casas_boston, center = TRUE, scale = TRUE)

#No escalamos

scale(Casas_boston, center = FALSE, scale = FALSE)

#Centramos

scale(Casas_boston, center = TRUE, scale = FALSE)

#Dividimos por la desviación típica

scale(Casas_boston, center = FALSE, scale = TRUE)

escalar_varias <- function(DataFrame, columnas){
  
  nombres_columnas<- names(DataFrame)
  for (columna in columnas){
    nombre_columna<-paste(nombres_columnas[columna], "tipificada", sep = "_")
    DataFrame[nombre_columna]<-scale(DataFrame[, columna])
  }
  return(DataFrame)
}

View(escalar_varias(Casas_boston, c(1,3, 5:8)))
