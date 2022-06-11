library(tjsp)
library(tidyverse)

### Códigos correspondentes a processo de conhecimento

classe <- "5804,8714,8501,5751,5752,5753,5741,5801,5728,5729,8507,8508,8509,8510,8512,8513,8514,8515,8518,8519,8520,8521,8791,8792,4060,2061,5754,5721,5722,5724,5708,5709,5710,5711,5712,5713,8523,8524,8525,8526,8527,8529,8530,8531,8532,8738,5802,5803,5733,5725,5726,5727,8535,8536,8537,8538,8539,8541,8546,8548,8549,8550,8551,8552,8553,8554,8555,8556,8557,8561,8562,8563,8564,8566,8567,8568,8569,8570,8571,8572,8573,8575,8576,8577,8578,8579,8580,8581,8582,8584,8585,8780,8781,8822,8819,4294,4295,2019,2070,2071,2072,2075,2079,2080,2081"

### Códigos correspondentes ao assunto licença prêmio, inclusive assuntos antigos do saj.

assunto <- "10261,6914,10357,800599,801377,801434,801442,802068,802160,802278,802326,802343,802660,802692,802956,803016,803056,267,446"

### Baixar julgados correspondentes aos anos 2019 a 2021
tjsp_baixar_cjpg(
  livre = "",
  aspas = FALSE,
  processo = "",
  foro = "",
  vara = "",
  classe = classe,
  assunto = assunto,
  magistrado = "",
  inicio = "01/01/2019",
  fim = "31/12/2019",
  diretorio = here::here("data-raw/cjpg"),
  paginas = NULL
)

arquivos <- list.files("data-raw/cjpg", full.names = TRUE)

cjpg <- tjsp_ler_cjpg(arquivos = arquivos, diretorio = ".")

saveRDS(cjpg,"data/cjpg.rds")

cjpg$decisao <- tjsp_classificar_sentenca(cjpg$julgado)




