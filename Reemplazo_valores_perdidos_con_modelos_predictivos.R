library(mice)

casas_boston_perdidos<- read.csv("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/housing-with-missing-value.csv",
                                 stringsAsFactors = FALSE, header = TRUE)

columnas_con_faltantes<- c("ptratio", "rad")

#podemos crear un modelo de datos para predecir los valores de las variables con valores perdidos

help("mice")

imputar_datos<-mice(casas_boston_perdidos[,names(casas_boston_perdidos) %in% columnas_con_faltantes],
                    m=5, #N�mero de valores imputados
                    maxit = 50, # N�mero m�ximo de iteraciones del algoritmo
                    method = "pmm", # Promedio predictivo (Se trata de predecir el modelo predictivo)
                    seed = 2018 #Fijamos una semilla para que siempre sea el "mismo" aleatorio
                    )

#Nos devuelve m*maxit n�mero de elementos

#A mayor n�mero de muestas disminuimos el error 

#Existen m�s metodos, "pmm" = comparaci�n predicitiva de medias
#Regresi�n log�stica, "logreg" Necesita un factor con dos niveles (variable a predecir los NAN)
#Regresi�n log�stica plon�mica, "polyreg"  Puede usar un factor de m�s de dos niveles
#Modelo de probabilidades promocionales, "polr" Variables cardinales con m�s de dos niveles

#Resumen del modelo

imputar_datos

summary(imputar_datos)

datos_completos<-mice::complete(imputar_datos) #As� sustituimos los valores perdidos en los or�genes por los predichos

#Ahora, sustituimos los valores en el datafrem original

casas_boston_perdidos$rad <- datos_completos$rad

casas_boston_perdidos$ptratio <- datos_completos$ptratio

#Podemos saber si existen NA'ns en un dataframe

anyNA(casas_boston_perdidos)

#Tambi�n podemos inferir los datos NAN's mediante el paquete Hmisc

#Cargamos de nuevo para tener los valores perdidos

casas_boston_perdidos<- read.csv("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/housing-with-missing-value.csv",
                                 stringsAsFactors = FALSE, header = TRUE)

library(Hmisc)

help("aregImpute")

imputar_hmisc<- aregImpute(formula = ~ptratio+rad, 
                           data = casas_boston_perdidos,
                           n.impute = 5,  #N�mero de valores previstos que va a calcular
                           plotTrans = TRUE)

imputar_hmisc$rsq #El estd�stico R^2 nos ofrece la bondad del modelo para cada variable inferida
#Valores cercanos a 0, implican malos ajustes, valores cercanos a uno, buenos ajustes

imputar_hmisc$imputed #Valores predichos para todas las variables. En este caso 5 posibles para cada NAN's 


