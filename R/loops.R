a <- 1:10


for(i in 1:10){
  
print(i*3)
  
}


for(i in 1:10){
  
  if(i < 6) {
    
    print(i*3)
    
  } else {
    
    print(i+5)
    
  }
  
}

i <- 1

while(i < 6){
  
  print(i*3)
  
  i <- i+1
}

### Purrr

lista <- map(1:10, ~.x*3)


floats <- map_dbl(1:10, ~.x*3)


inteiros <- map_int(1:10, ~{
  
  (.x*3) |>  as.integer()
  
}
  
  )


a <- list.files("data", full.names = T)

df <- map_dfr(a, readRDS)





