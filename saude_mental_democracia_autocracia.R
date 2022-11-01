
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
library(ggthemes)

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

sm <- read.csv("share-with-mental-and-substance-disorders.csv")
view(sm)
names(sm)

# Manipular dados --------------------------------------------------------------------------------------------------------------------------

sm <- sm %>%
  select(-Code) %>%
  rename(por_saude_ment = Prevalence...Mental.disorders...Sex..Both...Age..Age.standardized..Percent.) %>%
  view()

sm1 <- sm %>%
  filter(Entity %in% c("United States", "Japan", "Germany",
                       "China", "Cuba", "North Korea")) %>%
  group_by(Entity) %>%
  summarise(media = mean(por_saude_ment),
            n = n(), sd = sd(por_saude_ment),
            se = sd/sqrt(n)) %>%
  view()

sm2 <- sm %>%
  filter(Entity %in% c("United States", "Japan", "Germany",
                       "China", "Cuba", "North Korea")) %>%
  view()

sm3 <- sm %>%
  filter(Entity %in% c("United States", "China", "Brazil")) %>%
  view()

# Gráficos ---------------------------------------------------------------------------------------------------------------------------------

c4a("safe", 6)

ggplot(sm1, aes(x = fct_reorder(Entity, media), y = media, fill = Entity)) +
  geom_col(width = 0.9) +
  geom_errorbar(aes(ymin = media - se, ymax = media + se),
                size = 0.8, width = 0.2) +
  scale_fill_manual(values = c("#88CCEE", "#CC6677", "#DDCC77",
                               "#117733", "#332288", "#AA4499")) +
  scale_y_continuous(expand = expansion(mult = c(0,0))) +
  scale_x_discrete(labels = c("Japão", "Coréia do Norte", "China",
                              "Alemanha", "Cuba", "Estados Unidos")) +
  labs(x = "Países", y = "Porcentagem média da população 
       com transtornos mentais") +
  theme_ipsum(axis_title_size = 16,
              axis_text_size = 14) +
  theme(legend.position = "none",
        axis.text = element_text(color = "black"))

ggplot(sm2, aes(x = Year, y = por_saude_ment, 
                group = Entity, color = Entity)) +
  geom_point(shape = 15, size = 2.5) +
  geom_line(size = 1.2) +
  scale_color_manual(values = c("#88CCEE", "#CC6677", "#DDCC77",
                               "#117733", "#332288", "#AA4499"),
                     labels = c("China", "Cuba", "Alemanha",
                              "Japão", "Coréia do Norte", "Estados Unidos")) +
  labs(x = "Tempo (anos)", y = "Porcentagem média da população 
       com transtornos mentais", color = "Países") +
  theme_ipsum(axis_title_size = 16,
              axis_text_size = 14) +
  theme(axis.text = element_text(color = "black"))

ggplot(sm3, aes(x = Year, y = por_saude_ment, 
                  group = Entity, col = Entity)) +
  geom_line(size = 2) +
  scale_color_manual(values = c('#1B9E77', '#999999','#E69F00'),
                     labels = c("Brasil", "China", "Estados Unidos")) +
  labs(x = "Tempo (anos)", y = "Transtornos mentais (%)", 
       color = "Países") +
  theme_light() +
  theme(axis.title = element_text(size = 18),
        axis.text = element_text(color = "black", size = 15),
        legend.text = element_text(size = 12))
