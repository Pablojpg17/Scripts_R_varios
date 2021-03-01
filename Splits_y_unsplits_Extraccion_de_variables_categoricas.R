datos<-read.csv("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/auto-mpg.csv",
                stringsAsFactors = FALSE)

View(datos)

lista_coches<-split(datos, datos$cylinders)

#Esto nos devuelve una lista de dataframes, donde cada dataframe tiene los datos 
#Correspondientes de cada uno de los niveles de la variable categórica

lista_coches[1] #Accedemos a la lista del primer objeto de la lista

View(lista_coches[1]) #Accedemos a la lista del primer objeto de la lista

lista_coches[[1]] #Accedemos al objeto de la lista

View(lista_coches[[1]]) #Accedemos al objeto de la lista

str(lista_coches[1])

str(lista_coches[[1]])