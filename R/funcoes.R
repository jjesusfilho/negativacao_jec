Sys.time()

sqrt(25)

sqrt(x = 25)

sum(3, 4)

sample(x = 1:100, size = 5)

sample(size = 5, x = 1:100)

sample(1:100, 5)


somar <- function(x, y){
  
  x + y
  
}


somar(5,34)
somar(x = 34, y = 5)

exponenciar <- function(x,y){
  
  x^y
  
}

exponenciar(2,3)

exponenciar(y = 3, x = 2)

exponenciar(3,2)


## funções infix

3+4

`+`(2,4)

4*5

`*`(4,5)

5/4

dividir <- `/`


dividir(3,4)


## Pacotes

## Conjunto de funções que operam organicamente para objetos similares


## Funções vetorizadas vs funções agregadoras

a <- 1:10

sqrt(a) ## A vetorizada aplica-se sobre cada elemento

sum(a) ## A função agregadora aplica-se sobre todos os elementos

mean(a)

## Controle de fluxo

a <- 4

if (a==4){
  
  sqrt(a)
  
}


if (a < 6){
  
  a*2
  
} else {
  
  a/2
}

## Loop ou laço de repetição ou iteração

a <- 1:10


for (i in a){
  
  if (i>5){
    
  j <-  i/2 

  } else {
    
  j <-  i*2
    
  }
  print(j)
}

## While

i <- 0

while ( i < 6){
  
  print(i*3)
  
  i <- i+1
}



