library(mice)

casas_boston_perdidos<- read.csv("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/housing-with-missing-value.csv",
                                 stringsAsFactors = FALSE, header = TRUE)

columnas_con_faltantes<- c("ptratio", "rad")

#podemos crear un modelo de datos para predecir los valores de las variables con valores perdidos

imputar_datos<-mice(casas_boston_perdidos[,names(casas_boston_perdidos) %in% columnas_con_faltantes],
                    m=5, #Número de valores imputados
                    maxit = 50, # Número máximo de iteraciones del algoritmo
                    method = "pmm", # Promedio predictivo (Se trata de predecir el modelo predictivo)
                    seed = 2018 #Fijamos una semilla para que siempre sea el "mismo" aleatorio
                    )

#Nos devuelve m*maxit número de elementos

#A mayor número de muestas disminuimos el error 

#Existen más metodos, "pmm" = comparación predicitiva de medias
#Regresión logística, "logreg" Necesita un factor con dos niveles (variable a predecir los NAN)
#Regresión logística plonómica, "polyreg"  Puede usar un factor de más de dos niveles
#Modelo de probabilidades promocionales, "polr" Variables cardinales con más de dos niveles