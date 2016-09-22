#funcion
completos <- function(directorio=setwd
                      ("~/caso/specdata"),id = 1:332){
  getwd()
  setwd(directorio)
    
  dimension <- length(id)
    total <- vector("numeric")
    monitor <- vector("numeric")
  
  
  for (i in 1:dimension) {
    #asigna nombre
    if (i < 100) {
      nombre <- paste("0",i,".csv",sep = "")}
    if (i<10) {
      nombre <- paste("00",i,".csv",sep = "")}
    if (i >=100) {
      nombre <- paste(i,".csv",sep = "")
    }
    #leer
  data <- read.csv(nombre,header = TRUE)
  
  cmp <- complete.cases(data)
  subtotal <- cmp[cmp== TRUE]
  subtotal2 <- length(subtotal)
  monitor<- c(monitor,i)
  total<- c(total,subtotal2)
  }
  #crea tabla y entrega 
      x <- data.frame(monitor,total)
    names(x)<-c("id","nobs")
    x
  }
  