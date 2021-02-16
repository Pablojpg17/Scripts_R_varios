#Trabajando con RDatas

clientes <- c("Juan Gabriel", "Ricardo" ,"Pedro")

#Fechas
fechas <- as.Date(c("2021-01-02","2021-01-03","2021-01-04"))

pagos<-c(200.2,415.12,20.28)

pedidos<-data.frame(clientes, fechas, pagos)

View(pedidos)

#Guardamos el dataframe como un RData

save(pedidos, file="../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/pedidos.Rdata" #nombre del fichero
     )
#Formato RDS

saveRDS(pedidos, file="../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/pedidos.rds" #nombre del fichero
)

#Se puede guardar con un elemento más

cliente_vip<-c("Pablo", "Romero")

save(pedidos,cliente_vip, file="../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/pedidos.Rdata" #nombre del fichero
)

#Eliminar archivos para liberar RAM

remove(pedidos)

#Cargar a partir de los RData

pedidos_cargados<-load("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/pedidos.Rdata")

pedidos_rds<-readRDS("../Cursos Udemy/Machine Learning con R/r-course-master/data/tema1/pedidos.rds")

#Cargamos a partir de los datasets por defecto en R

iris<-as.data.frame(data("iris"))

cars<-as.data.frame(data("cars"))

#save.image(file="../") De este modo podemos guardar todos los datos de la
#sesión actual.

primos<-c(2,3,5,7,11,13)
potencias2<-c(2,4,8,16,32,64,128)

#Podemos guardar todo esto a partir de una list
#save(list=c("primos","potencias2"), file="../")

attach() #libera las variables de un conjunto y las devuelve 
#como variables goblales

data() #Paquetes y Conjuntos de datos disponibles por defecto


#Paquetes y Conjuntos de datos disponibles en todos los paquetes instalados

data(package = .packages(all.available = TRUE))

