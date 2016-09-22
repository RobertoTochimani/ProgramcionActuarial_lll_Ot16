#Inicio
completos <- function(directorio=
                      ("~/caso/specdata"),id = 1:332){
 #asigna directorio
  
   getwd()
  setwd(directorio)
  
  #asigna valores
  
  dimension <- length(id)+id[1]-1
  j<-id[1] 
  total <- vector("numeric")
  monitor <- vector("numeric")
  
  
  for (i in j:dimension) {
    
    #asigna nombre
    
    if (i < 100) {
      nombre <- paste("0",i,".csv",sep = "")}
    if (i < 10) {
      nombre <- paste("00",i,".csv",sep = "")}
    if (i >= 100) {
      nombre <- paste(i,".csv",sep = "")
    }
    
    #leer
  
    data <- read.csv(nombre,header = TRUE)
  
  #cuerpo
  
   cmp <- complete.cases(data)
   subtotal <- cmp[cmp== TRUE]
   subtotal2 <- length(subtotal)
  
  if ( subtotal2 > 0) {
    monitor<- c(monitor,i)
    total<- c(total,subtotal2)
    
  }
  
  }
  #crea tabla y entrega 
      x <- data.frame(monitor,total)
    names(x)<-c("id","nobs")
    x
}
#Fin