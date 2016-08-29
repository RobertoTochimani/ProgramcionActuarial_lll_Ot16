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

y <-(TRUE,2)     #numerico
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




