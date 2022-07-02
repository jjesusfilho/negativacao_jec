arquivos <- list.files("data-raw/cpopg", full.names = TRUE)


grupos <- JurisMiner::dividir_sequencia(arquivos, 50)

library(future.callr)


plan(callr, workers = 6)

df <- furrr:::future_map_dfr(grupos, ~{
  
  tjsp::tjsp_ler_dados_cpopg(.x, wide = TRUE)
  
})

library(tidyverse)
dt <- tibble(arquivos)

dt <- dt |> 
     mutate(processo = str_extract(arquivos, "\\d{20}"))

dt <- dt |> 
    anti_join(df)

amostra <- sample(dt$arquivos,1)

rstudioapi::viewer(amostra)

tjsp::tjsp_autenticar()

tjsp::tjsp_baixar_cpopg(dt$processo, "data-raw/cpopg_faltantes")

partes <- furrr::future_map_dfr(grupos, ~{
  
  tjsp::tjsp_ler_partes(.x)

})

saveRDS(partes, "data/cpopg/partes.rds")

count(partes, tipo_parte, sort = TRUE) |> View()

partes <- partes |> 
         filter(str_detect(tipo_parte, "(?i)(req|ré|autor)"))

partes <- partes |> 
          mutate(tipo_parte = case_when(
            str_detect(tipo_parte, "(?i)reqd[oa]") ~ "requerido",
            str_detect(tipo_parte, "(?i)autor") ~ "requerente",
            str_detect(tipo_parte, "(?i)reqte") ~ "requerente",
            str_detect(tipo_parte,"(?i)ré") ~  "requerido"
          ))


unique(partes$tipo_parte)

partes$representante <- NULL



partes <- partes |>
  dplyr::mutate(pessoa = dplyr::case_when(
    stringr::str_detect(parte, "(?i)(banco|finac|cr.edito)") ~ "banco",
    stringr::str_detect(parte, "(?i)(segur)") ~ "seguradora",
    stringr::str_detect(parte,"(?i)(\\bs[./]?a\\.?$|\\bs\\.\\a\\.|\\bs/a.?\\b|s\\sa$|ltda\\.?|\\b[aá]gua\\b|usina|empreend|com[ée]rci|representa|\\bME\\.?\\b|\\bMEI\\.?\\b|\\bEPP\\.?\\b|eirel[ei]|\\bs/?c\\b|companhia|\\bcia\\b)") ~ "PJ",
    TRUE ~ "PF"
  ))





