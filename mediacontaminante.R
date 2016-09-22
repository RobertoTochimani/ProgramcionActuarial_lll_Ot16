

mediacontaminante <- function(directorio=setwd
                              ("~/caso/specdata"), contaminante ="sulfate", id = 1:332) {
  getwd()
  setwd(directorio)
  suma <- 0
  total <- 0
  if (contaminante == "sulfate") {columna <- 2  }
  if (contaminante == "nitrate") {columna <- 3  }
  
  dimension <- length(id)
  
  for (i in id) {
    
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
#cuerpo
    medias <- mean(data[ , columna],na.rm = TRUE )
    if (is.nan(medias)) {medias<-0    
    dimension <- dimension -1 }
    
    suma <- suma + medias
  }
 total <- (suma/dimension)
 #entrega resultado
 total
}
#fin


