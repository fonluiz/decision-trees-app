library(glmnet)

treino <- read_csv("data/original/train.csv")
teste <- read_csv("data/original/test.csv")

fitControl <- trainControl(method = "cv",
                           number = 5,
                           search = "random")

model.gml = train(win_depth ~.,
                  data=treino,
                  method="multinom",
                  family="binomial",
                  trControl = fitControl,
                  preProcess = c('scale', 'center', "nzv"))


fitControl2 <- trainControl(method = "cv",
                           number = 10,
                           search = "random")

model.gml2 = train(win_depth ~.,
                  data=treino,
                  method="multinom",
                  family="binomial",
                  trControl = fitControl2,
                  preProcess = c('scale', 'center', "nzv"))

summary(model.gml)
summary(model.gml2)

plot(model.gml2)
plot(model.gml2, xvar = "lambda", label = T)
plot(model.gml2, sub = T)

predicao <- predict(model.gml2, teste)
predicao2 <- predict(model.gml2, teste)

saveRDS(model.gml, "logistic-regression/logistic-regression.rds")
saveRDS(model.gml2, "logistic-regression/logistic-regression2.rds")



model.lasso = glmnet(x = model.matrix( ~ . -win_depth, treino),
                     y = treino$win_depth,
                     alpha = 1,
                     family = 'multinomial')

model.ridge = glmnet(x = model.matrix( ~ . -win_depth, treino),
                     y = treino$win_depth,
                     alpha = 0,
                     family = 'multinomial')

saveRDS(model.lasso, "logistic-regression/logistic-regression-lasso.rds")
saveRDS(model.ridge, "logistic-regression/logistic-regression-ridge.rds")

plot(model.lasso, xvar = "lambda", label = T)
plot(model.lasso, sub = T)
coef(model.lasso)

plot(model.ridge, xvar = "lambda", label = T)
plot(model.ridge, sub = T)
coef(model.ridge)



cv.lasso = cv.glmnet(x = model.matrix( ~ . -win_depth, treino),
                     y = treino$win_depth,
                     alpha = 1,
                     family = 'multinomial')

cv.ridge = cv.glmnet(x = model.matrix( ~ . -win_depth, treino),
                     y = treino$win_depth,
                     alpha = 0,
                     family = 'multinomial')

saveRDS(cv.lasso, "logistic-regression/logistic-regression-lasso-cv.rds")
saveRDS(cv.ridge, "logistic-regression/logistic-regression-ridge-cv.rds")

plot(cv.lasso)
plot(cv.ridge, sub = T)