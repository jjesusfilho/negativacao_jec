library(dados)
library(tidyverse)
library(writexl)
library(readxl)

View(voos)

voos <- voos

voos <- voos[1:100,]

## formato serializado
saveRDS(voos, "data/voos.rds" )

voos <- readRDS("data/voos.rds")


## csv 
### Pelo R base
write.csv(voos, "data/voos.csv")
write.table(voos, "data/voos.csv", sep = ";")

## Tidyverse (readr)
write_csv2(voos,"data/voos.csv")

write_delim(voos,"data/voos.csv",, delim = ";")

write_delim(voos,"data/voos.txt", delim = "\t")

write_xlsx(voos,"data/voos.xlsx")

v <- read_excel("data/voos.xlsx")


dados_iris <- dados_iris

save.image("data/base.RData")

load("data/base.RData")

## Pipe

1:10 %>% 
  sum() %>% 
  sqrt()

1:10 |> 
  sum() |> 
  sqrt()

"segunda parte" |> 
   paste("primeira parte",... = _)


## pacote tibble

glimpse(voos)

voos <- rownames_to_column(voos, "id")


voos <- add_column(voos, uf = "SC", .before = 2)

## Dplyr


# funções básicas: select, relocate, rename, filter, count, mutate, summarize, arrange, group_by


## Select

s1 <- voos |> 
      select(ano, mes, dia)

s2 <- voos |> 
    select(1,5,6)

s3 <- voos |> 
     select(1:10)

s4 <- voos |> 
     select(-horario_saida)


s5 <- voos |> 
     select(contains("horario"))

voos <- voos |> 
    rownames_to_column("id")

s6 <- voos |> 
     select(id, ends_with("hora"))

s7 <- voos |> 
    select(starts_with("atraso"))

s8 <- voos |> 
     select(year = ano, month = mes, day = dia)


## Relocate

voos <- voos |> 
    relocate(horario_saida, .before = 1)

voos <- voos |> 
     relocate(year, .after = month)

### Rename

voos <- voos |> 
      rename(year = ano, month = mes, day = dia)

### Filter

jfk <- voos |> 
      filter(origem == "JFK")

unique(voos$origem)

jl <- voos |> 
      filter(origem == "JFK" | origem == "LGA")

aero <- c("JFK","LGA")

jl <- voos |> 
  filter(origem  %in% aero)


horario <- voos |> 
      filter(horario_chegada < 900)

horario <- voos |> 
    filter(horario_chegada <= 800)

ho <- voos |> 
  filter(horario_chegada <= 800 & origem == "JFK")

### Count

voos |> 
   count(origem)

voos |> 
   count(origem, destino)


voos |> 
  count(origem, sort = TRUE)


od <- voos |> 
   count(origem, destino, sort = TRUE)


od <- voos |> 
     count(origem, destino, sort = TRUE, name = "frequencia")

### Mutate

voos <-  voos |> 
     mutate(year = as.character(year))

voos <- voos |> 
     mutate(month = month*2)

voos <- voos |> 
      mutate(od = paste(origem, destino, sep = "-"))

voos <- voos |> 
     mutate(od = NULL)

voos <- voos |> 
  mutate(od = paste(origem, destino, sep = "-"), .after = destino)

voos <- voos |> 
      mutate(tempo_medio = NULL)

voos <- voos |> 
    group_by(origem) |> 
    mutate(tempo_medio  = mean(tempo_voo,na.rm = TRUE),
           .after = tempo_voo)

voos <- ungroup(voos)

voos <- voos |> 
  group_by(origem) |> 
  mutate(tempo_medio  = mean(tempo_voo,na.rm = TRUE),
         .after = tempo_voo)


## summarize

sumario <- voos |> 
        drop_na() |> 
        group_by(origem) |> 
        summarize(minimo = min(tempo_voo),
                  max = max(tempo_voo),
                  media = mean(tempo_voo),
                  desvio_padrao = sd(tempo_voo),
                  mediana = median(tempo_voo))

sumario <- voos |> 
  ungroup() |> 
  drop_na() |> 
  group_by(origem, destino) |> 
  summarize(quantidade = n(),
            minimo = min(tempo_voo),
            max = max(tempo_voo),
            media = mean(tempo_voo),
            desvio_padrao = sd(tempo_voo),
            mediana = median(tempo_voo))

## Arrange

sumario <- sumario |> 
        arrange(quantidade)

sumario <- sumario |> 
       arrange(desc(quantidade))

## aparte


colunas <- c("year","day")


selecao <- select(voos, "year", "day")





