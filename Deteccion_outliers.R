ozono<-read.csv("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/ozone.csv",
         stringsAsFactors = FALSE)

View(ozono)

#Detecci�n de valores at�picos univariantes para variables continuas

valores_atipicos<-boxplot(ozono$pressure_height)$out

valores_atipicos

#Iterpretaci�n del BoxPlot

#La l�nea que divide la caja, representa la mediana (Divide la muestra en dos partes iguales)
#El extremo inferior de la caja, representa el primer cuartil (Divide la muestra con el 75% de las observaciones por encima)
#El extremo superior de la caja, representa el tercer cuartil (Divide la muestra con el 25% de las observaciones por encima)
#La altura de la caja reprsenta el rango intercuart�lico 

#Cada bigote representa lo siguiente:

#Para el inferior, se define como el m�ximo entre 
#el m�nimo de la variable o el valor del primer cuartil - 1.5*rango intercuart�lico

#Para el superior, se define como el m�nimo entre 
#el m�ximo de la variable o el valor del tercer cuartil + 1.5*rango intercuart�lico

#Los valores mostrados fuera de los bigotes, son los considerados como valores at�picos,
#pues estos se salen de lo est�ndar.

boxplot(ozono$pressure_height,
        main= "Presi�n atmosf�rica",
        boxwex = 0.5 #Anchura de la caja
        )

#Podemos representar una variable frente a otra.

boxplot(pressure_height~Month,
        data = ozono, #Indicamos el origen de datos, para no usar en cada variable [nombre dataframe]$[nombre variable]
        main = "Presi�n atmosf�rica por Mes",
        boxwex = 0.5, #Anchura de la caja,
        ylab = "Presi�n Atmof�rica",
        xlab = "Mes"
)

boxplot(ozone_reading~Month,
        data = ozono, #Indicamos el origen de datos, para no usar en cada variable [nombre dataframe]$[nombre variable]
        main = "Ozono por Mes",
        boxwex = 0.5, #Anchura de la caja,
        ylab = "Ozono",
        xlab = "Mes"
)


#Para obtener directamente los valores at�picos a partir del BoxPlot, basta acceder
#a la variable "Out" del objeto BoxPlot

outliers<-boxplot(ozone_reading~Month,
        data = ozono, #Indicamos el origen de datos, para no usar en cada variable [nombre dataframe]$[nombre variable]
        main = "Ozono por Mes",
        boxwex = 0.5, #Anchura de la caja,
        ylab = "Ozono",
        xlab = "Mes"
)$out

sort(outliers, decreasing = FALSE)

#Mediante la funci�n Mtext podemos obtener texto despu�s y escribirlo en el gr�fico

mtext("Outliers: 9.93 11.06 22.89 24.29 29.79",
      side = 3 #Localizaci�n del exto (3=top, arriba)
      )
      