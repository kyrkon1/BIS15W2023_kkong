---
title: "Lab 3 Homework"
author: "Kyra Kong"
date: "2023-01-17"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---

## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the tidyverse

```r
library(tidyverse)
```

## Mammals Sleep
1. For this assignment, we are going to use built-in data on mammal sleep patterns. From which publication are these data taken from? Since the data are built-in you can use the help function in R.

```r
msleep
```

```
## # A tibble: 83 × 11
##    name         genus vore  order conse…¹ sleep…² sleep…³ sleep…⁴ awake  brainwt
##    <chr>        <chr> <chr> <chr> <chr>     <dbl>   <dbl>   <dbl> <dbl>    <dbl>
##  1 Cheetah      Acin… carni Carn… lc         12.1    NA    NA      11.9 NA      
##  2 Owl monkey   Aotus omni  Prim… <NA>       17       1.8  NA       7    0.0155 
##  3 Mountain be… Aplo… herbi Rode… nt         14.4     2.4  NA       9.6 NA      
##  4 Greater sho… Blar… omni  Sori… lc         14.9     2.3   0.133   9.1  0.00029
##  5 Cow          Bos   herbi Arti… domest…     4       0.7   0.667  20    0.423  
##  6 Three-toed … Brad… herbi Pilo… <NA>       14.4     2.2   0.767   9.6 NA      
##  7 Northern fu… Call… carni Carn… vu          8.7     1.4   0.383  15.3 NA      
##  8 Vesper mouse Calo… <NA>  Rode… <NA>        7      NA    NA      17   NA      
##  9 Dog          Canis carni Carn… domest…    10.1     2.9   0.333  13.9  0.07   
## 10 Roe deer     Capr… herbi Arti… lc          3      NA    NA      21    0.0982 
## # … with 73 more rows, 1 more variable: bodywt <dbl>, and abbreviated variable
## #   names ¹​conservation, ²​sleep_total, ³​sleep_rem, ⁴​sleep_cycle
```
The dataset for mammal sleep patterns is taken from V.M. Savage and G.B. West. This is from the National Academy of Sciences.


2. Store these data into a new data frame `sleep`.

```r
sleep <- data.frame(msleep)
```

3. What are the dimensions of this data frame (variables and observations)? How do you know? Please show the *code* that you used to determine this below.  

```r
dim(sleep)
```

```
## [1] 83 11
```
83 observations of 11 variables


4. Are there any NAs in the data? How did you determine this? Please show your code.  

```r
glimpse(sleep)
```

```
## Rows: 83
## Columns: 11
## $ name         <chr> "Cheetah", "Owl monkey", "Mountain beaver", "Greater shor…
## $ genus        <chr> "Acinonyx", "Aotus", "Aplodontia", "Blarina", "Bos", "Bra…
## $ vore         <chr> "carni", "omni", "herbi", "omni", "herbi", "herbi", "carn…
## $ order        <chr> "Carnivora", "Primates", "Rodentia", "Soricomorpha", "Art…
## $ conservation <chr> "lc", NA, "nt", "lc", "domesticated", NA, "vu", NA, "dome…
## $ sleep_total  <dbl> 12.1, 17.0, 14.4, 14.9, 4.0, 14.4, 8.7, 7.0, 10.1, 3.0, 5…
## $ sleep_rem    <dbl> NA, 1.8, 2.4, 2.3, 0.7, 2.2, 1.4, NA, 2.9, NA, 0.6, 0.8, …
## $ sleep_cycle  <dbl> NA, NA, NA, 0.1333333, 0.6666667, 0.7666667, 0.3833333, N…
## $ awake        <dbl> 11.9, 7.0, 9.6, 9.1, 20.0, 9.6, 15.3, 17.0, 13.9, 21.0, 1…
## $ brainwt      <dbl> NA, 0.01550, NA, 0.00029, 0.42300, NA, NA, NA, 0.07000, 0…
## $ bodywt       <dbl> 50.000, 0.480, 1.350, 0.019, 600.000, 3.850, 20.490, 0.04…
```

