---
title: "Lab 13 Homework"
author: "Kyra Kong"
date: "2023-03-03"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above. For any included plots, make sure they are clearly labeled. You are free to use any plot type that you feel best communicates the results of your analysis.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the libraries  

```r
library(tidyverse)
library(janitor)
library(here)
library(ggmap)
```


## Load the Data
We will use two separate data sets for this homework.  

1. The first [data set](https://rcweb.dartmouth.edu/~f002d69/workshops/index_rspatial.html) represent sightings of grizzly bears (Ursos arctos) in Alaska.  

```r
grizzly <- read.csv("data/bear-sightings.csv")
```

```r
wolves <-read.csv("data/wolves_data/wolves_dataset.csv")
```

2. The second data set is from Brandell, Ellen E (2021), Serological dataset and R code for: Patterns and processes of pathogen exposure in gray wolves across North America, Dryad, [Dataset](https://doi.org/10.5061/dryad.5hqbzkh51).  

1. Load the `grizzly` data and evaluate its structure.  

```r
glimpse(grizzly)
```

```
## Rows: 494
## Columns: 3
## $ bear.id   <int> 7, 57, 69, 75, 104, 108, 115, 116, 125, 135, 137, 162, 185, …
## $ longitude <dbl> -148.9560, -152.6228, -144.9374, -152.8485, -143.2948, -149.…
## $ latitude  <dbl> 62.65822, 58.35064, 62.38227, 59.90122, 61.07311, 62.91605, …
```


2. Use the range of the latitude and longitude to build an appropriate bounding box for your map.  

```r
grizzly %>% 
  select(longitude, latitude) %>% 
  summary()
```

```
##    longitude         latitude    
##  Min.   :-166.2   Min.   :55.02  
##  1st Qu.:-154.2   1st Qu.:58.13  
##  Median :-151.0   Median :60.97  
##  Mean   :-149.1   Mean   :61.41  
##  3rd Qu.:-145.6   3rd Qu.:64.13  
##  Max.   :-131.3   Max.   :70.37
```


```r
longitude <- c(-166.2,-131.3)
latitude <-c(55.02,70.37)
grizzlybbox <-make_bbox(longitude,latitude, f=0.05)
```

3. Load a map from `stamen` in a terrain style projection and display the map.  


```r
map1<-get_map(grizzlybbox, maptype = "terrain", source = "stamen")
```

```
## ℹ Map tiles by Stamen Design, under CC BY 3.0. Data by OpenStreetMap, under ODbL.
```

```r
ggmap(map1)
```

![](lab13_hw_files/figure-html/unnamed-chunk-8-1.png)<!-- -->

4. Build a final map that overlays the recorded observations of grizzly bears in Alaska.  

```r
ggmap(map1)+
  geom_point(data= grizzly, aes(longitude, latitude), alpha=0.75)+
  labs(title= "Grizzly Bears in Alaska", x= "Longitude", y = "Latitude")
```

![](lab13_hw_files/figure-html/unnamed-chunk-9-1.png)<!-- -->


Let's switch to the wolves data. Brandell, Ellen E (2021), Serological dataset and R code for: Patterns and processes of pathogen exposure in gray wolves across North America, Dryad, [Dataset](https://doi.org/10.5061/dryad.5hqbzkh51).  

5. Load the data and evaluate its structure.  

```r
glimpse(wolves)
```

```
## Rows: 1,986
## Columns: 23
## $ pop                <chr> "AK.PEN", "AK.PEN", "AK.PEN", "AK.PEN", "AK.PEN", "…
## $ year               <int> 2006, 2006, 2006, 2006, 2006, 2006, 2006, 2006, 200…
## $ age.cat            <chr> "S", "S", "A", "S", "A", "A", "A", "P", "S", "P", "…
## $ sex                <chr> "F", "M", "F", "M", "M", "M", "F", "M", "F", "M", "…
## $ color              <chr> "G", "G", "G", "B", "B", "G", "G", "G", "G", "G", "…
## $ lat                <dbl> 57.03983, 57.03983, 57.03983, 57.03983, 57.03983, 5…
## $ long               <dbl> -157.8427, -157.8427, -157.8427, -157.8427, -157.84…
## $ habitat            <dbl> 254.08, 254.08, 254.08, 254.08, 254.08, 254.08, 254…
## $ human              <dbl> 10.42, 10.42, 10.42, 10.42, 10.42, 10.42, 10.42, 10…
## $ pop.density        <dbl> 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, …
## $ pack.size          <dbl> 8.78, 8.78, 8.78, 8.78, 8.78, 8.78, 8.78, 8.78, 8.7…
## $ standard.habitat   <dbl> -1.6339, -1.6339, -1.6339, -1.6339, -1.6339, -1.633…
## $ standard.human     <dbl> -0.9784, -0.9784, -0.9784, -0.9784, -0.9784, -0.978…
## $ standard.pop       <dbl> -0.6827, -0.6827, -0.6827, -0.6827, -0.6827, -0.682…
## $ standard.packsize  <dbl> 1.3157, 1.3157, 1.3157, 1.3157, 1.3157, 1.3157, 1.3…
## $ standard.latitude  <dbl> 0.7214, 0.7214, 0.7214, 0.7214, 0.7214, 0.7214, 0.7…
## $ standard.longitude <dbl> -2.1441, -2.1441, -2.1441, -2.1441, -2.1441, -2.144…
## $ cav.binary         <int> 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, …
## $ cdv.binary         <int> 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
## $ cpv.binary         <int> 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, …
## $ chv.binary         <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, …
## $ neo.binary         <int> NA, NA, NA, 0, 0, NA, NA, 1, 0, 1, NA, 0, NA, NA, N…
## $ toxo.binary        <int> NA, NA, NA, 1, 0, NA, NA, 1, 0, 0, NA, 0, NA, NA, N…
```

6. How many distinct wolf populations are included in this study? Make a new object that restricts the data to the wolf populations in the lower 48 US states.  


```r
tabyl(wolves$pop) #not alaska and canada
```

```
##  wolves$pop   n     percent
##      AK.PEN 100 0.050352467
##     BAN.JAS  96 0.048338369
##          BC 145 0.073011078
##      DENALI 154 0.077542800
##       ELLES  11 0.005538771
##        GTNP  60 0.030211480
##      INT.AK  35 0.017623364
##     MEXICAN 181 0.091137966
##          MI 102 0.051359517
##          MT 351 0.176737160
##       N.NWT  67 0.033736153
##         ONT  60 0.030211480
##       SE.AK  10 0.005035247
##         SNF  92 0.046324270
##      SS.NWT  34 0.017119839
##         YNP 383 0.192849950
##        YUCH 105 0.052870091
```

```r
lower48 <-wolves %>% 
  filter(pop != "AK.PEN" & pop != "INT.AK" & pop != "SE.AK" & pop != "ONT" & pop != "BC" & pop!= "YUCH" & pop != "DENALI" & pop != "SS.NWT" & pop!= "ELLES" & pop!= "BAN.JAS" & pop!= "N.NWT") # removed anything not related to the lower 48 aka no alaska and canadian 
```


```r
tabyl(lower48$pop)
```

```
##  lower48$pop   n    percent
##         GTNP  60 0.05132592
##      MEXICAN 181 0.15483319
##           MI 102 0.08725406
##           MT 351 0.30025663
##          SNF  92 0.07869974
##          YNP 383 0.32763045
```

7. Use the range of the latitude and longitude to build an appropriate bounding box for your map.  


```r
names(lower48)
```

```
##  [1] "pop"                "year"               "age.cat"           
##  [4] "sex"                "color"              "lat"               
##  [7] "long"               "habitat"            "human"             
## [10] "pop.density"        "pack.size"          "standard.habitat"  
## [13] "standard.human"     "standard.pop"       "standard.packsize" 
## [16] "standard.latitude"  "standard.longitude" "cav.binary"        
## [19] "cdv.binary"         "cpv.binary"         "chv.binary"        
## [22] "neo.binary"         "toxo.binary"
```

```r
lower48 %>% 
  select(long,lat) %>% 
  summary()
```

```
##       long              lat       
##  Min.   :-110.99   Min.   :33.89  
##  1st Qu.:-110.99   1st Qu.:44.60  
##  Median :-110.55   Median :44.60  
##  Mean   :-106.91   Mean   :43.95  
##  3rd Qu.:-109.17   3rd Qu.:46.83  
##  Max.   : -86.82   Max.   :47.75
```

```r
longitude2 <- c(-110.99,-86.82)
latitude2<-c(33.89,47.75) 
wolvesbbox<-make_bbox(longitude2, latitude2, f= 0.05)
```

8.  Load a map from `stamen` in a `terrain-lines` projection and display the map.  

```r
map2 <-get_map(wolvesbbox, maptype = "terrain-lines", source = "stamen")
```

```
## ℹ Map tiles by Stamen Design, under CC BY 3.0. Data by OpenStreetMap, under ODbL.
```


```r
ggmap(map2)
```

![](lab13_hw_files/figure-html/unnamed-chunk-18-1.png)<!-- -->

9. Build a final map that overlays the recorded observations of wolves in the lower 48 states.  


```r
ggmap(map2) +
  geom_point(data=lower48, aes(long, lat), alpha = 0.05)+
  labs(title= "Wolves in the Lower 48 States", x= "Longitude", y= "Latitude")
```

![](lab13_hw_files/figure-html/unnamed-chunk-19-1.png)<!-- -->

10. Use the map from #9 above, but add some aesthetics. Try to `fill` and `color` by population.  


```r
names(lower48)
```

```
##  [1] "pop"                "year"               "age.cat"           
##  [4] "sex"                "color"              "lat"               
##  [7] "long"               "habitat"            "human"             
## [10] "pop.density"        "pack.size"          "standard.habitat"  
## [13] "standard.human"     "standard.pop"       "standard.packsize" 
## [16] "standard.latitude"  "standard.longitude" "cav.binary"        
## [19] "cdv.binary"         "cpv.binary"         "chv.binary"        
## [22] "neo.binary"         "toxo.binary"
```
# coloring by pop


```r
ggmap(map2) +
  geom_point(data=lower48, aes(long, lat, color= pop))+
  labs(title= "Wolves in the Lower 48 States", x= "Longitude", y= "Latitude")
```

![](lab13_hw_files/figure-html/unnamed-chunk-21-1.png)<!-- -->


# filling by pop

```r
ggmap(map2) +
  geom_point(data=lower48, aes(long, lat, fill= pop))+
  labs(title= "Wolves in the Lower 48 States", x= "Longitude", y= "Latitude")
```

![](lab13_hw_files/figure-html/unnamed-chunk-22-1.png)<!-- -->

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences. 
