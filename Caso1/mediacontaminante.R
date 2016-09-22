#asigna directorio
getwd()
setwd("~/caso/specdata")

<<<<<<< HEAD
=======
#funcion
>>>>>>> parent of bdaba27... esto es el fin de el caso :dancer:
mediacontaminante <- function(directorio=setwd
                              ("~/caso/specdata"), contaminante ="sulfate", id = 1:332) {
  suma <- 0
  total <- 0
  if (contaminante == "sulfate") {columna <- 2  }
  if (contaminante == "nitrate") {columna <- 3  }
  
  dimencion <- length(id)
  
  for (i in id) {
    
#escoje el nombre
    if (i < 100) {
      nombre <- paste("0",i,".csv",sep = "")}
    if (i<10) {
      nombre <- paste("00",i,".csv",sep = "")}
    if (i >=100) {
      nombre <- paste(i,".csv",sep = "")
    }
#read the document
    data <- read.csv(nombre,header = TRUE)
#deja que la magia ocurra
    medias <- mean(data[ , columna],na.rm = TRUE )
    if (is.nan(medias)) {medias<-0    
    dimencion <- dimencion -1 }
    
    suma <- suma + medias
  }
 total <- (suma/dimencion)
 #entrega resultado
 total
}
#fin


