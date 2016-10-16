setwd("C:/Users/RobertoAct/Desktop/Caso ll")
rankingcompleto <- function(resultado, num = "mejor") {
     # Lectura de datos 
     data1 <- read.csv("outcome-of-care-measures.csv ",stringsAsFactors=FALSE)
     
     #algunos condiciones
     x<- NaN
     veces <- NaN
     if (num=="mejor") {
          lugar<-min
          veces<-1
          
     }
     if (num=="peor") {
          lugar <- max
          veces <- 1
          
     }
     if (is.numeric(num)) {
          lugar<-min
          veces<-num
          
     }
     if (resultado=="ataque") {
          x <-"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"    }
     if (resultado=="falla") {
          x <-"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"   }
     if (resultado=="neumonia") {
          x <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
     }
     
     if (is.nan(x)|is.nan(veces)) {
          stop("Resultado inválido")
     }else if (!is.nan(x)&!is.nan(veces)) {
           Hospital.name <- vector("character")
           Hospital.state <- vector("character")
           Hospital.percent <- vector("character")
     
     #hace nueva tabla con 3 columnas
     
          nombres<-c("Hospital.Name", "State",x )
          data1<-subset(data1,select = nombres)
          estado<- unique(data1[,2])
          estado<-sort(estado)
     for (i in 1:length(estado)) {
          
          data2<-subset(data1,data1[,2]==estado[i])
          data2<-subset(data2,data2[,3]!="Not Available")
          data2[,3]<- as.numeric(as.character(data2[,3]))
          if (nrow(data2)< veces) {
               Hospital.name<-c(Hospital.name,"<NA>")
               Hospital.state<-c(Hospital.state,estado[i])
          }else if (nrow(data2)>=veces) {
               
          
          #elije el mejor en num dado
          name1<- vector("character")
          percent1<- vector("numeric")
          j<-1
          for (j in 1:veces) {
          
               y <- lugar(data2[,3])   
               c<-subset(data2[,1],data2[,3]==y)
               c<-sort(c)
               name1<-c(name1,c)
               data2 <- subset(data2,data2[,3]!=y)
               
          }
               
          #guarda datos 
          Hospital.name<-c(Hospital.name,name1[veces])
          Hospital.state<- c(Hospital.state,estado[i])
          
          
          
     }
     }
     #últimas condiciones
     
     # Regresa el nombre del hospital con la tasa más baja de mortalidad de 30 días 
     
     d<-data.frame(Hospital.name,Hospital.state)
     row.names(d)<- estado
     colnames(d)<-c("Hospital","Estado")
     d
     }
} 
