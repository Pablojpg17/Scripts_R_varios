setwd("C:/Users/Pablo/Cursos Udemy/Machine Learning con R/r-course-master/scripts/tema1/")
getwd()
library(readr)
auto_mpg <- read_csv("~/Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/auto-mpg.csv")
View(auto_mpg)
auto <- read.csv("~/Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/auto-mpg.csv",
                 header = TRUE,
                 sep = ","
                 )
View(auto)
names(auto)
head(auto,4)
tail(auto,2)
summary(auto)
auto[1:4,]

#Leer de XML

library(XML)
#Situarse bien en la ruta cada vez. Usar tabulador para autocompletar
url_xml<-"../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/cd_catalog.xml"

#Hacemos un scrapping

xmldoc<- xmlParse(url_xml)

#Recuperar nodo raiz 

rootnode<- xmlRoot(xmldoc)

rootnode[1][1]

cds_data<-xmlApply(rootnode, function(x){xmlSApply(x, xmlValue)}) # Devuelve una lista con cada uno de los valores dentro del XML

#Convertimos la lista a DataFrame

catalogo_cds<-xmlToDataFrame(xmldoc)

summary(catalogo_cds)

#Leer desde un html

tables<-readHTMLTable("WorldPopulation-wiki.htm")

#Leer desde un JSON

library(jsonlite)

dat.1 <- fromJSON("students.json")

#Escribir a JSON#

toJSON(read.csv("auto-mpg.csv")) 

View(dat.1)

dat.2<- fromJSON("student-courses.json")

View(dat.2)
typeof(dat.1)

dat.1<-as.data.frame(dat.1)

typeof(dat.1)

head(dat.1,3)

dat.1[1:3,]

dat.1$Email

dat.1$Email[1:3]

dat.1[c(1,3,4), c(3,4)]

library(histogram)

summary(dat.1)

head(dat.2)

drop(dat.12)

#Ficheros de ancho fijo. 
#Se le pasa un vector con la longitud de cada uno de los campos
#No trae cabecera

estudiantes<-read.fwf("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/student-fwf.txt",
                      widths = c(4, 15, 20, 15, 4),
                      col.names = c("id", "nombre", "email", "carrera", "año"))

View(as.data.frame(estudiantes))

estudiantes$id

histogram(estudiantes$año)     

## Leer con cabecera ##

estudiantes_cabecera<-read.fwf("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/student-fwf-header.txt",
                      widths = c(4, 15, 20, 15, 4),
                      header = TRUE,
                      sep="\t", #Separador de las cabeceras
                      skip = 2) #Saltar las dos primeras líneas

summary(estudiantes_cabecera)

boxplot(estudiantes)

# Para no cargar una columna con el ancho fijo, se pone la longitud en negativa

estudiantes<-read.fwf("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/student-fwf.txt",
                      widths = c(4, 15, -20, 15, 4),
                      col.names = c("id", "nombre", "carrera", "año"))

View(estudiantes)
