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

#############################################
#¿cómo r sabe qué valor asignar
lm #primera funcion
lm <- function(x){x*x} #renombramos la funcion 
lm
rm(lm)#remueve la funcion lm de ek gobla enviroment
lm #te dedvuelve la primera funcion que esta en otro lugar 
#usar la funcion search() ahi te muetra en donde se busaca la funcion en orden 
#ejemplo primero busca en :".GlobalEnv" luego "tools:rstudio"
#"package:stats,package:graphics" y así hasta encontrarlo
library(ggplot2)#cambia el orden en que se busca la variable ponendo en segundo lugar 
#ggplot2
#SCOPING RULES

hacer.potencia <-function(n){
  potencia <- function(x){
    x ^ n
  }
 potencia
}
cubica <- hacer.potencia(3)
cuadrada <- hacer.potencia(2)
#lo que hace es guardar las propiedades de una funcion a otra
#PRUEBALO luego de correrla curre cubica o cuadrada con algun valor 
#ejemplo
cubica(2)


#entorno de una funcion

ls(environment(cubica))
get("n",environment(cubica))

ls(environment(cuadrada))
get("n",environment(cuadrada))

y <- 10

f <- function(x){
  y<-2
  y^2+g(x)
  
}
g <- function(x){
  x*y
}

#correlo y fijate que la y <- 2 solo vale para la funcion en donde esta anidada.

#mostrar fecha
x <- as.Date("1970-01-01")
x
unclass(x)
unclass((as.Date("1970-01-02")))#muestra los dias que pasan desde las dfechas dadas

#######################3#LAPPLY#####################
#match.fun(x) busca una funcion de nombre x
#Ejemplo lapply, rnorm()crea numeros aleatorios
x <- list( a = 1:5 , b = rnorm(1000) )
lapply(x, mean)
#ejemplo 2
#cronrm(10,1)son 10 elementos  media 1 y variacion estandar 1 la predeterminada 
x <- list( a = 1:5 , b = rnorm(10) , c = rnorm(10,1) , d = rnorm(10,2) )
lapply(x, mean)
#ejemplo 3
#crea numeros aleatorios para el numero de x osea cuando x=1 crea
#un numero aleatorio x=2 dos numeros y as..
x  <- 1:4
lapply(x, runif)
#ejemplo 4, los varoles de max y min no los utilizará lapply sino
#runif, osea que podemos poner valores en la lista de lapply y si alguna funcion
#dentro de ella lo requiera la utiliza de otra manera no lo utiliza  
x  <- 1:4
lapply(x, runif, max = 15 , min = 5)

#########################SAPPLY #######################33
#hace algo similar que lapply solo que te simplifica el resultad,
#en lapply te mostraba una lista y en lapply un vector para x= al lo que se ocupa abjajo
#si los elementos de x son de diferente dimension entonces no te devuelve un vector
#sino una matriz
#ejemplo con x de igual dimencion, devuelve vector
x <- list( a = 1:5 , b = rnorm(10) , c = rnorm(10,1) , d = rnorm(10,2) )
sapply(x, mean)
#ejemplo con x diferentes dimenciones devuelve matriz
x  <- 1:4
sapply(x, runif, max = 15 , min = 5)

###########################APPLY############
#crea una matriz con numeros aleatorios, la dimnesion de la mtris es de 
#20 filas, 10 columnas
x <- matrix(rnorm(200), 20 , 10)
# el numero 2 dice que trabajara con columnas
apply(x, 2,mean)
# el numero 1 dice que trabajara con filas
apply(x,1,sum)

#rowsum(
#rowMeans()
#colSums()
#colMeans()
x <- matrix(rnorm(200), 20 ,10)
apply(x, 1,quantile, probs = c(0.25,0.75))
#quantile, para una coleccionde datos, ejemplo 1 al 100
#trabajamos con las probabilidades de 20% y 75% como esta arriba
#el .25 indica qu apartir de cual numero el 25% de los numeros son menores a el osea el 25
#y el .75 incica que apartir de que numero en x los el 75% de los numeros son 
#menores a el osea 75
a <- array(rnorm(2*2*10) , c(2,2,10))
apply(a, c(1,2),mean)
#lo mismo pero ya programado 
rowMeans(a,dims = 2)
################## mapply ###########################3
list(rep(1:4),rep(2:3),rep(3,2),rep(4,1)) 
mapply(rep,1:4,4:1)

