estudiantes<-read.csv("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/data-conversion.csv")

library(dummies)

#Vamos a crear un nuevo DataFrame a partir del anterior
#Este nuevo DataFrame contendrá una variable nueva por cada categoría posible
#En cada uno de las variables del dataframe, con un 0 para indicar la ausencia
#A esa categoría y un 1 para la pertenencia. Esto se crea para las variables categóricas

estudiantes_dummies<-dummy.data.frame(estudiantes,
                                      sep="_")


View(estudiantes_dummies)


#Podemos especificar que solo tenga las variables dummie

estudiantes_dummies<-dummy.data.frame(estudiantes,
                                      sep="_",
                                      all = FALSE)

View(estudiantes_dummies)

#Podemos hacerlo para cada una de las variables, una por una

dummy(estudiantes$Gender, sep = "_")

#Se pueden indicar exactamente las que se quieren solo para el DataFrame

estudiantes_dummies<-dummy.data.frame(estudiantes,
                                      sep="_",
                                      all = TRUE,
                                      names = c("State", "Gender"))

View(estudiantes_dummies)
