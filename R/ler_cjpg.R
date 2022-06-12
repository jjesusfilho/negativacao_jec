library(tjsp)
library(tidyverse)
cjpg <- tjsp_ler_cjpg(diretorio = "data-raw/cjpg")

saveRDS(cjpg, "data/cjpg.rds")
save(cjpg, file = "data/cjpg.rda")

saveRDS(cjpg1, "data/cjpg1.rds")

lista <- cjpg |> 
       #mutate(grupo = ntile(n=10)) |> 
       group_split(grupo)

nomes <- paste0("data/cjpg", 1:10,".rds")

walk2(lista,nomes,  ~{
  
 saveRDS(.x, .y)
  
})

arquivos <- list.files("data", full.names = T)


cjpg <- map_dfr(arquivos, ~readRDS(.x))

cjpg <- cjpg |> 
      mutate(decisao = tjsp_classificar_sentenca(julgado))


cjpg <- cjpg |> 
      filter(str_detect(decisao, "(parcial|procedente)"))


valor <- str_extract_all(cjpg$julgado[1:1000], "R\\$\\s?\\d\\S+")


cjpg$julgado[976]
