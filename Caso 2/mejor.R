setwd("C:/Users/RobertoAct/Desktop/Caso ll")
mejor <- function(estado, resultado) { 
     # Lectura de datos 
     
     data1 <- read.csv("outcome-of-care-measures.csv ",stringsAsFactors=FALSE)
     con1<-data1[,7]==estado
     
     # Revisión de la validez de estado y resultado 
     if (sum(con1)>1) {
     
      x<- NaN
     if (resultado=="ataque") {
          x <-"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"    }
     if (resultado=="falla") {
          x <-"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"   }
     if (resultado=="neumonia") {
          x <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
     }
     nombres<-c("Hospital.Name", "State",x )
     data1<-subset(data1,select = nombres)
     data1<-subset(data1,data1[,2]==estado)
     data1<-subset(data1,data1[,3]!="Not Available")
     data1[,3]<- as.numeric(as.character(data1[,3]))
     
     
     }
    
     
     if (sum(con1)<1) {
          print(paste("Error in best(",estado,resultado,") : invalid state"))
          
     }
     
     if (is.nan(x)) {
          print(paste("Error in best(",estado,resultado,") : invalid outcome"))
          
     }
     
     
     
     
     # Regresa el nombre del hospital con la tasa más baja de mortalidad de 30 días 
     y <- min(data1[,3])
     Hospital.name<-subset(data1,data1[,3]==y)
     Hospital.name

 }