```r
summary(sleep)
```

```
##      name              genus               vore              order          
##  Length:83          Length:83          Length:83          Length:83         
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##  conservation        sleep_total      sleep_rem      sleep_cycle    
##  Length:83          Min.   : 1.90   Min.   :0.100   Min.   :0.1167  
##  Class :character   1st Qu.: 7.85   1st Qu.:0.900   1st Qu.:0.1833  
##  Mode  :character   Median :10.10   Median :1.500   Median :0.3333  
##                     Mean   :10.43   Mean   :1.875   Mean   :0.4396  
##                     3rd Qu.:13.75   3rd Qu.:2.400   3rd Qu.:0.5792  
##                     Max.   :19.90   Max.   :6.600   Max.   :1.5000  
##                                     NA's   :22      NA's   :51      
##      awake          brainwt            bodywt        
##  Min.   : 4.10   Min.   :0.00014   Min.   :   0.005  
##  1st Qu.:10.25   1st Qu.:0.00290   1st Qu.:   0.174  
##  Median :13.90   Median :0.01240   Median :   1.670  
##  Mean   :13.57   Mean   :0.28158   Mean   : 166.136  
##  3rd Qu.:16.15   3rd Qu.:0.12550   3rd Qu.:  41.750  
##  Max.   :22.10   Max.   :5.71200   Max.   :6654.000  
##                  NA's   :27
```
There are NAs in the data frame, just by looking at the glimpse, I can see the presence of NAs in the data sets. For the summary it gives the totals of NAs, for sleep_rem its 22, sleep_cycle 51, and brainwt: 27.


5. Show a list of the column names is this data frame.

```r
names(sleep)
```

```
##  [1] "name"         "genus"        "vore"         "order"        "conservation"
##  [6] "sleep_total"  "sleep_rem"    "sleep_cycle"  "awake"        "brainwt"     
## [11] "bodywt"
```
THe list of columns are name, genus, vore, order, conservation, sleep_total, sleep_rem, sleep_cycle, awake, brainwt, and bodywt.


6. How many herbivores are represented in the data?  

```r
table(sleep$vore)
```

```
## 
##   carni   herbi insecti    omni 
##      19      32       5      20
```
There are 32 herbivores represented in the data.


7. We are interested in two groups; small and large mammals. Let's define small as less than or equal to 1kg body weight and large as greater than or equal to 200kg body weight. Make two new dataframes (large and small) based on these parameters.

```r
small_bodywt <-filter(sleep,bodywt <= 1)
small_bodywt
```

