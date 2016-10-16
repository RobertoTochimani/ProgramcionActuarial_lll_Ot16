setwd("C:/Users/RobertoAct/Desktop/Caso ll")
rankhospital <- function(estado, resultado, num = "best") { 
     # Lectura de datos 
     Hospital.name <- vector("character")
     Hospital.percent <- vector("numeric")
     
     
     data1 <- read.csv("outcome-of-care-measures.csv ",stringsAsFactors=FALSE)
     con1<-data1[,7]==estado
     
     # Revisión de la validez de estado y resultado 
     if (sum(con1)>1) {
          
          x<- NaN
          
          #decide tercera columna
          
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
          
          #decide la acción
          
          #mejor
          
          if (num =="best") {
               lugar <- min
               y <- lugar(data1[,3])
               Hospital.name<-c(Hospital.name,subset(data1[,1],data1[,3]==y))
               Hospital.percent<-c(Hospital.percent,subset(data1[,3],data1[,3]==y))
               
          }
          #Peor
          if (num=="peor") {
               
               lugar<-max
               y <- lugar(data1[,3])
               Hospital.name<-c(Hospital.name,subset(data1[,1],data1[,3]==y))
               Hospital.percent<-c(Hospital.percent,subset(data1[,3],data1[,3]==y))
               
               
          }
          #Lista
          
          if (is.numeric(num)) {
               if (nrow(data1)<num) {
                    stop("numero inválido")
               }
               for (i in 1:num) {
                    y <- min(data1[,3])
                    
                    c<-subset(data1[,1],data1[,3]==y)
                    c<- sort(c)
                    Hospital.name<-c(Hospital.name,c)
                    Hospital.percent<-c(Hospital.percent,subset(data1[,3],data1[,3]==y))
                    data1 <- subset(data1,data1[,3]!=y)
                    
                    
               }
          }
          
          
          
     }
     if (!is.numeric(num)) {
          num<-1
     }
     
     
     if (sum(con1)<1) {
          print(paste("Error in best(",estado,resultado,") : invalid state"))
          
     }
     
     if (is.nan(x)) {
          print(paste("Error in best(",estado,resultado,") : invalid outcome"))
          
     }
     
     
     
     
     
     # Regresa el nombre del hospital con la tasa más baja de mortalidad de 30 días 
     data.frame(Hospital.name[1:num],Hospital.percent[1:num])
     
}