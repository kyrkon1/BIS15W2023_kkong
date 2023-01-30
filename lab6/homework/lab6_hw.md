---
title: "Lab 6 Homework"
author: "Kyra Kong"
date: "2023-01-30"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the libraries

```r
library(tidyverse)
library(janitor)
library(skimr)
```

For this assignment we are going to work with a large data set from the [United Nations Food and Agriculture Organization](http://www.fao.org/about/en/) on world fisheries. These data are pretty wild, so we need to do some cleaning. First, load the data.  

Load the data `FAO_1950to2012_111914.csv` as a new object titled `fisheries`.

```r
fisheries <- readr::read_csv(file = "data/FAO_1950to2012_111914.csv")
```

```
## Rows: 17692 Columns: 71
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr (69): Country, Common name, ISSCAAP taxonomic group, ASFIS species#, ASF...
## dbl  (2): ISSCAAP group#, FAO major fishing area
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

1. Do an exploratory analysis of the data (your choice). What are the names of the variables, what are the dimensions, are there any NA's, what are the classes of the variables?  

```r
names(fisheries)
```

```
##  [1] "Country"                 "Common name"            
##  [3] "ISSCAAP group#"          "ISSCAAP taxonomic group"
##  [5] "ASFIS species#"          "ASFIS species name"     
##  [7] "FAO major fishing area"  "Measure"                
##  [9] "1950"                    "1951"                   
## [11] "1952"                    "1953"                   
## [13] "1954"                    "1955"                   
## [15] "1956"                    "1957"                   
## [17] "1958"                    "1959"                   
## [19] "1960"                    "1961"                   
## [21] "1962"                    "1963"                   
## [23] "1964"                    "1965"                   
## [25] "1966"                    "1967"                   
## [27] "1968"                    "1969"                   
## [29] "1970"                    "1971"                   
## [31] "1972"                    "1973"                   
## [33] "1974"                    "1975"                   
## [35] "1976"                    "1977"                   
## [37] "1978"                    "1979"                   
## [39] "1980"                    "1981"                   
## [41] "1982"                    "1983"                   
## [43] "1984"                    "1985"                   
## [45] "1986"                    "1987"                   
## [47] "1988"                    "1989"                   
## [49] "1990"                    "1991"                   
## [51] "1992"                    "1993"                   
## [53] "1994"                    "1995"                   
## [55] "1996"                    "1997"                   
## [57] "1998"                    "1999"                   
## [59] "2000"                    "2001"                   
## [61] "2002"                    "2003"                   
## [63] "2004"                    "2005"                   
## [65] "2006"                    "2007"                   
## [67] "2008"                    "2009"                   
## [69] "2010"                    "2011"                   
## [71] "2012"
```

```r
dim(fisheries)
```

```
## [1] 17692    71
```

```r
anyNA(fisheries)
```

```
## [1] TRUE
```

```r
glimpse(fisheries)
```

```
## Rows: 17,692
## Columns: 71
## $ Country                   <chr> "Albania", "Albania", "Albania", "Albania", …
## $ `Common name`             <chr> "Angelsharks, sand devils nei", "Atlantic bo…
## $ `ISSCAAP group#`          <dbl> 38, 36, 37, 45, 32, 37, 33, 45, 38, 57, 33, …
## $ `ISSCAAP taxonomic group` <chr> "Sharks, rays, chimaeras", "Tunas, bonitos, …
## $ `ASFIS species#`          <chr> "10903XXXXX", "1750100101", "17710001XX", "2…
## $ `ASFIS species name`      <chr> "Squatinidae", "Sarda sarda", "Sphyraena spp…
## $ `FAO major fishing area`  <dbl> 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, …
## $ Measure                   <chr> "Quantity (tonnes)", "Quantity (tonnes)", "Q…
## $ `1950`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1951`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1952`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1953`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1954`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1955`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1956`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1957`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1958`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1959`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1960`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1961`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1962`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1963`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1964`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1965`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1966`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1967`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1968`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1969`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1970`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1971`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1972`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1973`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1974`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1975`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1976`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1977`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1978`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1979`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1980`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1981`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1982`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
## $ `1983`                    <chr> NA, NA, NA, NA, NA, NA, "559", NA, NA, NA, N…
## $ `1984`                    <chr> NA, NA, NA, NA, NA, NA, "392", NA, NA, NA, N…
## $ `1985`                    <chr> NA, NA, NA, NA, NA, NA, "406", NA, NA, NA, N…
## $ `1986`                    <chr> NA, NA, NA, NA, NA, NA, "499", NA, NA, NA, N…
## $ `1987`                    <chr> NA, NA, NA, NA, NA, NA, "564", NA, NA, NA, N…
## $ `1988`                    <chr> NA, NA, NA, NA, NA, NA, "724", NA, NA, NA, N…
## $ `1989`                    <chr> NA, NA, NA, NA, NA, NA, "583", NA, NA, NA, N…
## $ `1990`                    <chr> NA, NA, NA, NA, NA, NA, "754", NA, NA, NA, N…
## $ `1991`                    <chr> NA, NA, NA, NA, NA, NA, "283", NA, NA, NA, N…
## $ `1992`                    <chr> NA, NA, NA, NA, NA, NA, "196", NA, NA, NA, N…
## $ `1993`                    <chr> NA, NA, NA, NA, NA, NA, "150 F", NA, NA, NA,…
## $ `1994`                    <chr> NA, NA, NA, NA, NA, NA, "100 F", NA, NA, NA,…
## $ `1995`                    <chr> "0 0", "1", NA, "0 0", "0 0", NA, "52", "30"…
## $ `1996`                    <chr> "53", "2", NA, "3", "2", NA, "104", "8", NA,…
## $ `1997`                    <chr> "20", "0 0", NA, "0 0", "0 0", NA, "65", "4"…
## $ `1998`                    <chr> "31", "12", NA, NA, NA, NA, "220", "18", NA,…
## $ `1999`                    <chr> "30", "30", NA, NA, NA, NA, "220", "18", NA,…
## $ `2000`                    <chr> "30", "25", "2", NA, NA, NA, "220", "20", NA…
## $ `2001`                    <chr> "16", "30", NA, NA, NA, NA, "120", "23", NA,…
## $ `2002`                    <chr> "79", "24", NA, "34", "6", NA, "150", "84", …
## $ `2003`                    <chr> "1", "4", NA, "22", NA, NA, "84", "178", NA,…
## $ `2004`                    <chr> "4", "2", "2", "15", "1", "2", "76", "285", …
## $ `2005`                    <chr> "68", "23", "4", "12", "5", "6", "68", "150"…
## $ `2006`                    <chr> "55", "30", "7", "18", "8", "9", "86", "102"…
## $ `2007`                    <chr> "12", "19", NA, NA, NA, NA, "132", "18", NA,…
## $ `2008`                    <chr> "23", "27", NA, NA, NA, NA, "132", "23", NA,…
## $ `2009`                    <chr> "14", "21", NA, NA, NA, NA, "154", "20", NA,…
## $ `2010`                    <chr> "78", "23", "7", NA, NA, NA, "80", "228", NA…
## $ `2011`                    <chr> "12", "12", NA, NA, NA, NA, "88", "9", NA, "…
## $ `2012`                    <chr> "5", "5", NA, NA, NA, NA, "129", "290", NA, …
```


2. Use `janitor` to rename the columns and make them easier to use. As part of this cleaning step, change `country`, `isscaap_group_number`, `asfis_species_number`, and `fao_major_fishing_area` to data class factor. 

```r
fisheries <- janitor::clean_names(fisheries)
```


```r
names(fisheries)
```

```
##  [1] "country"                 "common_name"            
##  [3] "isscaap_group_number"    "isscaap_taxonomic_group"
##  [5] "asfis_species_number"    "asfis_species_name"     
##  [7] "fao_major_fishing_area"  "measure"                
##  [9] "x1950"                   "x1951"                  
## [11] "x1952"                   "x1953"                  
## [13] "x1954"                   "x1955"                  
## [15] "x1956"                   "x1957"                  
## [17] "x1958"                   "x1959"                  
## [19] "x1960"                   "x1961"                  
## [21] "x1962"                   "x1963"                  
## [23] "x1964"                   "x1965"                  
## [25] "x1966"                   "x1967"                  
## [27] "x1968"                   "x1969"                  
## [29] "x1970"                   "x1971"                  
## [31] "x1972"                   "x1973"                  
## [33] "x1974"                   "x1975"                  
## [35] "x1976"                   "x1977"                  
## [37] "x1978"                   "x1979"                  
## [39] "x1980"                   "x1981"                  
## [41] "x1982"                   "x1983"                  
## [43] "x1984"                   "x1985"                  
## [45] "x1986"                   "x1987"                  
## [47] "x1988"                   "x1989"                  
## [49] "x1990"                   "x1991"                  
## [51] "x1992"                   "x1993"                  
## [53] "x1994"                   "x1995"                  
## [55] "x1996"                   "x1997"                  
## [57] "x1998"                   "x1999"                  
## [59] "x2000"                   "x2001"                  
## [61] "x2002"                   "x2003"                  
## [63] "x2004"                   "x2005"                  
## [65] "x2006"                   "x2007"                  
## [67] "x2008"                   "x2009"                  
## [69] "x2010"                   "x2011"                  
## [71] "x2012"
```



```r
fisheries<- fisheries %>% 
  mutate(across(c(country, isscaap_group_number, asfis_species_number, fao_major_fishing_area),as_factor))
```


```r
glimpse(fisheries)
```

```
## Rows: 17,692
## Columns: 71
```

```
## Warning in grepl(",", levels(x), fixed = TRUE): input string 43 is invalid UTF-8
```

```
## Warning in grepl(",", levels(x), fixed = TRUE): input string 45 is invalid UTF-8
```

```
## Warning in grepl(",", levels(x), fixed = TRUE): input string 149 is invalid
## UTF-8
```

```
## Warning in grepl(",", levels(x), fixed = TRUE): input string 150 is invalid
## UTF-8
```

```
## $ country                 <fct> "Albania", "Albania", "Albania", "Albania", "A…
## $ common_name             <chr> "Angelsharks, sand devils nei", "Atlantic boni…
## $ isscaap_group_number    <fct> 38, 36, 37, 45, 32, 37, 33, 45, 38, 57, 33, 57…
## $ isscaap_taxonomic_group <chr> "Sharks, rays, chimaeras", "Tunas, bonitos, bi…
## $ asfis_species_number    <fct> 10903XXXXX, 1750100101, 17710001XX, 2280203101…
## $ asfis_species_name      <chr> "Squatinidae", "Sarda sarda", "Sphyraena spp",…
## $ fao_major_fishing_area  <fct> 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37…
## $ measure                 <chr> "Quantity (tonnes)", "Quantity (tonnes)", "Qua…
## $ x1950                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1951                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1952                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1953                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1954                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1955                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1956                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1957                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1958                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1959                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1960                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1961                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1962                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1963                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1964                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1965                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1966                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1967                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1968                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1969                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1970                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1971                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1972                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1973                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1974                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1975                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1976                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1977                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1978                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1979                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1980                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1981                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1982                   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ x1983                   <chr> NA, NA, NA, NA, NA, NA, "559", NA, NA, NA, NA,…
## $ x1984                   <chr> NA, NA, NA, NA, NA, NA, "392", NA, NA, NA, NA,…
## $ x1985                   <chr> NA, NA, NA, NA, NA, NA, "406", NA, NA, NA, NA,…
## $ x1986                   <chr> NA, NA, NA, NA, NA, NA, "499", NA, NA, NA, NA,…
## $ x1987                   <chr> NA, NA, NA, NA, NA, NA, "564", NA, NA, NA, NA,…
## $ x1988                   <chr> NA, NA, NA, NA, NA, NA, "724", NA, NA, NA, NA,…
## $ x1989                   <chr> NA, NA, NA, NA, NA, NA, "583", NA, NA, NA, NA,…
## $ x1990                   <chr> NA, NA, NA, NA, NA, NA, "754", NA, NA, NA, NA,…
## $ x1991                   <chr> NA, NA, NA, NA, NA, NA, "283", NA, NA, NA, NA,…
## $ x1992                   <chr> NA, NA, NA, NA, NA, NA, "196", NA, NA, NA, NA,…
## $ x1993                   <chr> NA, NA, NA, NA, NA, NA, "150 F", NA, NA, NA, N…
## $ x1994                   <chr> NA, NA, NA, NA, NA, NA, "100 F", NA, NA, NA, N…
## $ x1995                   <chr> "0 0", "1", NA, "0 0", "0 0", NA, "52", "30", …
## $ x1996                   <chr> "53", "2", NA, "3", "2", NA, "104", "8", NA, "…
## $ x1997                   <chr> "20", "0 0", NA, "0 0", "0 0", NA, "65", "4", …
## $ x1998                   <chr> "31", "12", NA, NA, NA, NA, "220", "18", NA, "…
## $ x1999                   <chr> "30", "30", NA, NA, NA, NA, "220", "18", NA, "…
## $ x2000                   <chr> "30", "25", "2", NA, NA, NA, "220", "20", NA, …
## $ x2001                   <chr> "16", "30", NA, NA, NA, NA, "120", "23", NA, "…
## $ x2002                   <chr> "79", "24", NA, "34", "6", NA, "150", "84", NA…
## $ x2003                   <chr> "1", "4", NA, "22", NA, NA, "84", "178", NA, "…
## $ x2004                   <chr> "4", "2", "2", "15", "1", "2", "76", "285", "1…
## $ x2005                   <chr> "68", "23", "4", "12", "5", "6", "68", "150", …
## $ x2006                   <chr> "55", "30", "7", "18", "8", "9", "86", "102", …
## $ x2007                   <chr> "12", "19", NA, NA, NA, NA, "132", "18", NA, "…
## $ x2008                   <chr> "23", "27", NA, NA, NA, NA, "132", "23", NA, "…
## $ x2009                   <chr> "14", "21", NA, NA, NA, NA, "154", "20", NA, "…
## $ x2010                   <chr> "78", "23", "7", NA, NA, NA, "80", "228", NA, …
## $ x2011                   <chr> "12", "12", NA, NA, NA, NA, "88", "9", NA, "90…
## $ x2012                   <chr> "5", "5", NA, NA, NA, NA, "129", "290", NA, "1…
```


We need to deal with the years because they are being treated as characters and start with an X. We also have the problem that the column names that are years actually represent data. We haven't discussed tidy data yet, so here is some help. You should run this ugly chunk to transform the data for the rest of the homework. It will only work if you have used janitor to rename the variables in question 2!

```r
fisheries_tidy <- fisheries %>% 
  pivot_longer(-c(country,common_name,isscaap_group_number,isscaap_taxonomic_group,asfis_species_number,asfis_species_name,fao_major_fishing_area,measure),
               names_to = "year",
              values_to = "catch",
               values_drop_na = TRUE) %>% 
  mutate(year= as.numeric(str_replace(year, 'x', ''))) %>% 
  mutate(catch= str_replace(catch, c(' F'), replacement = '')) %>% 
  mutate(catch= str_replace(catch, c('...'), replacement = '')) %>% 
  mutate(catch= str_replace(catch, c('-'), replacement = '')) %>% 
  mutate(catch= str_replace(catch, c('0 0'), replacement = ''))

fisheries_tidy$catch <- as.numeric(fisheries_tidy$catch)
```

3. How many countries are represented in the data? Provide a count and list their names.

```r
fisheries_tidy %>% 
  count(country)
```

```
## # A tibble: 203 × 2
##    country                 n
##    <fct>               <int>
##  1 Albania               934
##  2 Algeria              1561
##  3 American Samoa        556
##  4 Angola               2119
##  5 Anguilla              129
##  6 Antigua and Barbuda   356
##  7 Argentina            3403
##  8 Aruba                 172
##  9 Australia            8183
## 10 Bahamas               423
## # … with 193 more rows
```

4. Refocus the data only to include country, isscaap_taxonomic_group, asfis_species_name, asfis_species_number, year, catch.


```r
names(fisheries)
```

```
##  [1] "country"                 "common_name"            
##  [3] "isscaap_group_number"    "isscaap_taxonomic_group"
##  [5] "asfis_species_number"    "asfis_species_name"     
##  [7] "fao_major_fishing_area"  "measure"                
##  [9] "x1950"                   "x1951"                  
## [11] "x1952"                   "x1953"                  
## [13] "x1954"                   "x1955"                  
## [15] "x1956"                   "x1957"                  
## [17] "x1958"                   "x1959"                  
## [19] "x1960"                   "x1961"                  
## [21] "x1962"                   "x1963"                  
## [23] "x1964"                   "x1965"                  
## [25] "x1966"                   "x1967"                  
## [27] "x1968"                   "x1969"                  
## [29] "x1970"                   "x1971"                  
## [31] "x1972"                   "x1973"                  
## [33] "x1974"                   "x1975"                  
## [35] "x1976"                   "x1977"                  
## [37] "x1978"                   "x1979"                  
## [39] "x1980"                   "x1981"                  
## [41] "x1982"                   "x1983"                  
## [43] "x1984"                   "x1985"                  
## [45] "x1986"                   "x1987"                  
## [47] "x1988"                   "x1989"                  
## [49] "x1990"                   "x1991"                  
## [51] "x1992"                   "x1993"                  
## [53] "x1994"                   "x1995"                  
## [55] "x1996"                   "x1997"                  
## [57] "x1998"                   "x1999"                  
## [59] "x2000"                   "x2001"                  
## [61] "x2002"                   "x2003"                  
## [63] "x2004"                   "x2005"                  
## [65] "x2006"                   "x2007"                  
## [67] "x2008"                   "x2009"                  
## [69] "x2010"                   "x2011"                  
## [71] "x2012"
```


```r
fisheries_tidy %>% 
  select(country, isscaap_taxonomic_group, asfis_species_name, asfis_species_number, year, catch) 
```

```
## # A tibble: 376,771 × 6
##    country isscaap_taxonomic_group asfis_species_name asfis_specie…¹  year catch
##    <fct>   <chr>                   <chr>              <fct>          <dbl> <dbl>
##  1 Albania Sharks, rays, chimaeras Squatinidae        10903XXXXX      1995    NA
##  2 Albania Sharks, rays, chimaeras Squatinidae        10903XXXXX      1996    53
##  3 Albania Sharks, rays, chimaeras Squatinidae        10903XXXXX      1997    20
##  4 Albania Sharks, rays, chimaeras Squatinidae        10903XXXXX      1998    31
##  5 Albania Sharks, rays, chimaeras Squatinidae        10903XXXXX      1999    30
##  6 Albania Sharks, rays, chimaeras Squatinidae        10903XXXXX      2000    30
##  7 Albania Sharks, rays, chimaeras Squatinidae        10903XXXXX      2001    16
##  8 Albania Sharks, rays, chimaeras Squatinidae        10903XXXXX      2002    79
##  9 Albania Sharks, rays, chimaeras Squatinidae        10903XXXXX      2003     1
## 10 Albania Sharks, rays, chimaeras Squatinidae        10903XXXXX      2004     4
## # … with 376,761 more rows, and abbreviated variable name ¹​asfis_species_number
```

5. Based on the asfis_species_number, how many distinct fish species were caught as part of these data?

```r
fisheries_tidy %>% 
  summarize(n_distinct_species= n_distinct(asfis_species_number))
```

```
## # A tibble: 1 × 1
##   n_distinct_species
##                <int>
## 1               1551
```

6. Which country had the largest overall catch in the year 2000?

```r
fisheries_tidy %>% 
  filter(year=="2000") %>% 
  group_by(country) %>% 
  summarize(catch_total=sum(catch,na.rm=T)) %>% 
  arrange(desc(catch_total))
```

```
## # A tibble: 193 × 2
##    country                  catch_total
##    <fct>                          <dbl>
##  1 China                          25899
##  2 Russian Federation             12181
##  3 United States of America       11762
##  4 Japan                           8510
##  5 Indonesia                       8341
##  6 Peru                            7443
##  7 Chile                           6906
##  8 India                           6351
##  9 Thailand                        6243
## 10 Korea, Republic of              6124
## # … with 183 more rows
```

7. Which country caught the most sardines (_Sardina pilchardus_) between the years 1990-2000?

```r
fisheries_tidy %>% 
  filter(between(year, 1990, 2000)) %>% 
  group_by(country) %>% 
  filter(asfis_species_name == "Sardina pilchardus") %>% 
  summarize(catch_total=sum(catch,na.rm =T)) %>% 
  arrange(desc(catch_total))
```

```
## # A tibble: 37 × 2
##    country               catch_total
##    <fct>                       <dbl>
##  1 Morocco                      7470
##  2 Spain                        3507
##  3 Russian Federation           1639
##  4 Ukraine                      1030
##  5 France                        966
##  6 Portugal                      818
##  7 Greece                        528
##  8 Italy                         507
##  9 Serbia and Montenegro         478
## 10 Denmark                       477
## # … with 27 more rows
```



8. Which five countries caught the most cephalopods between 2008-2012?

```r
fisheries_tidy %>% 
  group_by(country) %>%  
  filter(between(year, 2008,2021)) %>% 
  filter(isscaap_taxonomic_group == "Squids, cuttlefishes, octopuses") %>% 
  summarize(catch_total=sum(catch,na.rm =T)) %>% 
  arrange(desc(catch_total)) %>% 
  head(n=5)
```

```
## # A tibble: 5 × 2
##   country            catch_total
##   <fct>                    <dbl>
## 1 China                     8349
## 2 Korea, Republic of        3480
## 3 Peru                      3422
## 4 Japan                     3248
## 5 Chile                     2775
```


9. Which species had the highest catch total between 2008-2012? (hint: Osteichthyes is not a species)

```r
fisheries_tidy %>% 
  group_by(asfis_species_name) %>% 
  filter(between(year,2008,2012), asfis_species_name != "Osteichthyes") %>% 
  summarize(catch_total = sum(catch,na.rm =T)) %>% 
  arrange(desc(catch_total))
```

```
## # A tibble: 1,471 × 2
##    asfis_species_name    catch_total
##    <chr>                       <dbl>
##  1 Theragra chalcogramma       41075
##  2 Engraulis ringens           35523
##  3 Katsuwonus pelamis          32153
##  4 Trichiurus lepturus         30400
##  5 Clupea harengus             28527
##  6 Thunnus albacares           20119
##  7 Scomber japonicus           14723
##  8 Gadus morhua                13253
##  9 Thunnus alalunga            12019
## 10 Natantia                    11984
## # … with 1,461 more rows
```
Highest total catch was the Theragra chalcogramma 
10. Use the data to do at least one analysis of your choice.

```r
fisheries_tidy %>% 
  group_by(country) %>% 
  select(common_name, year, catch) %>% 
  filter(between(year, 2000,2010)) %>% 
  arrange(desc(catch))
```

```
## Adding missing grouping variables: `country`
```

```
## # A tibble: 106,268 × 4
## # Groups:   country [196]
##    country                  common_name                     year catch
##    <fct>                    <chr>                          <dbl> <dbl>
##  1 Chile                    Chilean jack mackerel           2006  9941
##  2 Chile                    Chilean jack mackerel           2001  9933
##  3 United States of America Alaska pollock(=Walleye poll.)  2004  9928
##  4 China                    Marine fishes nei               2002  9899
##  5 Viet Nam                 Marine fishes nei               2010  9806
##  6 Peru                     Anchoveta(=Peruvian anchovy)    2007  9802
##  7 Myanmar                  Marine fishes nei               2004  9640
##  8 Chile                    Anchoveta(=Peruvian anchovy)    2004  9571
##  9 China                    Marine crustaceans nei          2001  9209
## 10 Viet Nam                 Marine fishes nei               2003  9157
## # … with 106,258 more rows
```


## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.   