##
noise <- function(n,mean,sd){
     rnorm(n,mean,sd)
}
noise(5,1,2)
mapply(noise,1:5,1:5, 2)

####### tapply#####
x <- c(rnorm(10),runif(10),rnorm(10,1))
f <- gl(3,10)
f
tapply(x, f, mean)#los mustra como vector
tapply(x, f, mean, simplify = F) #los deja como lista 
##################split"##################3

x <- c(rnorm(10), runif(10),rexp(10))
f <- gl(3,10)
f
split(x,f)
lapply(split(x,f),mean)

library(datasets)
head(airquality)

s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[,1:3]))
sapply(s, function(x)colMeans(x[,1:4],na.rm = T))

#otro ejemplo
x <- rnorm(10)
f1 <- gl(2,5)
f2 <- gl(5,2)
f1
f2
interaction(f1,f2)
x
str(split(x,list(f1,f2)))
#####################################################################
imprimemsj <- function(x){
     if (x>0) {
          print("x es mayor que 0")
          else
               print("x es manor que0")
               invisible(x)   
}}

imprimemsj <- function(x){

          if (is.na(x)) {
          print("x es un valor faltante")
          
          else{
          
          print("x es mayor que 0")
          }
          else 
               {print("x es manor que0")
               invisible(x) 
               
          }
               
            
      
          }}

traceback()#imprime la ultima funcion ejecutada, con sus errores, te sirve para
#saber en quemomento de la funcion falló
debug()#parecido al F8 de excel, hace la evaluacion paso a paso de una funcion
#avanzas la funcion escribiendo n en la consola
options(error =recover)
?Error
read.csv("perritosgay")

install.packages("swirl")
installed.packages("swir")
library("swirl")
swirl()
#When you are at the R prompt (>):
 #    | -- Typing skip() allows you to skip the current question.
#| -- Typing play() lets you experiment with R on your own; swirl will ignore what you
#| do...
#| -- UNTIL you type nxt() which will regain swirl's attention.
#| -- Typing bye() causes swirl to exit. Your progress will be saved.
#| -- Typing main() returns you to swirl's main menu.
#| -- Typing info() displays these options again.

#main(1)

#tarea hacer hasta la parte 6 de swird ss+ marca de agua con tu usuario de github
################################################################
x <- rnorm(100)
str(x)
summary(x)

m <- matrix(rnorm(100),10,10)
str(m)
s <- split(airquality,airquality$Month)


x <- rnorm(10)
y <- rnorm(10, 50,5)
summary(x)
summary(y)

set.seed(1)#establece una semilla de la cual podemos partir 
rnorm(5)
set.seed(2)
rnorm(5)
set.seed(1)#fijate que te dan los mismos valors de la primera semilla
rnorm(5)
normal1 <- rnorm(10000)
normal2 <- rnorm(10000,10,5)
hist(normal1)
summary(normal1)
hist(normal2)
summary(normal2)
rpois(10,1)
poisson1 <- rpois(10000,1)
poisson2 <- rpois(10000,10)
hist(poisson1)
hist(poisson2)
ppois(2,2)
ppois(4,2)
ppois(6,2)

for (i in 0:11) {
     print(dpois(i,2))
     
}

hist(runif(10000,10,20))

set.seed(20)
x <- rnorm(100,0,1)
e <- rnorm(100,0,2)
y <- 0.5 +2*x+e
plot(x,y)

z <- 0.5 + 2*x
plot(x,z)
plot(z,y)
################################################################################
set.seed(10)
x <- rbinom(100,1,0.5)
e <- rnorm(100,0,2)
y <- 0.5 + 2*x + e
summary(y)
plot(x,y, main = "Modelo Lineal",col="dark red")

set.seed(1)
x <- rnorm(100)
log.mu<- 0.5 +0.3*x
y <- rpois(100,exp(log.mu))
summary(y)
plot(x,y, main = "Modelo Poisson",col= "forest green")
###############################################################3
#profiling
hilert <- function(n){
     i <- 1:n
     1/outer(i-1,i,"+")
     
}
x<-hilert(1000)
system.time(svd(x))

























