---
title: "lab 3 warm up"
output: 
  html_document: 
    keep_md: yes
date: "2023-01-17"
---



## plant height

```r
plant_height <-c(30.7,37.6,28.4,NA,33.2)
plant_height
```

```
## [1] 30.7 37.6 28.4   NA 33.2
```
## plant mass

```r
plant_mass <-c(4,5.2,3.7,NA,4.6)
plant_mass
```

```
## [1] 4.0 5.2 3.7  NA 4.6
```
##plpant labels

```r
samples <- c("Plant 1", "Plant 2", "Plant 3", "Plant 4", "Plant 5")
measures <- c("Height", "Mass")
```


## plant matrix combined data

plant_experiment <-c (plant_height, plant_mass) plant_experiment

```r
plant_experiment <-c(plant_height, plant_mass)
plant_experiment
```

```
##  [1] 30.7 37.6 28.4   NA 33.2  4.0  5.2  3.7   NA  4.6
```

## build data matrix 

```r
plant_experiment_matrix <-matrix (plant_experiment, nrow =5, byrow =F)
plant_experiment_matrix
```

```
##      [,1] [,2]
## [1,] 30.7  4.0
## [2,] 37.6  5.2
## [3,] 28.4  3.7
## [4,]   NA   NA
## [5,] 33.2  4.6
```


## labels for height and mass

```r
colnames(plant_experiment_matrix) <-measures
rownames(plant_experiment_matrix) <- samples

plant_experiment_matrix
```

```
##         Height Mass
## Plant 1   30.7  4.0
## Plant 2   37.6  5.2
## Plant 3   28.4  3.7
## Plant 4     NA   NA
## Plant 5   33.2  4.6
```
## calculate column means


```r
plant_means <-colMeans(plant_experiment_matrix, na.rm=T)
plant_means
```

```
## Height   Mass 
## 32.475  4.375
```

## removal NA or data missing from the data set with the na.rm = T

## adding the new column to the matrix

```r
plant_experiment_matrix_final <- rbind(plant_experiment_matrix, plant_means)
plant_experiment_matrix_final
```

```
##             Height  Mass
## Plant 1     30.700 4.000
## Plant 2     37.600 5.200
## Plant 3     28.400 3.700
## Plant 4         NA    NA
## Plant 5     33.200 4.600
## plant_means 32.475 4.375
```
## printing final matrix

```r
plant_experiment_matrix_final
```

```
##             Height  Mass
## Plant 1     30.700 4.000
## Plant 2     37.600 5.200
## Plant 3     28.400 3.700
## Plant 4         NA    NA
## Plant 5     33.200 4.600
## plant_means 32.475 4.375
```




