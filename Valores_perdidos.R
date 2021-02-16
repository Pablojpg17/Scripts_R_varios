datos_faltantes<-read.csv("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/missing-data.csv",
                          na.strings = "")

View(datos_faltantes)

#Eliminamos aquellos registros que tienen NA'ns (No disponibles)

datos_limpios<-na.omit(datos_faltantes)

View(datos_limpios)

#Ver si un dato es NA o no

is.na(datos_faltantes[4,2])

#Podemos observar si todos los datos de una variable son faltantes o no

is.na(datos_faltantes$Income)

#Lo aplicamos a todo el DataFrame

is.na.data.frame(datos_faltantes)

#Contamos los no disponibles

length(is.na.data.frame(datos_faltantes)==TRUE)


#Podemos filtrar por aquellos datos que registros que una cierta variable no está diponible

datos_faltantes_income_limpios<- datos_faltantes[!is.na(datos_faltantes$Income),]

#Podemos observar todos los registros completos

complete.cases(datos_faltantes)

#Podemos borrar también los valores perdidos filtrando por los casos completos

datos_faltantes[complete.cases(datos_faltantes),]

#Podemos completar NA para ciertos casos
#Por ejemplo, los ceros en ingresos

datos_faltantes$Income[datos_faltantes$Income==0]

#Asignamos los valores NA a los 0

datos_faltantes$Income[datos_faltantes$Income==0]<-NA

#Ya no tenemos 0 en esta variable

datos_faltantes$Income[datos_faltantes$Income==0]

#Medidas de tendencia central y dispersión

#Obtenemos la media de ingresos

mean(datos_faltantes$Income)

#Como hay NA, no es capaz de calcularlo. Podemos ignorar estos

mean(datos_faltantes$Income,na.rm = TRUE)

#Desviación típica

sd(datos_faltantes$Income)

#Pasa lo mismo que con la media

sd(datos_faltantes$Income, na.rm = TRUE)

#Podemos obtener todos los estadísitcos básicos como sigue

summary(datos_faltantes)