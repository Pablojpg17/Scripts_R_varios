datos<-read.csv("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema2/auto-mpg.csv",
                stringsAsFactors = FALSE, #Para no crear variabls categ�ricas y obtener los NA
                header = TRUE)

summary(datos)

#La cilindrada no debe ser una columna num�rica

datos$cylinders<-factor(datos$cylinders,
                           levels = c(3,4,5,6,8), #Tipos de cilindrada de un veh�culo
                           labels = c("3cil", "4cil","5cil", "6cil", "8cil"))

summary(datos)


#Funci�n str para observar la estructura del dataframe

str(datos)

#Devuelve el tipo de objetos de las variables del dataframe y algunos ejemplos

#Tamb�n es posible acceder con estas funciones a cada variable

summary(datos$cylinders) #Frecuencias absolutas para variables categ�ricas

summary(datos$displacement) #Estad�sticos b�sicos para variables num�ricas

str(datos$cylinders)

library(modeest) #Para calcular la moda

library(raster) #Para los quantiles y el coeficiente de variaci�n

library(moments) #Para el coeficiente de asimetr�a y la curtosis

######## Medidades de centralizaci�n ########

#Para no repetir datos$... liberamos las variables 

attach(datos)

#Media aritm�tica (Suma de todos los valores partido por el n�mero total de elementos)

mean(mpg)

sum(mpg)/length(mpg)

#Mediana. Ordenados todos los valores, se toma el valor centra. Si el n�mero total de
#valores es par, se coge la media de los dos valores centrales

median(mpg)

#Moda. El valor m�s frecuente

modeest::mfv(mpg) #Most frecuent Value

#Percentiles. Divide a la muestra en 100 partes iguales. 

quantile(mpg) #Devuelve los valores m�nimo y m�ximo, junto los dem�s quartiles

########## Medidas de dispersi�n ########

#Varianza. Como los valores se desplazan de la media. Cuanto m�s parecidos sean los valores
#menos varianza tendr�n. Debido a elevar al cuadrado, tiene m�s sentido utilizar la desviaci�n t�pica
#Se eleva al cuadrado para no usar el valor absoluto, debido a los problemas de variabilidad

var(mpg)

#Desviaci�n t�pica. Como los valores se desplazan de la media. 

sd(mpg)

#Coeficiente de variaci�n. A mayores valores del coeficiente, los datos presentan una mayor dispersi�n

raster::cv(mpg)

######### Momento de orden r respecto de la media #########

#Suma de las diferencias elevadas a r, dividido por el n�mero total de muestras

#Coeficiente de asimetr�a de Fisher. Momento de orden 3 dividido por la desviaci�n t�pica al cubo

#Interpretaci�n del coeficiente de asimetr�a.

#Un valor de 0 para dicho estad�stico, indica una que la distribuci�n es sim�trica, 
#es decir, la mitad de los datos se encuentran por debajo de la media y la otra mitad por encima.
#Por lo tanto, media=mediana

#Para valores negativos, media < mediana. M�s valores distintos a la izquierda de la media
#Para valores positivas, media > mediana. M�s valores distintos a la derecha de la media

moments::skewness(mpg)

#Curtosis. Momento de orden 4 divdido por la desviaci�n t�pica a la cuarta, todo ello menos tres

#Interpretaci�n de la curtosis.

#Un valor 0 indica una distribuci�n perfectamente "distribuida". Es decir, los valores
#se reparten como en una distribuci�n normal, repartidos tanto por el centro como por las colas
#Distribuci�n Mesoc�rtica.

#Valores positivos, indican una distribuci�n Leptoc�rtica, es decir, m�s valores centrados, y menos en las colas

#Valores negativos indican una fuerte presencia de valores en las colas, respecto a los valores centrales.
#Distribuci�n Platic�rtica.

moments::kurtosis(mpg)

par(mfrow=c(1,1))

hist(mpg) #Forma de la distribuci�n

hist(horsepower)
