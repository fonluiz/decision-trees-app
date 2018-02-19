library(glmnet)
library(tidyverse)
library(car)

# ..:: Exemplo de modelo para previsão de variável contínua ::..


dados_treino = read_csv("data/dados_treino.csv") %>% 
  mutate(eleito = (desc_sit_tot_turno != "NÃO ELEITO"), sexo = (sexo == "MASCULINO")) %>%
  select(quantidade_doacoes, total_receita, sexo, idade, eleito, qtde_votos, votos) %>%
  na.omit()
dados_teste = read_csv("data/dados_teste.csv") %>%
  mutate(eleito = (desc_sit_tot_turno != "NÃO ELEITO"), sexo = (sexo == "MASCULINO")) %>%
  select(quantidade_doacoes, total_receita, sexo, idade, eleito, qtde_votos, votos) %>%
  na.omit()

input <- dados_treino %>%
  select(-qtde_votos) %>% # dont include the variable we're predicting!
  as.matrix()

output <- dados_treino$qtde_votos

print("Mean of our predicted value:")
mean(output)

cv_fit <- cv.glmnet(input, output, family = "gaussian")
coef(cv_fit, s = "lambda.min")

# get a (non-sparse) matrix of the coefficents for the best model
coef_matrix <- coef(cv_fit, s = "lambda.min") %>% 
  as.matrix()

# get the variables with a coefficent that's not 0 
variables <- row.names(coef_matrix)[coef_matrix != 0] %>% # get variables w/ non-zero intercepts
  setdiff("(Intercept)") #remove the intercept (if it's included)

# this variable has just our selected features. 
# print the first few
head(variables)



# turn our list of formulas into a variable
variables_selected <- paste(variables, collapse="+")
formula <- paste("qtde_votos ~ ",variables_selected,sep = "") %>%
  as.formula()

# fit a glm model
model <- glm(formula, # formula
             data = dados_treino, # dataset
             family = ("gaussian")) # fit a poisson model


# output plots in a 2 x 2 grid 
par(mfrow = c(2,2)) 

# diagnostic plots
plot(model)

summary(model)

avPlots(model)