contador <- 0
arriba <- 0
abajo <-0
while (contador <= 99) {contador <- contador +1 
z <- 5
while (z >= 3 && z <= 10){
  moneda <- rbinom(1,1,0.5)
  if(moneda == 1){
    z <- z + 1
  } else {
    z <- z - 1
  }
}
if (z < 3) { abajo <- abajo +1
}else
  arriba <- arriba +1
}
print(arriba)
print(abajo)













