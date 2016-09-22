#Inicio
mediacontaminante <- function(directorio=
                              ("~/caso/specdata"), contaminante ="sulfate", id = 1:332) {
  
  #asigna directorio
  
  getwd()
  setwd(directorio)
  
  #asigna valores
  
  suma <- 0
  total <- 0
  if (contaminante == "sulfate") {columna <- 2  }
  if (contaminante == "nitrate") {columna <- 3  }
  
  dimension <- length(id)+id[1]-1
  d <- id[1]
  suma <- 0
  divisor <- 0
  
  for (i in d:dimension) {
    
#escoje el nombre
    if (i < 100) {
      nombre <- paste("0",i,".csv",sep = "")}
    if (i<10) {
      nombre <- paste("00",i,".csv",sep = "")}
    if (i >=100) {
      nombre <- paste(i,".csv",sep = "")
    }
    
  #lee
    
  data <- read.csv(nombre,header = TRUE)
  data<- data[,columna]
  
  #cuerpo
  
  z <-length(data)
  contador<-0
  cond <- mean(data,na.rm = TRUE )
  if (cond > 0) {
  for (j in 1:z){
    
    if ( is.na(data[j])) {
      
      contador<- contador + 1
    }}
  
  #guarda valores
    
  z <- z - contador
  data<- mean(data,na.rm = TRUE ) * z
  suma <- suma + data 
  divisor <- divisor + z
  }
  
  }
  #Resultado y entrega
  
  total <- ( suma /divisor )
  total
}

#Fin