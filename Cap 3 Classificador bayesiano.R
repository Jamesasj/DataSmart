#install.packages("tidytext")
#install.packages("dplyr")
#install.packages("tidyr")
#install.packages("tm")

library(tidyr)
library(dplyr)
library(tidytext)
library(tm)

setwd("/home/james/Documents/data smart")
criar_dicionario <- function(dataset){
  dataset.df <- data_frame(documento = 1:length(dataset$Tweet), texto = dataset$Tweet)
  dataset.tokens <- dataset.df %>% unnest_tokens(palavra, texto)
  dataset.dic <- dataset.df %>% count(documento, palavra, sort = TRUE)
  dataset.dic$probabilidade <- dados.dic.mandril$n/sum(dados.dic.mandril$n)
  return(dataset.dic)
}

dados.mandril <- read.csv('cap3_relacionados.csv', header = TRUE, sep = ";" )
dados.nao_mandril  <-  read.csv('cap3_nao_relacionados.csv', header = TRUE, sep = ";" )
dados.teste <- read.csv('Cap3_teste.csv', header = TRUE, sep = ";" )

dados.mandril$Tweet  <- as.character(dados.mandril$Tweet)
dados.nao_mandril$Tweet <- as.character(dados.nao_mandril$Tweet)
dados.teste$Tweet <- as.character(dados.teste$Tweet)

dados.df.mandril <- data_frame(documento = 1:150, texto = dados.mandril$Tweet)
dados.df.nao_mandril <- data_frame(documento = 1:150, texto = dados.nao_mandril$Tweet)
dados.df.teste <- data_frame(documento = 1:20, texto = dados.teste$Tweet, classificacao = dados.teste$Class)

dados.tokens.mandril <- dados.df.mandril %>% unnest_tokens(palavra, texto)
dados.tokens.nao_mandril <- dados.df.nao_mandril %>% unnest_tokens(palavra, texto)

dados.dic.mandril <- dados.tokens.mandril %>% count(documento, palavra, sort = TRUE)
dados.dic.nao_mandril <-dados.tokens.nao_mandril %>% count(palavra, sort = TRUE)

dados.dic.mandril$n_mais_um <- dados.dic.mandril$n+1
total <- sum(dados.dic.mandril$n_mais_um)
dados.dic.mandril$probabilidade <- dados.dic.mandril$n_mais_um/total 

dados.dic.nao_mandril$n_mais_um <- dados.dic.nao_mandril$n+1
total <- sum(dados.dic.nao_mandril$n_mais_um)
dados.dic.nao_mandril$probabilidade <- dados.dic.nao_mandril$n_mais_um/total 


