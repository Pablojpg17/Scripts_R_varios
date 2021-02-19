casas_boston_perdidos<-read.csv("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/housing-with-missing-value.csv",
                                header = TRUE,
                                stringsAsFactors = FALSE)

summary(casas_boston_perdidos)

mean(casas_boston_perdidos$crim)

median(casas_boston_perdidos$crim)

#Cálculo de la moda

library(modeest)

mlv(casas_boston_perdidos$crim, method = "mfv")


#Podemos omitir los NAN's 

na.omit(casas_boston_perdidos)

summary(na.omit(casas_boston_perdidos))

#De este modo hemos omitido todos aquellos registros que tienen un NAN en alguna
#Variable


#Podemos eliminar los NAN de algunas variables (filtrado selectivo)


#Definimos un vector con las variables con NAN que queremos conservar
drop_na<-c("rad")

casas_boston_perdidos_2<-casas_boston_perdidos[
    complete.cases(casas_boston_perdidos[, !(names(casas_boston_perdidos))%in% drop_na]),]

summary(casas_boston_perdidos_2)

#Hemos eliminado así todos los NAN de todas las variables salvo de la definida en
#el vector drop_na

#También podemos eliminar los registros por variables.
#Por ejemplo, para variables que tienen demasiados valores perdidos

#Podemos sobreescribir una variable con NULL

casas_boston_perdidos$rad<-NULL

#O también se puede hacer 

drops<- c("rad", "ptratio")
casas_boston_perdidos[,!names(casas_boston_perdidos) %in% drops]

casas_boston_perdidos[,!drops]
