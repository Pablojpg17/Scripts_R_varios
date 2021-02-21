ozono <-
  read.csv(
    "../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/ozone.csv",
    stringsAsFactors = FALSE
  )

reemplzar_outliers <- function(columna, removeNA = TRUE #Parámetro por defecto a TRUE
                               ){
  cuantiles <- quantile(columna, c(0.05, 0.95), na.rm = removeNA)
  columna[columna<cuantiles[1]] <- mean(columna, na.rm = removeNA) #Para datos por debajo del primer cuantil calculado, reemplazamos dichos valores con la media
  columna[columna>cuantiles[2]] <- median(columna, na.rm = removeNA) #Para datos por encima del segundo cuantil calculado, reemplzamos por la mediana
  columna
}

reemplzo_ozono<- reemplzar_outliers(ozono$pressure_height)

#Vamos a visualizar los BoxPlot de ambas variables, uno con la información original
#Y otro con la información ya reemplzada

#Usamos la función par para poder juntar gráfivos

par(mfrow=c(1,2))


boxplot(ozono$pressure_height, main="Presión con outliers")

boxplot(reemplzo_ozono, main="Presión sin outliers")

reemplzar_outliers_2<-function(columna, removeNA=TRUE){
  cuartiles<-quantile(columna, probs = c(0.25,0.75), na.rm = removeNA)
  caps<-quantile(columna, probs = c(.05,.95), na.rm = removeNA)
  rango_intercuartilico<- cuartiles[2]-cuartiles[1]
  marca_bigote<-1.5*rango_intercuartilico
  columna[columna<cuartiles[1]-marca_bigote]<-caps[1] #Todo por debajo se reemplaza con el cuantil 0.05
  columna[columna>cuartiles[2]+marca_bigote]<-caps[2] #Todo por encima se reemplaza con el cuantil 0.95
  columna
}

presion_sin_outliers<-reemplzar_outliers_2(ozono$pressure_height)

par(mfrow=c(1,2))

boxplot(ozono$pressure_height, main="Presión con outliers")
boxplot(presion_sin_outliers, main="Presión sin outliers")

#Es oportuno realizar este tipo de transformaciones para modelos como los árboles de decisión