```
##                              name        genus    vore           order
## 1                      Owl monkey        Aotus    omni        Primates
## 2      Greater short-tailed shrew      Blarina    omni    Soricomorpha
## 3                    Vesper mouse      Calomys    <NA>        Rodentia
## 4                      Guinea pig        Cavis   herbi        Rodentia
## 5                      Chinchilla   Chinchilla   herbi        Rodentia
## 6                 Star-nosed mole    Condylura    omni    Soricomorpha
## 7       African giant pouched rat   Cricetomys    omni        Rodentia
## 8       Lesser short-tailed shrew    Cryptotis    omni    Soricomorpha
## 9                   Big brown bat    Eptesicus insecti      Chiroptera
## 10              European hedgehog    Erinaceus    omni  Erinaceomorpha
## 11      Western american chipmunk     Eutamias   herbi        Rodentia
## 12                         Galago       Galago    omni        Primates
## 13           Thick-tailed opposum   Lutreolina   carni Didelphimorphia
## 14               Mongolian gerbil     Meriones   herbi        Rodentia
## 15                 Golden hamster Mesocricetus   herbi        Rodentia
## 16                          Vole      Microtus   herbi        Rodentia
## 17                    House mouse          Mus   herbi        Rodentia
## 18               Little brown bat       Myotis insecti      Chiroptera
## 19           Round-tailed muskrat     Neofiber   herbi        Rodentia
## 20                           Degu      Octodon   herbi        Rodentia
## 21     Northern grasshopper mouse    Onychomys   carni        Rodentia
## 22                Desert hedgehog  Paraechinus    <NA>  Erinaceomorpha
## 23                     Deer mouse   Peromyscus    <NA>        Rodentia
## 24                 Laboratory rat       Rattus   herbi        Rodentia
## 25          African striped mouse    Rhabdomys    omni        Rodentia
## 26                Squirrel monkey      Saimiri    omni        Primates
## 27          Eastern american mole     Scalopus insecti    Soricomorpha
## 28                     Cotton rat     Sigmodon   herbi        Rodentia
## 29                       Mole rat       Spalax    <NA>        Rodentia
## 30         Arctic ground squirrel Spermophilus   herbi        Rodentia
## 31 Thirteen-lined ground squirrel Spermophilus   herbi        Rodentia
## 32 Golden-mantled ground squirrel Spermophilus   herbi        Rodentia
## 33                     Musk shrew       Suncus    <NA>    Soricomorpha
## 34      Eastern american chipmunk       Tamias   herbi        Rodentia
## 35                         Tenrec       Tenrec    omni    Afrosoricida
## 36                     Tree shrew       Tupaia    omni      Scandentia
##    conservation sleep_total sleep_rem sleep_cycle awake brainwt bodywt
## 1          <NA>        17.0       1.8          NA   7.0 0.01550  0.480
## 2            lc        14.9       2.3   0.1333333   9.1 0.00029  0.019
## 3          <NA>         7.0        NA          NA  17.0      NA  0.045
## 4  domesticated         9.4       0.8   0.2166667  14.6 0.00550  0.728
## 5  domesticated        12.5       1.5   0.1166667  11.5 0.00640  0.420
## 6            lc        10.3       2.2          NA  13.7 0.00100  0.060
## 7          <NA>         8.3       2.0          NA  15.7 0.00660  1.000
## 8            lc         9.1       1.4   0.1500000  14.9 0.00014  0.005
## 9            lc        19.7       3.9   0.1166667   4.3 0.00030  0.023
## 10           lc        10.1       3.5   0.2833333  13.9 0.00350  0.770
## 11         <NA>        14.9        NA          NA   9.1      NA  0.071
## 12         <NA>         9.8       1.1   0.5500000  14.2 0.00500  0.200
## 13           lc        19.4       6.6          NA   4.6      NA  0.370
## 14           lc        14.2       1.9          NA   9.8      NA  0.053
## 15           en        14.3       3.1   0.2000000   9.7 0.00100  0.120
## 16         <NA>        12.8        NA          NA  11.2      NA  0.035
## 17           nt        12.5       1.4   0.1833333  11.5 0.00040  0.022
## 18         <NA>        19.9       2.0   0.2000000   4.1 0.00025  0.010
## 19           nt        14.6        NA          NA   9.4      NA  0.266
## 20           lc         7.7       0.9          NA  16.3      NA  0.210
## 21           lc        14.5        NA          NA   9.5      NA  0.028
## 22           lc        10.3       2.7          NA  13.7 0.00240  0.550
## 23         <NA>        11.5        NA          NA  12.5      NA  0.021
## 24           lc        13.0       2.4   0.1833333  11.0 0.00190  0.320
## 25         <NA>         8.7        NA          NA  15.3      NA  0.044
## 26         <NA>         9.6       1.4          NA  14.4 0.02000  0.743
## 27           lc         8.4       2.1   0.1666667  15.6 0.00120  0.075
## 28         <NA>        11.3       1.1   0.1500000  12.7 0.00118  0.148
## 29         <NA>        10.6       2.4          NA  13.4 0.00300  0.122
## 30           lc        16.6        NA          NA   7.4 0.00570  0.920
## 31           lc        13.8       3.4   0.2166667  10.2 0.00400  0.101
## 32           lc        15.9       3.0          NA   8.1      NA  0.205
## 33         <NA>        12.8       2.0   0.1833333  11.2 0.00033  0.048
## 34         <NA>        15.8        NA          NA   8.2      NA  0.112
## 35         <NA>        15.6       2.3          NA   8.4 0.00260  0.900
## 36         <NA>         8.9       2.6   0.2333333  15.1 0.00250  0.104
```

