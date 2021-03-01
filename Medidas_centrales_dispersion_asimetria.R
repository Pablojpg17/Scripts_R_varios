datos<-read.csv("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema2/auto-mpg.csv",
                stringsAsFactors = FALSE, #Para no crear variabls categóricas y obtener los NA
                header = TRUE)

summary(datos)

#La cilindrada no debe ser una columna numérica

datos$cylinders<-factor(datos$cylinders,
                           levels = c(3,4,5,6,8), #Tipos de cilindrada de un vehículo
                           labels = c("3cil", "4cil","5cil", "6cil", "8cil"))

summary(datos)


#Función str para observar la estructura del dataframe

str(datos)

#Devuelve el tipo de objetos de las variables del dataframe y algunos ejemplos

#Tambén es posible acceder con estas funciones a cada variable

summary(datos$cylinders) #Frecuencias absolutas para variables categóricas

summary(datos$displacement) #Estadísticos básicos para variables numéricas

str(datos$cylinders)

library(modeest) #Para calcular la moda

library(raster) #Para los quantiles y el coeficiente de variación

library(moments) #Para el coeficiente de asimetría y la curtosis

######## Medidades de centralización ########

#Para no repetir datos$... liberamos las variables 

attach(datos)

#Media aritmética (Suma de todos los valores partido por el número total de elementos)

mean(mpg)

sum(mpg)/length(mpg)

#Mediana. Ordenados todos los valores, se toma el valor centra. Si el número total de
#valores es par, se coge la media de los dos valores centrales

median(mpg)

#Moda. El valor más frecuente

modeest::mfv(mpg) #Most frecuent Value

#Percentiles. Divide a la muestra en 100 partes iguales. 

quantile(mpg) #Devuelve los valores mínimo y máximo, junto los demás quartiles

########## Medidas de dispersión ########

#Varianza. Como los valores se desplazan de la media. Cuanto más parecidos sean los valores
#menos varianza tendrán. Debido a elevar al cuadrado, tiene más sentido utilizar la desviación típica
#Se eleva al cuadrado para no usar el valor absoluto, debido a los problemas de variabilidad

var(mpg)

#Desviación típica. Como los valores se desplazan de la media. 

sd(mpg)

#Coeficiente de variación. A mayores valores del coeficiente, los datos presentan una mayor dispersión

raster::cv(mpg)

######### Momento de orden r respecto de la media #########

#Suma de las diferencias elevadas a r, dividido por el número total de muestras

#Coeficiente de asimetría de Fisher. Momento de orden 3 dividido por la desviación típica al cubo

#Interpretación del coeficiente de asimetría.

#Un valor de 0 para dicho estadístico, indica una que la distribución es simétrica, 
#es decir, la mitad de los datos se encuentran por debajo de la media y la otra mitad por encima.
#Por lo tanto, media=mediana

#Para valores negativos, media < mediana. Más valores distintos a la izquierda de la media
#Para valores positivas, media > mediana. Más valores distintos a la derecha de la media

moments::skewness(mpg)

#Curtosis. Momento de orden 4 divdido por la desviación típica a la cuarta, todo ello menos tres

#Interpretación de la curtosis.

#Un valor 0 indica una distribución perfectamente "distribuida". Es decir, los valores
#se reparten como en una distribución normal, repartidos tanto por el centro como por las colas
#Distribución Mesocúrtica.

#Valores positivos, indican una distribución Leptocúrtica, es decir, más valores centrados, y menos en las colas

#Valores negativos indican una fuerte presencia de valores en las colas, respecto a los valores centrales.
#Distribución Platicúrtica.

moments::kurtosis(mpg)

par(mfrow=c(1,1))

hist(mpg) #Forma de la distribución

hist(horsepower)
