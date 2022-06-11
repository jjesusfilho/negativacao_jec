library(tidyverse)
library(quanteda)
cjpg <- readRDS("data/cjpg.rds")


endereco <- c("Avenida Paulista, 458, apto 1070, cep 01500-000, município de São Paulo, estado de são Paulo",
              "rua Padrão, 658, cep 01200-017, Sao Paulo, estado de Sao paulo")



str_extract(endereco, "\\d{5}-\\d{3}")


str_extract(endereco, "Paulo")

str_extract_all(endereco,"Paulo")

str_extract_all(endereco,"(?i)paulo")

str_extract_all(endereco,"(?i)s[ãa]o paulo")

str_extract(tipo_parte, "(apdo|apda|apelad[oa])")

df <- tibble(endereco = endereco)

df <- df |> 
     mutate(cep = str_extract(endereco, "\\d{5}-\\d{3}"))

df <- df |> 
    mutate(uf = str_extract(endereco, "(?<=estado de ).+"))

df <- df |> 
     mutate(endereco = str_replace_all(endereco, ",",";"))

df <- df |> 
     mutate(endereco2  = str_remove_all(endereco, ";"))

### str_detect

str_detect(endereco, "(?i)paulo")



cjpg <- cjpg |> 
        mutate(foro = str_remove(foro,"Foro (de )?"))


cjpg <- cjpg |> 
     mutate(ferias = str_detect(julgado, "(?i)férias"))

count(cjpg, ferias)

cjpg <- cjpg |> 
    mutate(decimo_terceiro = str_detect())


corpo <- corpus(cjpg, docid= "cd_doc", text_field = "julgado")

ferias <- kwic(corpo, "férias", window  = 20)

decimo_terceiro <- kwic(corpo, "(13º|d.cimo)", window = 10, valuetype = "regex" )

repercussao <- kwic(corpo, "repercu*", window  = 10)

cjpg <- cjpg |> 
     mutate(decimo_terceiro = str_detect(julgado,"(?i)(13º|d[ée]cimo(?!s))")) ## Negative lookahead

count(cjpg, decimo_terceiro)


cjpg <- cjpg |> 
