#clase del 25/08/2016

#crear vectores
x <- vector(mode ="numeric",length=5L)

#Crear vectores con la funcion C
x <- c(0.5,0.6)
x

x <-c(TRUE,FALSE)
x
class(x)

x <-5:10
x
class(x)

x <-10:0
x
class(x)

x <-c(1+2i,5,3+9i,-4-5i)
x
class(x)

x <-c("a","b","c","d",e)
x
class(x)
#Mezclas de objetos en un vector
y <- c(1.7,"a")  #caracter
y
class(y)

y <-(TRUE , 2)     #numerico
y
class(y)


y <-c("a",TRUE)   #caracter
y
class(y)

y <-c(TRUE,10L,8.5,1+1i,"yo")
y
class(y)
#orden de coaccion explicita
#1 caracter
#2 complejo
#3 numerico
#4 entero
#5 logico
+
  #coercion explicita
  z <- 0:6
as.numeric(z)
as.logical(z)
as.character(z)


z <- c(1+2i,3+4i,8+0i,0+3i,0)
as.logical(z)

z <- c("Programacion","Actuarial","III")
z
as.numeric(z)
as.logical(z)
as.complex(z)

#LISTAS (es como un vector... pero de vectores y c/u tiene su propia clase)
x <- list(1,"a",TRUE,1+4i)
x

#matrices
m <- matrix(nrow = 2,ncol = 3)
m
dim(m)
attributes(m)
#cambio de dimeniones
dim(m)<- c(3,2)
m
#crear matriz con datos
m <- matrix(1:6, 3, 2)
m
#la t es true y mira el cambio en ala matriz 
m <- matrix
m <- matrix(1:6, 3, 2)
m
#observar me da pereza escribir :D
m <- matrix(1:6, 3, 3,T)
m
x<-c(1,2,3)
x
y<-c("a","b","c")
z<-c(x,y)
z

m1<-rbind(m,x)
m1
m2<-cbind(m,x)
m2

m1<-rbind(m,y)
m1
m2<-cbind(m,y)
m2

#factores
x <- factor(c("si","no","si","si","no","si","no"))
x
table(x) #cuenta 
unclass(x)
x <- factor(c("si","no","si","si","no","si","no"),levels = c("si","no")) #asigna el nivel manualmente #
x
table(x) 
unclass(x)

x <- factor(c("azul","azul","Rojo","amarillo","verde","azul"))
x

#Valores flatantes
x <- c(1,2,NA,10,3)
is.na(x)
is.nan(x)

x <- c(1,2,NaN,10,3)
is.na(x)
is.nan(x)

#data Frames son tablas 
x <- data.frame(Erick=1:4,Lori= c(T,T,F,F))
row.names(x)<- c("Primero","Segundo","Tercero","Cuarto")#asigna nombres a las filas
x
nrow(x)
ncol(x)
attributes(x)
names(x)<-c("Yarely","Karen")#cambia nombres de las columnas
x
#Los nombres no son exxclusivos de los dataframes 
x <-1:3
names(x)#NULL
x
names(x)<- c("Hugo","Paco","Luis")
x

x <-list(a=1:10,b=100:91,c=51:60)
x
names(x)<- c("sec 1","sec 2 ", "sec 3")
x

m <-matrix(1:4,2,2)
m
attributes(m)
dimnames(m)<- list(c("fill1","fill2"),c("col1","col2"))
m

m <- matrix(nrow = 6,ncol = 6)
dimnames(m)<- list(c(1:6),c("A","B","C","D","E","F"))
m
#lectura de datos
getwd()
setwd("~/Documentos/GitHub")
data <- read.csv("Datos_S&P.csv")
data <- read.table("Datos_S&P.csv",F,",")
data

##################################################################################

args("Datos_S&P.csv")
data <- read.table("Datos_S&P.csv",T,",", nrows = 100,skip = 5) #skik salta las primeras lineas dadas 
clases <- sapply(data, class)
data <- read.table("Datos_S&P.csv",TRUE,",", colClasses = clases)
data

#uso de dput y dget 
y <- data.frame(a=1,b="a")
dput(y)
dput(y,file = "y.R")# guarda "y" con el nombre" y.R" notese que la R es el tipo de archivo 

nueva.y <- dget("y.R") #llama el archivo Y.R y se lo asigna a nueva.y
nueva.y

x<- "Programación Actiarial III"
y <- data.frame(a=1,b="a")
dump(c("x","y"),file = "data.R")
rm(x,y)#remueve x e Y
source("data.R")#recupera los valores de x e Y
objeto <-head(airquality)
objeto

