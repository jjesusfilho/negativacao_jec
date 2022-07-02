#!/usr/bin/env Rscript


processos <- readRDS(here::here("data/processos.rds"))


processos <- JurisMiner::dividir_sequencia(processos, 50)

purrr::walk(processos, ~{
  
  tjsp::autenticar()
  
  tjsp::tjsp_baixar_cpopg(.x, diretorio = here::here("data-raw/cpopg"))
  
})

