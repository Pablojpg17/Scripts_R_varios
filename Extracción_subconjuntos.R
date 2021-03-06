datos<-read.csv("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/auto-mpg.csv",
                stringsAsFactors = FALSE)

#Indices por posici�n

View(datos)

#Operadores l�gicos 

# AND: &
# OR: |
# NOT: !
# Igualdad: == (Comparaci�n)
#Asignaci�n: =

#Slicing
datos[1:5, 8:9]

#Mediante  vectores especificando columnas exactas
datos[1:5 , c(8,9)]

#Indice por nombre

datos[1:5 , c("model_year", "car_name")]

#Obtener los datos verificando condiciones

#Obtenemos los registros que m�s y menos consumen (millas por gale�n)
#Para ello usamos el condicional "O" (OR) indicado mediante el operador pipe "|"
datos[datos$mpg==max(datos$mpg) | datos$mpg==min(datos$mpg),]

#Filtros con condiciones. Se aplican a las filas y luego que columnas se quieren visualizar

datos[datos$mpg>30 & datos$cylinders==6, ]

datos[datos$mpg>30 & datos$cylinders==6, c("car_name", "mpg") ]

#Se pueden usar abreviaturas en caso de que no haya confusi�n
datos[datos$mpg>30 & datos$cyl==6, c("car_name", "mpg") ]


#En lugar de acceder por indices, podemos obtener subconjuntos
#Para ello se utiliza la funci�n subset

subset(datos, mpg>30 & cylinders ==6,
       select = c("car_name", "mpg"))

#Tambi�n es �til para eliminar (o excluir columnas) filas o columnas. Para ello basta indicar un menos delante

datos[1:5, c(-1,-9)]

datos[1:5, -c(1,9)]

#En este caso no se puede acceder por nombre

#datos[1:5, -c("No","car_name")]


#Basta acceder mediante el operador in
datos[1:5, !names(datos) %in% c("No", "car_name")]

datos[datos$mpg %in% c(15,20), c("car_name", "mpg")]


#Tambi�n se puede acceder mediante un vector booleano.
#Atenci�n!! Si no se indica el tama�o completo del vector, R recicla este hasta que termine

datos[c(F,F,F,F,T), c(F,F,T)] #Devuelve la tercera columna en grupos de tres y la quinta fila en grupos de 5

