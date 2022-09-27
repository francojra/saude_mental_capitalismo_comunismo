
# Saúde Mental  ----------------------------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data 26/09/22 ----------------------------------------------------------------------------------------------------------------------------
# Referência: https://ourworldindata.org/mental-health -------------------------------------------------------------------------------------

# Sobre os dados ---------------------------------------------------------------------------------------------------------------------------

### Nesta entrada apresentamos as últimas estimativas da prevalência de 
### doenças mentais e da carga das doenças associadas. A maioria das estimativas
### apresentadas foram produzidas por: Institute for Health Metrics and Evaluation
### e relatados pelo porta bandeira Global Burden of Disease study deles.

### Em 2017, esse estudo estimou que 792 milhões de pessoas vivem com desordem
### na saúde mental. Isso é quase mais que uma pessoa a cada dez no mundo
### (cerca de 10.7%).

### As perturbações mentais são complexas e podem ser tomadas de diversas formas.
### As fontes adjacentes aos dados apresentados aplicam definições específicas,
### tipicamente de acordo com o WHO’s International Classification of Diseases .
### Essa abrangente definição incorpora diversas formas, incluindo depressão,
### ansiedade, bipolaridade, desordens alimentares e esquizofrenia.

# Carregar pacotes -------------------------------------------------------------------------------------------------------------------------

library(tidyverse)
library(cols4all)
library(hrbrthemes)

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

sm <- read.csv("share-with-mental-and-substance-disorders.csv")
view(sm)
names(sm)