# URL
con <- url("http://www.fcfm.buap.mx/","r")
#la r es por sólo lectura read only
x <- readLines(con,7)
#read lines es para ver las primeras x lineas de la paguina 
x


#creamos un vector 
x <- c("a","b","c","d","e")
#vemos el vector 
x
#extraemos elementos con []
x[1]
x[2]
#Tambien podemos extraer una secuencia de elementos 
x[1:4]
#es posible extraer los elemntos que cumplen una restriccion
x[x>"b"]
#de manera equivalente se puede obtener un vector lógico
u <- x =="c"# en este caso buscamos las c´s en el vector x 
x[u]

#creamos una lista 
x <- list(foo=1:4, bar=0.6)
#extraemos el primer elemento de la lista ,
#este elemento es una lista que contiene una secuencia (esta será una lista )
x[1]
#extraemos nuevamente el primer elemento de la lista,
#ahora el elemento es la secuencia en si (un vector)
x[[1]]
#extraemos el elemento por nombre 
x$bar
x[["bar"]]
x["bar"]

#################################################################################

x$foo[2] #de la secuencia extrae el sehgundo elemento 

#creamos una lista de 3 elementos 
x <- list(foo=1:4, bar=0.6,baz="hola")
#extraemos el primer y tercer elemento de la lista 
x[c(1,3)]
x[[c(1,3)]]
name <-"foo"
x[[name]]
x$name
x$foo
#se pueden extraer elementos de los elementos extraidos
x <- list(a=list(10,12,14), b=list(3.14,2.81))
x[[c(1,3)]]
x[[1]][[3]]
x[c(2,1)]

x<- matrix(1:6,2,3)
x
x[1,2]
x[2,1]
x[1,]
x[,2]
#con drop=flase, se mantiene la dimencion y el resultado sera una matriz
x[1,2,drop = FALSE]
x[1, ,drop =FALSE]

x <- list(popo = 1:5)
x$p #se pueded utilizar esta funcion usando solo una de sus letras del nombre
x[["p"]] #notese que no sirve usando los cochetes a menos que ...
x[["p",exact = FALSE]]#uses exact
#valores faltantes 
airquality[1:6,]

completos <- complete.cases(airquality)
completos #True = no vacio
airquality[completos, ][1:6,]#xtraer de iarquality todos los valores true de la fila 1 a la 6
airquality[1:6,][completos,]
x <- 1:4 ; y <- 6:9
x+y

x>2
x>=2
y==8
x*y
x/y

x <- matrix(1:4,2,2) ; y <- matrix(rep(10,4),2,2)
#########rep repite un numero x veces, notar que en este caso x=4#####
x;y
x*y 
x%*%y                 #####multiplicacion de matices######

####################estructuras de control###########################

x <- c("a","b","c","d")
for(i in 1:4){print(x[i])}
for (i in seq_along(x)){print(x[i])}
for (letra in x){print(letra)}
for (i in 1:4){print(x[i])}

m <- matrix(1:6,2,3)
for (i in 1:2) for(j in 1:3){print(m[i,j])
}#cuando sabes el numero de filas y columnas

for (i in seq_len(nrow(m)) ) for(j in seq_len(ncol(m))){print(m[i,j])
}
#####################################################################
z <- 5
COSA <- vector("numeric")
while (z >= 3 && z <= 10){print(z)
  COSA <- c(COSA,z)
  moneda <- rbinom(1,1,0.5)
    if(moneda == 1){#caminata aleatoria
    z <- z+.5
  } else {
    z <- z-.5
  }
}
plot(COSA, type = "l") #hace un gráfico

################################################################################
x0 <- 1
tol <- 1e -8
repeat { 
  x1 <- calculoestimado (x0)
  if (abs(x1-x0) < tol){
    break
  } else{
    x0 <- x1
  }
}

#creacion de funciones
suma2 <- function(x,y){
  x + y
}

mayor10 <- function(x){
  x[x > 10]
}

mayorque <- function(x,n){
    x[x > n]
}

promedioCol <-  function(x, quitar.NA = TRUE){
      nc <- ncol(x)
      medias <- vector("numeric",nc)
      for (i in 1:nc) {
        medias[i] <- mean(x[, i],na.rm = quitar.NA )
      }
      medias
}

#mean saca PROMEDIO
#na.rm quita los valores

#evaluacion presoza

f <- function(a,b){
 a^2
}

f <- function(a,b){
  print(a)
  print(b)
}

myplot <- function(x,y,type= "l", ...){
  plot(x,y,type = type , ...)
}

#paste suma dos vectores cualquier duda usa ?

#puede ser util complete.cases()


