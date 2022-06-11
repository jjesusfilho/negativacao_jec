library(tjsp)
library(tidyverse)
cjpg <- tjsp_ler_cjpg(diretorio = "data-raw/cjpg")

saveRDS(cjpg, "data/cjpg.rds")
save(cjpg, file = "data/cjpg.rda")

cjpg1 <- cjpg[1:6000,]
saveRDS(cjpg1, "data/cjpg1.rds")

lista <- cjpg |> 
       mutate(grupo = ntile(n=10)) |> 
       group_split(grupo)

nomes <- paste0("data/cjpg", 1:10,".rds")

walk2(lista,nomes,  ~{
  
 saveRDS(.x, .y)
  
})

arquivos <- list.files("data", full.names = T)


cjpg <- map_dfr(arquivos, ~readRDS(.x))


