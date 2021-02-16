if (!require("scales")) install.packages("scales")

library(scales)

estudiantes<-read.csv("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/data-conversion.csv")

View(estudiantes)

#Reescalamos los datos al intervalo [0,1]. (valor-min(valores))/(max(valores)-min(valores))

estudiantes$salario_reescalado<- rescale(estudiantes$Income)

View(estudiantes)

(estudiantes$Income-min(estudiantes$Income))/(max(estudiantes$Income)-min(estudiantes$Income))

#Se reescala cambiando al intervalo [1,100]

rescale(estudiantes$Income, to=c(1,100))

colnames(estudiantes)

typeof(estudiantes$Income)

reescalar_data_frame<- function(DataFrame, variables, min_intervalo, max_intervalo){
    for (columna in variables){
        DataFrame[paste(columna,"reescalada",sep = "_")]<-rescale(DataFrame[,columna],
                                                                to=c(as.integer(min_intervalo), as.integer(max_intervalo)))
        cat(paste("La variable: ", columna, "ha sido reescalada al intervalo [" , min_intervalo, "," , max_intervalo , "] \n"))
    }
  return(DataFrame)
}

View(reescalar_data_frame(estudiantes,"Income",10,100))

colnames(estudiantes)

View(reescalar_data_frame(estudiantes,c("Age", "Height" ,"Income"),10,100))