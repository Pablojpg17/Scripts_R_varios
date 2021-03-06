library(tidyr)

crimenes<-read.csv("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/USArrests.csv",
                   stringsAsFactors = FALSE) #Para que cada string no sea una categor�a

View(crimenes)

summary(crimenes)

#A�adir columnas al dataframe original

crimenes<-cbind(state=row.names(crimenes), crimenes)

View(crimenes) #A�adimos una columna con el nombre de las fiales (en este caso son n�meros)

#Creaci�n de nuevos dataframes, "arrays asociativos".

crimenes_1<-gather(crimenes,
                   key = "tipo_crimen",
                   value = "arresto_estimado",
                   Murder:UrbanPop)

View(crimenes_1)

summary(crimenes_1)

#Se combinan los valores de las columnas entre asesinato y poblaci�n urbana. Se obtiene un
#nueva que es tipo_crimen, la cu�l es una variable categ�rica, que presenta la informaci�n
#de las tres columnas de tipos de cr�menes, y la variable del porcentaje de arrestos

#Se pueden resumir todas las columnas (se pueden quitar las que no con un -)

#Tablas de doble entrada, se convierte a un diccionario de pares clave (key) valor (value)
crimenes_2<-gather(crimenes,
                   key = "tipo_crimen",
                   value = "arresto_estimado",
                   -state, -X ) #Separando por comas, podemos indicar las columnas que queremos o no resumir, en este caso todas menos las dos mostradas

View(crimenes_2)

#Tambi�n puede deshacerse este proceso

crimenes_3<-spread(crimenes_2,
                   key = "tipo_crimen",
                   value = "arresto_estimado")

View(crimenes_3)

#Podemos tomar varias columnas y unificarlas en una sola

crimenes_4<- unite(crimenes,
                   col = "Asesinato_Asalto", 
                   Murder, Assault,
                   sep = "_")
View(crimenes_4)

#Tambi�n podemos separar las columnas unidas


crimenes_5<-separate(crimenes_4,
                     col = "Asesinato_Asalto", 
                     into= c("Murder", "Assault"),
                     sep = "_")

View(crimenes_5)
