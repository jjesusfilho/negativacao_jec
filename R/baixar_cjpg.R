classe <- "8714" ## Procedimento do Juizado Especial Cível

assunto <-  "6226" ## Inclusão Indevida em Cadastro de Inadimplentes


busca <- r'("dano moral" OU "danos morais")'

tjsp::tjsp_baixar_cjpg(
  livre = busca,
  classe = classe,
  assunto = assunto,
  diretorio  = "/Users/jjesusfilho/Documents/pacotes/projetos/negativacao_jec/data-raw/cjpg"
)

