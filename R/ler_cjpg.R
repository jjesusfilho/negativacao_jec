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

amostra <- cjpg |> 
      sample_n(1000)

valor <- str_extract_all(amostra$julgado, "R\\$\\s?\\d\\S+")


valor <- amostra$julgado |> 
      str_extract_all("R\\$\\s?\\d\\S+") |> 
         map_dbl(~{
           .x |> 
        str_extract(".+?(?=\\D?$)") |> 
             stringr::str_remove_all("(\\.|\\p{L}|\\$|\\s)+") |> 
             stringr::str_replace(",", ".") |> 
             as.numeric()
          max(na.rm = TRUE) |> 
          unique()
         })

tjsp_obter_valor_max <- function(julgado){
  
  julgado |> 
  stringr::str_extract_all("R\\$[\\s.]?\\d\\S+") |> 
    purrr::map_dbl(~{
      .x |> 
        stringr::str_extract(".+?(?=\\D?$)") |> 
        stringr::str_remove_all("(\\.|\\p{L}|\\$|\\s)+") |> 
        stringr::str_replace(",", ".") |> 
        as.numeric() |> 
      max(na.rm = TRUE) |> 
        unique()
    })
}


amostra <- amostra |> 
        mutate(valor_maximo = tjsp_obter_valor_max(julgado))


idoso <- str_detect(amostra$julgado, "(idos[ao]|deficiente|pcd|vulner.vel|hipossuficiente)")


processos <- unique(cjpg$processo)
saveRDS(processos, "data/processos.rds")



## 

arquivos <- list.files("data/cjpg", full.names = TRUE, pattern = "cjpg")


cjpg <- map_dfr(arquivos, ~{
  
  readRDS(.x) |> 
    mutate(valor = tjsp_obter_valor_max(julgado))
  
})


lista <- cjpg |> 
       group_split(grupo)

walk2(lista,1:10, ~saveRDS(.x, paste0("data/cjpg/cjpg",.y,".rds")))




