# Este arquivo é para executar a crossvalidação em busca de hiperparâmetros para a árvore de decisão
library(readr)
library(caret)

treino <- read_csv("data/original/train.csv")
teste <- read_csv("data/original/test.csv")

fitControl <- trainControl(method = "cv",
                           number = 5,
                        #   repeats = 5,
                           search = "random")

arvore <- train(win_depth ~ .,
                data = treino,
                methods = "rpart",
                trControl = fitControl,
                preProcess = c('scale', 'center', "nzv")
                )

summary(arvore)

predicao <- predict(arvore, teste)

saveRDS(arvore, "decision-tree.rds")

confusionMatrix(predicao, teste$win_depth)

