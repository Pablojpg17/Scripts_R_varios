familia_salarios=c(40000,60000,50000,60000,70000,80000,60000)

miembros_familia=c(4,3,2,2,3,4,3)

coche_ppla=c("Lujo", "Compacto", "Utilitario", "Lujo",
             "Compacto","Compacto","Compacto")

familias<-data.frame(familia_salarios, miembros_familia, coche_ppla)


#Podemos usar la función unique para eliminar registros duplicados

#Al DataFrame
unique(familias)

#A la variable
unique(familia_salarios)

#Podemos usar la función duplicated para detectar  los duplicados, sin tener que borrarlos

duplicated(familias)

duplicated(familia_salarios)

#DataFrame con los duplicados
familias[duplicated(familias),]