```r
large_bodywt <- filter(sleep,bodywt >=200)
large_bodywt
```

```
##               name         genus  vore          order conservation sleep_total
## 1              Cow           Bos herbi   Artiodactyla domesticated         4.0
## 2   Asian elephant       Elephas herbi    Proboscidea           en         3.9
## 3            Horse         Equus herbi Perissodactyla domesticated         2.9
## 4          Giraffe       Giraffa herbi   Artiodactyla           cd         1.9
## 5      Pilot whale Globicephalus carni        Cetacea           cd         2.7
## 6 African elephant     Loxodonta herbi    Proboscidea           vu         3.3
## 7  Brazilian tapir       Tapirus herbi Perissodactyla           vu         4.4
##   sleep_rem sleep_cycle awake brainwt   bodywt
## 1       0.7   0.6666667 20.00   0.423  600.000
## 2        NA          NA 20.10   4.603 2547.000
## 3       0.6   1.0000000 21.10   0.655  521.000
## 4       0.4          NA 22.10      NA  899.995
## 5       0.1          NA 21.35      NA  800.000
## 6        NA          NA 20.70   5.712 6654.000
## 7       1.0   0.9000000 19.60   0.169  207.501
```

8. What is the mean weight for both the small and large mammals?

```r
small_bodywtnumber <- c(small_bodywt$bodywt)
small_bodywtnumber
```

```
##  [1] 0.480 0.019 0.045 0.728 0.420 0.060 1.000 0.005 0.023 0.770 0.071 0.200
## [13] 0.370 0.053 0.120 0.035 0.022 0.010 0.266 0.210 0.028 0.550 0.021 0.320
## [25] 0.044 0.743 0.075 0.148 0.122 0.920 0.101 0.205 0.048 0.112 0.900 0.104
```

```r
mean(small_bodywtnumber)
```

```
## [1] 0.2596667
```
Mean weight for small animals: 0.2596667



```r
large_bodywtnumber <- c(large_bodywt$bodywt)
large_bodywtnumber
```

```
## [1]  600.000 2547.000  521.000  899.995  800.000 6654.000  207.501
```

```r
mean(large_bodywtnumber)
```

```
## [1] 1747.071
```
Mean weight for large body weight number is 1747.071


9. Using a similar approach as above, do large or small animals sleep longer on average?  

```r
large_sleeptime <-c(large_bodywt$sleep_total)
large_sleeptime
```

```
## [1] 4.0 3.9 2.9 1.9 2.7 3.3 4.4
```

```r
mean(large_sleeptime)
```

```
## [1] 3.3
```


```r
small_sleeptime <-c(small_bodywt$sleep_total)
small_sleeptime
```

```
##  [1] 17.0 14.9  7.0  9.4 12.5 10.3  8.3  9.1 19.7 10.1 14.9  9.8 19.4 14.2 14.3
## [16] 12.8 12.5 19.9 14.6  7.7 14.5 10.3 11.5 13.0  8.7  9.6  8.4 11.3 10.6 16.6
## [31] 13.8 15.9 12.8 15.8 15.6  8.9
```

```r
mean(small_sleeptime)
```

```
## [1] 12.65833
```

On average, smaller animals sleep longer.


10. Which animal is the sleepiest among the entire data frame?


```r
summary(sleep)
```

