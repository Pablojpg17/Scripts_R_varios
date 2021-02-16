estudiantes<-read.csv("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/data-conversion.csv")
head(estudiantes)

sueldos<-c(-Inf, 10000,31000,Inf)

#sueldos<-as.factor(sueldos)

nombres<-c("Bajos", "Medios", "Altos")

#Hemos categorizado así los ingresos de cada uno de los miembros del DataFrame.
#Se ha definido por tramos
#Se necesita un número menos de catagorías que de "cortes". Cada nivel del factor
#llega hasta la frontera superior

estudiantes$sueldos_categoricos=cut(x = estudiantes$Income, 
                                     breaks = sueldos,
                                     labels = nombres)

head(estudiantes)

#No es necesario dar un nombre, se asocia por defecto el intervalo al que pertenece

estudiantes$sueldos_categoricos_sin_nombre=cut(x = estudiantes$Income, 
                                    breaks = sueldos)

head(estudiantes)

#Sin ofrecer los cortes

estudiantes$sueldos_categoricos_sin_definir<-cut(estudiantes$Income, 
                                                 breaks = 4,
                                                 labels = c("Nivel 1",
                                                            "Nivel 2",
                                                            "Nivel 3",
                                                            "Nivel 4"))

View(estudiantes)


estudiantes$sueldos_categoricos_sin_definir<-cut(estudiantes$Income, 
                                                 breaks = 4)
View(estudiantes)
