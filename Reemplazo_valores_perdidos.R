datos_faltantes<-read.csv("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/missing-data.csv",
                          na.strings = "")

#Creamos una nueva columna para reemplazar los valores perdidos

datos_faltantes$Income_media<-ifelse(is.na(datos_faltantes$Income),
                                     mean(datos_faltantes$Income, na.rm = TRUE),
                                     datos_faltantes$Income)

View(datos_faltantes)

#Es mejor reemplazar los NA mediante un muestreo aleatorio. Esto sirve para todo tipo de variables
#No solo para las numéricas, como es el caso de la media

#Número de valores perdidos en la variable income
sum(is.na(datos_faltantes$Income))

#Reemplazo de NAN's con valores aleatorios de dicha variable

typeof(datos_faltantes$Income)

typeof(0.00)

entrada_aleatoria <- function(variable, reemplazar_ceros_con_NA){
  if(reemplazar_ceros_con_NA=='S' & (
    typeof(variable)=="integer") | 
    typeof(variable)=="double"){
         variable[variable==0]<-NA
  }
  perdidos<-is.na(variable)
  valores_perdidos <-sum(perdidos)
  variable_obs<-variable[!perdidos]
  entradas<-variable
  #Muestra aleatoria simple de la variable sin los NA, con reemplzamiento. 
  #El tamaño será el número de valores faltantes
  entradas[perdidos]<-sample(x = variable_obs,size = valores_perdidos, replace = TRUE)
  return(entradas)
}


#Definimos un método nuevo que reciba el DataFrame y reemplace los NAN de todas 
#las variables

ncol(datos_faltantes)

colnames(datos_faltantes)

entrada_aleatoria_data_frame<- function (DataFrame){
    
  for (variable in colnames(DataFrame)){
    DataFrame[paste(variable, "_reemplazo", sep = "")]<-entrada_aleatoria(DataFrame[,variable], 'S')
  }
  
  return(DataFrame)
}

datos_faltantes$Income<-entrada_aleatoria(datos_faltantes$Income)

datos_faltantes$Income

entrada_aleatoria(datos_faltantes$Income)

entrada_aleatoria(datos_faltantes$Phone_type)

View(entrada_aleatoria_data_frame(datos_faltantes))