```
##      name              genus               vore              order          
##  Length:83          Length:83          Length:83          Length:83         
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##  conservation        sleep_total      sleep_rem      sleep_cycle    
##  Length:83          Min.   : 1.90   Min.   :0.100   Min.   :0.1167  
##  Class :character   1st Qu.: 7.85   1st Qu.:0.900   1st Qu.:0.1833  
##  Mode  :character   Median :10.10   Median :1.500   Median :0.3333  
##                     Mean   :10.43   Mean   :1.875   Mean   :0.4396  
##                     3rd Qu.:13.75   3rd Qu.:2.400   3rd Qu.:0.5792  
##                     Max.   :19.90   Max.   :6.600   Max.   :1.5000  
##                                     NA's   :22      NA's   :51      
##      awake          brainwt            bodywt        
##  Min.   : 4.10   Min.   :0.00014   Min.   :   0.005  
##  1st Qu.:10.25   1st Qu.:0.00290   1st Qu.:   0.174  
##  Median :13.90   Median :0.01240   Median :   1.670  
##  Mean   :13.57   Mean   :0.28158   Mean   : 166.136  
##  3rd Qu.:16.15   3rd Qu.:0.12550   3rd Qu.:  41.750  
##  Max.   :22.10   Max.   :5.71200   Max.   :6654.000  
##                  NA's   :27
```

## checking if less sleep cycle is equal to sleepiness?

```r
sleepcycle_dataframe <-filter(sleep, sleep_cycle <=0.12)
sleepcycle_dataframe
```

```
##            name      genus    vore      order conservation sleep_total
## 1    Chinchilla Chinchilla   herbi   Rodentia domesticated        12.5
## 2 Big brown bat  Eptesicus insecti Chiroptera           lc        19.7
##   sleep_rem sleep_cycle awake brainwt bodywt
## 1       1.5   0.1166667  11.5  0.0064  0.420
## 2       3.9   0.1166667   4.3  0.0003  0.023
```
The chinchilla and the big brown bat have the exact same hours for the length of their sleep cycle, but the big brown bat has more total hours of sleep.

##checking if less sleep time is equal to sleepiness

```r
sleeptime_dataframe <-filter(sleep,sleep_total <=5)
sleeptime_dataframe
```

```
##                name         genus  vore          order conservation sleep_total
## 1               Cow           Bos herbi   Artiodactyla domesticated         4.0
## 2          Roe deer     Capreolus herbi   Artiodactyla           lc         3.0
## 3    Asian elephant       Elephas herbi    Proboscidea           en         3.9
## 4             Horse         Equus herbi Perissodactyla domesticated         2.9
## 5            Donkey         Equus herbi Perissodactyla domesticated         3.1
## 6           Giraffe       Giraffa herbi   Artiodactyla           cd         1.9
## 7       Pilot whale Globicephalus carni        Cetacea           cd         2.7
## 8  African elephant     Loxodonta herbi    Proboscidea           vu         3.3
## 9             Sheep          Ovis herbi   Artiodactyla domesticated         3.8
## 10     Caspian seal         Phoca carni      Carnivora           vu         3.5
## 11  Brazilian tapir       Tapirus herbi Perissodactyla           vu         4.4
##    sleep_rem sleep_cycle awake brainwt   bodywt
## 1        0.7   0.6666667 20.00  0.4230  600.000
## 2         NA          NA 21.00  0.0982   14.800
## 3         NA          NA 20.10  4.6030 2547.000
## 4        0.6   1.0000000 21.10  0.6550  521.000
## 5        0.4          NA 20.90  0.4190  187.000
## 6        0.4          NA 22.10      NA  899.995
## 7        0.1          NA 21.35      NA  800.000
## 8         NA          NA 20.70  5.7120 6654.000
## 9        0.6          NA 20.20  0.1750   55.500
## 10       0.4          NA 20.50      NA   86.000
## 11       1.0   0.9000000 19.60  0.1690  207.501
```

The cow is probably the most sleepiest animal in the data frame, it has 4 hours of sleep for sleep total and the sleep cycle is 0.6667 hours.
The horse is a good second guess for me since it has 2.9 hours of total sleep and it has 1 hour for its sleep cycle.


## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.   
