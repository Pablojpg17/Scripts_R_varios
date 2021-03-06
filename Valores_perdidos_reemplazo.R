library(Hmisc)


#Reemplazo de valores NAN

casas_boston<-read.csv("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/housing-with-missing-value.csv")

#Mediante la funci�n impute de Hmisc podemos reemplazar los valores perdidos
#En este caso con la media

casas_boston$ptratio<-impute(casas_boston$ptratio, fun = mean)

casas_boston$rad<-impute(casas_boston$rad, fun = mean)

summary(casas_boston)

#Por ejemplo con la mediana

casas_boston<-read.csv("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/housing-with-missing-value.csv")

casas_boston$ptratio<-impute(casas_boston$ptratio, fun = median)

casas_boston$rad<-impute(casas_boston$rad, fun = median)

summary(casas_boston)

#Es interesante obervar los valores que se han a�dido, mediante la funci�n summary
#Podemos observa como cambian media y mediana al reemplazar los NAN

#Tambi�n se puede reemplazar por un valor concreto

casas_boston<-read.csv("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/housing-with-missing-value.csv")

casas_boston$ptratio<-impute(casas_boston$ptratio, fun = 18)

casas_boston$rad<-impute(casas_boston$rad, fun = 7)

summary(casas_boston)

#Es importante notar que si existe un gran n�mero de observaciones y pocos valores perdidos
#Puede ser lo mejor eliminar esas observaciones, para los que se tienen los valores perdidos

#Tambi�n pueden eliminarse las columnas con un mayor n�mero de valores faltantes.

#En otros casos, es m�s �til reemplazar estos valores por la media, mediana, moda o 
#un valor concreto. Esto debe realizarse cuando eliminar los registros con informaci�n faltante
#pueda reducir dr�sticamente el conjunto de datos. En este caso, habr� que valorar
#que dato es m�s adecuado para completar dicho registro. Por ejemplo, no usar la media cuando
#esta no sea sea representativa de dicha muestra.

casas_boston<-read.csv("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/housing-with-missing-value.csv")
#Antes de reemplazar valores faltantes o eliminarlos, es importante observar cu�l es el patr�n 
#que siguen los datos faltantes


library(mice)

md.pattern(casas_boston)

#Esto nos muestra una tabla con los valores perdidos
#La primera fila, nos indica cuantos registros tienen presentes todos los valores de las 
#variables estudiadas
#La segunda, cuantos valores tienen perdida alguna de las variables (aparecer� marcada con un 0)
#la variable que que presente dichos valores perdidos.
#As� hasta mostrar todas las variables

#La columna izquierda muestra el n�mero de registros de cada tipo.
#La columna derecha nos ofrece para cuantas variables existen los valores perdidos de la izquierda
#La �ltima fila muestra el total de valores perdidos por variable, junto que el �ltimo valor
#A la derecha del todo, que muestra el total de valores peridos en el conjunto de datos


#Visualizaci�n gr�fica de los valores perdidos
library(VIM)

aggr(casas_boston,
     col=c("green", "red"),
     numbers=TRUE, #A�adimos el n�mero de faltantes con respecto al total
     sortVars=TRUE, #Ordenamos de mayor a menor registros faltantes
     labels=names(casas_boston),
     cex.axis=0.7, #Para reducir el nombre de las variables
     gap = 1, #Espacio entra gr�ficos
     ylab=c("Histograma de NAN's", "Patr�n"), #Nombres de los gr�ficos
     xlab=c("Variables","Variables")) 

#Las barras rojas indican el porcentaje de valores perdidos y para que variables
#Por otro lado, el gr�fico derecho, nos muestra un indicativo de cuantos faltan para
#cada variable y de los casos comunes. 
# !!!! IMPORTANTE AUMENTAR EL PANEL GR�FICO PARA QUE MUESTRE TODOS LOS NOMBRES Y ATRIBUTOS