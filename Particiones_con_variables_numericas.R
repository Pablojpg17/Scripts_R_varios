require(caret)

datos<-read.csv("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/BostonHousing.csv",
                stringsAsFactors = FALSE)

#Es importante dividir la información original en diferentes particiones para
#entrenar y validar cada uno de los modelos de aprendizaje automático construidos

View(datos)

#Vamos a partir de la variable MEDV, esta indica la renta con la que se puede vivir en cada una de las casas estudiadas

#La función createDataPartition selecciona de forma aleatoria indices de fila, tantos como el porcentaje de datos
#especifacado. Funciona creando una muestra de la siguiente forma.
#Dado un vector numérico, obtiene una muestra aleatoria partiendo en percentiles, para que esta sea uniforme
#Por defecto divide en cinco, aunque se puede usar el parámetros groups para indicar los necesarios.

#En caso de que sea categórica, lo realiza aleatoriamente, tratando de que exista un 
#número balanceado de muestras suficientes de cada categoría

identificadores_entrenamiento<-createDataPartition(datos$MEDV,
                                                   p=0.8, #Porcentaje de valores incluidos en la partición (Un 80%) en este caso
                                                   list = F, #Para que no devuelva una lista de conjuntos
                                                   )
#Esto nos devuelve identificadores de las filas, para poder añadirlos o quitarlos posteriormente

View(identificadores_entrenamiento)

datos_entrenamiento<-datos[identificadores_entrenamiento, ]

datos_validacion<-datos[-identificadores_entrenamiento, ]

identificadores_entrenamiento_2<-createDataPartition(datos$MEDV,
                                                   p=0.7, 
                                                   list = F)

datos_entrenamiento_2<-datos[identificadores_entrenamiento_2, ]

temp<-datos[-identificadores_entrenamiento_2,]

#Necesario para no repetir información del original. 

identificadores_validacion_2<-createDataPartition(temp$MEDV,
                                                  p=0.5, 
                                                  list = F)

datos_validacion_2<-temp[identificadores_validacion_2,]

datos_testeo_2<-temp[-identificadores_validacion_2,]