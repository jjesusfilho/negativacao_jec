## Caracteres

nome <- "José"

typeof(nome)
class(nome)

nomes <- c("Antonio","Bernardo","Hugo","Marcos","Maria","Uriel","Victor","Ariel")

typeof(nomes)
class(nomes)

is.character(nomes)

is.numeric(nomes)

n <- "3"

is.numeric(n)
is.character(n)


## Inteiros

numero <- 3L

typeof(numero)

class(numero)

is.integer(numero)

is.numeric(numero)


## Double

n <- 3.4

is.integer(n)

is.numeric(n)

is.double(n)

n <- 3

is.integer(n)

is.double(n)

n <- 3.5L

is.integer(n)


## Lógicos binários

TRUE, FALSE ### por trás não são nada mais do que um inteiro

masculino <- c(TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE)

typeof(masculino)
class(masculino)

as.integer(masculino)

is.numeric(masculino)


## Lógica terciária


masculino <- c(TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, NA)



## objeto inexistente

NULL


## Data

hoje <- "21/05/2022"

hoje <- "2022-05-21" ## padrão ISO 8601

is.character(hoje)

hoje <- as.Date(hoje)

typeof(hoje)
class(hoje)

as.numeric(hoje)

ontem <- "2022-05-20"
amanha <- "2022-05-22"

ontem <- as.Date(ontem)
amanha <- as.Date(amanha)

as.numeric(ontem)
as.numeric(amanha)

hoje - ontem


origem <- "1970-01-01"

origem <- as.Date(origem)

as.numeric(origem)

anterior <- "1969-12-20"

anterior <- as.Date(anterior)

as.numeric(anterior)


hoje - anterior


## Fator dado categórico

primeiro_nome <- c("Maria","Patrícia","João", "João", "Maria", "José")

primeiro_nome <- as.factor(primeiro_nome)

typeof(primeiro_nome)

class(primeiro_nome)

as.integer(primeiro_nome)

n <- c(297, 23, 619, 803, 4, 23)

n <- as.factor(n)

as.integer(n)

as.numeric(as.character(n))

## Vetor

#### Vetor numérico

n <- c(297, 23, 619, 803, 4, 23)

#### Vetor de caracteres

primeiro_nome <- c("Maria","Patrícia","João", "João", "Maria", "José")

n <- 1:10

## Matrizes

n <- 1:15

m <- matrix(n, ncol = 3)
m

matrix(primeiro_nome, ncol = 2)


## Data.frames 

df <- data.frame(nome = primeiro_nome,
                 idade = c(23,67,89, 45,62, 42))



nome <- df$nome

idade <- df$idade

nome <- df[[1]]

idade <- df[[2]]

df[3,2]

df[2]

df[[2]]

df[2,]

## listas

lista <- list(dataframe = df, matriz = m, assuntos = assunto, primeiro_nome = primeiro_nome)


p1 <- lista[[1]]

p2 <- lista[[2]]


p3 <- lista[["assuntos"]]

p_1 <- lista[-1]


