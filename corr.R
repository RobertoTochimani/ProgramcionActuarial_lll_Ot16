
 corr <- function(directorio=setwd
                      ("~/caso/specdata"), horizonte = 0) {
  
  getwd()
  setwd(directorio)
  covt <- vector("numeric")
  idt <- vector("numeric")
  dimension <- 332
  
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
    completos <- complete.cases(data)
    x<-data[completos, 2:3]
    z<-nrow(x)
    
    #desicion
    if (z >= horizonte) {
      
      mediax<- mean(data[completos,2]) 
      mediay<- mean(data[completos,3]) 
      
      #para x
      
      mediax2<-data[completos,2]^2
      mediax2<-mean(mediax2)*z
      mediax2
      mediax2<-mediax2/(z-(mediax ^2))
      mediax2<-mediax2 ^ 0.5
      
      #para y
      mediay2 <- data[completos,3]^ 2
      mediay2 <- mean(mediay2)* z
      mediay2 <- mediay2/(z-(mediay^2) )
      mediay2  <- mediay2 ^0.5
     
      #para XY 
      mediaxy <- data[completos,2] * data[completos,3 ]
      mediaxy <- mean(mediaxy) * z
      mediaxy <-mediaxy /(z- (mediax*mediay))
      
      #resultado
      cov <- mediaxy /( mediay2 * mediax2 )
      cov
      covt<- c(covt,cov)
      idt <-c(idt,i)
      
    }
    
    
  } 
  resultado <- data.frame(idt,covt)
  names(resultado)<- c("id","covarianza")
  resultado
}
      
    
      
  
