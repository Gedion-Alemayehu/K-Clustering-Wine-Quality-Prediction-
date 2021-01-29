---
title: "R Notebook"
output: html_notebook
---


```{r}
size = read.table('size.csv', header=T, sep=',')
```


```{r}
summary(size)
```


```{r}
library(ggplot2)
ggplot(size, aes(x=Height, y=Weight)) + geom_point() + ylim(100,200)
```

```{r}
cor(size$Height,size$Weight)
```
```{r}
ggplot(size, aes(x=Height, y=Weight)) + geom_point() + stat_smooth(method="lm") + ylim(100,200)
```
```{r}
theModel <- lm(Weight~Height, size)
theModel
```
```{r}
summary(theModel)
```

```{r}
ggplot(size, aes(x=Height, y=Weight)) + geom_point() + stat_smooth() + ylim(100,200)
```
```{r}
library(class)
wine = read.table("wine.csv", header=T, sep=',')
X_wine <- wine[,c("density", "sulfates", "residual_sugar")]
y_wine <- wine[,c("high_quality")]
library(caret)
```
```{r}
set.seed(123)
inTrain <- createDataPartition(y=y_wine, p=0.7, list=FALSE)

# Extract the training and test sets:
X_train <- X_wine[inTrain,]
X_test <- X_wine[-inTrain,]
y_train <- y_wine[inTrain]
y_test <- y_wine[-inTrain]
head(X_train)
```

```{r}
head(X_test)
```
```{r}
head(y_train)
```
```{r}
head(y_test)
```
```{r}
wine_pred <- knn(train=X_train, test=X_test, cl=y_train, k=3)
```
```{r}
library(gmodels)
CrossTable(x=y_test, y=wine_pred, prop.chisq=FALSE)
```
```{r}
library(datasets)
head(iris)
```

```{r}
ggplot(iris, aes(Petal.Length, Petal.Width, color=Species)) + geom_point()
```
```{r}
set.seed(20)
irisCluster <- kmeans(iris[,3:4], 3, nstart=20)
irisCluster
```
```{r}
table(irisCluster$cluster, iris$Species)
```
```{r}
ggplot(iris, aes(Petal.Length, Petal.Width, color=irisCluster$cluster)) + geom_point()
```

