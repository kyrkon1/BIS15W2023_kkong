---
title: "Generating Data: Intro to the Unix Shell"
author: "Hannah E. Houts"
date: "2023-03-07"
output:
  html_document: 
    theme: spacelab
    toc: yes
    toc_float: yes
    keep_md: yes
  pdf_document:
    toc: yes
---
# Generating Data: Intro to the Unix Shell

## Learning Goals
*At the end of this exercise, you will be able to:* 

1. Change directory and list files in directory
2. Understand basic shell vocabulary
3. Gain exposure to the syntax of shell & shell scripting
4. Look at help menus
5. Look at the contents of a directory
6. Download a file from the internet with `curl`

commands: `pwd`, `ls`, `cd`, `curl`, `cat`, `cp`, `mv`, `rm`, `mkdir`, `rmdir`, `curl`, `bash`


## Resources
This lesson was adapted from the following resources:

- [Data Carpentries: Introduction to the Command Line for Genomics](https://datacarpentry.org/shell-genomics/)

- [DIB Lab: Advanced Beginner Shell](https://dib-training.readthedocs.io/en/pub/2016-01-13-adv-beg-shell.html)

- [ggg298 lab2: UNIX_for_file_manipulation](https://github.com/ngs-docs/2021-GGG298/tree/latest/Week2-UNIX_for_file_manipulation)
- [The sourmash portion was adapted from this  sourmash tutorial](https://sourmash.readthedocs.io/en/latest/tutorial-lemonade.html)


## Getting started in binder!

Click on the "launch binder" link at the bottom of [this page] (https://github.com/hehouts/lab14_binder). This runs RStudio in a ["binder"](https://binder.readthedocs.io/en/latest/user-manual/overview/intro.html), which means we can all use a unix OS terminal, regardless of what computer you're on!

Wait ~1-3 minutes. You should see an RStudio Server window ...sooner or later!


## What is unix, the shell and what is the terminal?

Unix is technically an operating system, like Windows10 or MacOS. Most people are used to interacting with a graphic user interface (GUI), where you can use a combination of your mouse and keyboard to carry out commands on your computer. We can use the shell through a **terminal** program. The **shell** is a computer program that uses a command line interface (CLI) to give commands made by your keyboard to your operating system. Linux and Mac operating systems use a unix-like shell (bash and zsh, respectively), meaning they have similar commands, while windows uses a different language.

Everything we can do using our computer GUI, we can do in the shell. We can open programs, run analyses, create documents, delete files and create folders. We should note that _folders_ are called **directories** at the command line. For all intents and purposes they can be used interchangeably but if you'd like more information please see "The folder metaphor" section of [Wikipedia](https://en.wikipedia.org/wiki/Directory_%28computing%29#Folder_metaphor).

The ease of getting things done via the shell will increase with your exposure to the program.  

## Terminal Introduction
Once your binder has launched, there will be an rStudio interface. 

Go click on the terminal tab to get started. 

When we open up terminal in binder we will see a a line of text. This is a **prompt statement**. It can tell us useful things such as the name of the directory we are currently in, our username, or what computer we are currently running terminal on. However, the prompt statement that pops up in binder is quite long and distracting. Let's customize it to read `$ ` it by running:

```
PS1='$ '

```

we can clear that code from our screen with 

```
clear
```

Let's take a look around.
We can look at the contents of the current directory by using the `ls` command:

```
ls
```

This command prints out a list of files and directories that are located in our current working directory. 

Now, if we look at the contents of our current directory we have a few files, and a folder called `hannahs_unix_cafe`,

To switch the directory we are located in, we need to change directories using the `cd` command. Let's move into the `hannahs_unix_cafe` directory. 

```
cd hannahs_unix_cafe
```

We can confirm that we have moved with the **print working directory** command, which shows what directory we are currently located in.

```
pwd
```

This gives us the **absolute path** to the directory where we are located. An absolute path shows the complete series of directories you need to locate either a directory or a file starting from the root directory of your computer.

Let's have a look around.

```
ls
```
(ls stands for list. I remember it with `list stuff`)


However, this directory contains more than the eye can see! To show hidden files we can use the `-a` option.

```
ls -a
```

What did you find? 


Using options with our commands allows us to do a lot! But how did we know to add `-a` after ls? Most commands offer a `--help`. Let's look at the available options that `ls` has:

```
ls --help
```

Here we see a long list of options. Each option will allow us to do something different.


##### Practice:
Find the date `unix_cafe.txt` was created with `ls -l`



We can also combine commands:

```
ls -lah
```

This combination of options will _list_ _all_ the contents of the directory, in _"long form"_ and display file sizes in _human readable_ units between files types. 

(what does  human readable units mean? compare `ls -lah` to `ls -la`)






## Navigation
  Now we have a fairly good concept of navigating around our computers and seeing what is located in the directory we are. But some of the beauty of the shell is that we can execute activities in locations that we are not currently in. To do this we can either use an absolute path or a relative path. A **relative path** is the path to another directory from the the one you are currently in. 

Again, check out the  `hannahs_unix_cafe` directory

```
ls
```

Here we see several directories and text files. We can see what is in the text file using the `cat` command which concatenates and prints the content of the file we list. 

```
cat unix_cafe.txt
```

we can reference files by relative path too:
```
cat staff/cooks.txt
```

```
cat staff/waiters.txt 
```

Lets navigate into the `menu` directory

```
cd menu
```
and look at its contents:
```
ls 
```

We can see the contents of hours, and staff too:

```
ls ../staff
ls ../hours
```

So, even though we are in the `menu/` directory, we can see what is in other directories by using the relative path to the directory of interest. Note we can also use absolute paths too. You may have noticed the `../` this is how to get to the directory above the one you are currently located in. 

This .. feature can be used to help us navigate directories. move back up, out of the menu folder with 
```
cd ..
```

Note: in this case, we have access to the RStudio file browser, too, which is really nice. But in some situations, like if you are using a remote high performance compute cluster (hpc), you'll have to get by with just the command line interface and no other interface!

Wouldn't it be nice to see the contents of multiple directories at once? We can use a regular expression to capture a sequence of characters (like the numbers 1, 2 and 3 at the end of the tmp directories). We can use the wild card character `*`, which expands to match any amount of characters.

```
ls menu
```

```
ls menu/fall*
```

```
ls menu/*
```

We are quite used to moving, copying and deleting files using a GUI. All of these functions can be carried out at the command line with the following commands: 

Copy files with the `cp` command by specifying a file to copy and the location of the copied file. 

```
cd menu
ls
```

```
cd fall
ls
```

```
cp fall_lunch.txt fall_dinner.txt
ls
```

The syntax for the copy command is `cp <source_file> <destination_file>`. Using this syntax we can copy files to other directories as well:

```
cp year_round_offerings.txt ../spring/year_round_offerings.txt
```

If we list the files that are in the spring directory, we will see the `year_round_offerings.txt` file has been copied to the `spring/` directory.

```
ls -l../spring
```

#### Practice:

1. use that `cat` function! check out the contents of `fall_festival_specials.txt`, and 2 more menus.


2. from the `spring/` directory, copy the spring lunch menu to a spring dinner menu

3. Super Challenge: A menu was misplaced! Given that the syntax for copy is the same as the syntax for move, use the `mv` (move) command to move the `fall_desserts.txt` file from `spring/` to `fall/`.


## Copy, move, remove
Once we know how to copy and move files, we can also copy and move directories. We can create new directories with the command `mkdir`. Let's make a new directory called `winter`

```
cd ~/hannahs_unix_cafe/menu
mkdir summer
ls -l
```

The shell is quite powerful and can create multiple directories at once. It can create multiple in the current working directory:

```
mkdir winter take-out
ls -l
```

or it can create a series of directories on top of one another:

```
cd ..
mkdir -p company_secrets/lie/deep/within/the/caverns/of/unix/
```

We can use tab complete to get to the `go` directory. Type `cd h` then hit `tab`. If you hit tab enough times your command will eventually read:

```
cd company_secrets/lie/deep/within/the/caverns/of/unix/
```

You can see that we've created a bit of a monster directory structure...

you can visualize this with the tree function: 
```
cd ~/hannah_unix_cafe/
tree -L 6
```

This nicely hints at the power of the shell - you can do certain things (in this case, create a nested hierarchy of directories) much more easily in the shell. But that power cuts both ways - you can also mess things up more easily in the shell!


Now lets talk about deleting things:
```
cd ~/hannahs_unix_cafe
```

delete a file with the `rm` command:
```
rm health_report_2023.txt
```

you can delete files with their relative path too:

```
rm  hours/holiday_hours/summer_hours.txt 
```

you can delete an empty directory with `rmdir`:
```
rmdir menu/summer
```


## Tutorial time: CLI tools


This whole quarter, we have focused on what to do with data once we have it. 
That is no small feat, and is a literal entire (booming!) career path (see: data scientist). Though R is often used for analyzing biological data, many software tools are run with what is called a command line interface, or CLI. Everything we've covered today has been working "on the command line"


Here, I'm throwing a lot at you, and the goal is simply for you to see the power of CLI tools, not for you to be an expert genomicist by 5 o'clock!
```
cd ~/sourmash/genomic_data
```

We will be using `curl`, a command that downloads files from a web url.
Here we will download 4 files:

# download a metagenome (comes in two parts)
```

# download a metagenome (comes in two parts)
curl -JLO ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR885/005/SRR8859675/SRR8859675_1.fastq.gz
curl -JLO ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR885/005/SRR8859675/SRR8859675_2.fastq.gz

# downloads a GTDB genomic representatives database, containing ~65,000 genomes
curl -JLO https://osf.io/3a6gn/download

# taxonomy table for database
curl -JLO https://osf.io/v3zmg/download

ls -lh
```

Once you have those downloads going, let's chat..

What we are downloading is a metagenome from an Lemonade Creek, Yellowstone National Park (YNP). This environment is hot, acidic, and arsenic. A metagenome is the result of sequencing the DNA of the environment, in this case the hot spring water. This is a very common type of data for studying microbiomes. 

learn more about the data [here](https://bhattacharyalab.com/extremophily-research-areas/). 
learn more about the environment [here](https://www.nationalparkstraveler.org/2009/03/scientists-hot-water-yellowstone-national-park-good-cause)

*How are the downloads going? you should have 4 files*

Now, we are going to run a "bash script", a set of bash commands that are stored in a file, usually ending with `.sh`
```
cd ~/sourmash
bash sourmash.sh
ls *.csv
```
This will take a about 6 minutes. 
*make sure this is running while I start talking again :)*

So we have this type of data: mixed DNA from an environment. What questions you might want to ask about this data? Usually "Who is there?" and "Who is there in what proportions" is a solid start. 

Sourmash is a software developed in my lab, that has a CLI (command line interface). It analyzes these metagenomes, and (in this script) provides us with a few microbes found in the sample, and their relative abundance. Sourmash can create a csv file with this information, and we can visualize it in R.
(Sourmash is pre-installed in this binder instance.)


*check on your terminal- is it still running?*
While it's running, lets use the rstudio file browser to open up sourmash.sh and check it out.


Reminder: The point the lesson today is not for you to be able to make sense of this output. The point is four you to understand that there is software that you might want to use, that require the use of a CLI (command line interface). May of these tools can output a table that we can use in R!

### IMPORTANT: Export from binder
Now we export our csv from the binder: check the box of the `hotspring_microbiome.csv`, click more settings, and select export. This will download to your downloads folder, and then you can drag it into your lab_14/sourmash/ folder.

Lets visualize this table with our tidyverse skills:


```r
library(tidyverse)
```

```
## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2 ──
## ✔ ggplot2 3.4.0      ✔ purrr   1.0.0 
## ✔ tibble  3.1.8      ✔ dplyr   1.0.10
## ✔ tidyr   1.2.1      ✔ stringr 1.5.0 
## ✔ readr   2.1.3      ✔ forcats 0.5.2 
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
```


```r
hotspring_microbiome <- read_csv("sourmash/hotspring_microbiome.csv")
```

```
## Rows: 22 Columns: 32
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (7): filename, name, md5, query_filename, query_name, query_md5, moltype
## dbl (23): intersect_bp, f_orig_query, f_match, f_unique_to_query, f_unique_w...
## lgl  (2): query_abundance, potential_false_negative
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```r
names(hotspring_microbiome)
```

```
##  [1] "intersect_bp"             "f_orig_query"            
##  [3] "f_match"                  "f_unique_to_query"       
##  [5] "f_unique_weighted"        "average_abund"           
##  [7] "median_abund"             "std_abund"               
##  [9] "filename"                 "name"                    
## [11] "md5"                      "f_match_orig"            
## [13] "unique_intersect_bp"      "gather_result_rank"      
## [15] "remaining_bp"             "query_filename"          
## [17] "query_name"               "query_md5"               
## [19] "query_bp"                 "ksize"                   
## [21] "moltype"                  "scaled"                  
## [23] "query_n_hashes"           "query_abundance"         
## [25] "query_containment_ani"    "match_containment_ani"   
## [27] "average_containment_ani"  "max_containment_ani"     
## [29] "potential_false_negative" "n_unique_weighted_found" 
## [31] "sum_weighted_found"       "total_weighted_hashes"
```

```r
hotspring_microbiome <- hotspring_microbiome %>% 
  relocate(query_name, name, average_abund, average_containment_ani) %>% 
  arrange(desc(average_abund))
```



```r
hotspring_microbiome <- hotspring_microbiome %>% 
  relocate(query_name, name, average_abund, average_containment_ani) %>% 
  arrange(desc(average_abund))
hotspring_microbiome
```

```
## # A tibble: 22 × 32
##    query…¹ name  avera…² avera…³ inter…⁴ f_ori…⁵ f_match f_uni…⁶ f_uni…⁷ media…⁸
##    <chr>   <chr>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
##  1 SRR885… GCF_…   57.4    0.856  201000 6.28e-4  0.0864 6.22e-4 1.51e-2      60
##  2 SRR885… GCA_…   28.3    0.861  232000 7.25e-4  0.0690 4.81e-4 5.77e-3      29
##  3 SRR885… GCF_…   22.9    0.863  252000 7.88e-4  0.0900 6.41e-4 6.21e-3       9
##  4 SRR885… GCF_…   15.2    0.856  218000 6.81e-4  0.0507 4.47e-4 2.87e-3       2
##  5 SRR885… GCF_…   14.7    0.824   64000 2.00e-4  0.0210 1.66e-4 1.03e-3       5
##  6 SRR885… GCF_…   13.7    0.844  143000 4.47e-4  0.0249 2.13e-4 1.24e-3       3
##  7 SRR885… GCA_…    6.61   0.888  602000 1.88e-3  0.273  1.88e-3 5.27e-3       1
##  8 SRR885… GCA_…    3.16   0.886  622000 1.94e-3  0.233  1.94e-3 2.60e-3       3
##  9 SRR885… GCA_…    2.60   0.865  352000 1.10e-3  0.0932 1.10e-3 1.21e-3       2
## 10 SRR885… GCA_…    2.5    0.837  119000 3.72e-4  0.0270 2.69e-4 2.85e-4       2
## # … with 12 more rows, 22 more variables: std_abund <dbl>, filename <chr>,
## #   md5 <chr>, f_match_orig <dbl>, unique_intersect_bp <dbl>,
## #   gather_result_rank <dbl>, remaining_bp <dbl>, query_filename <chr>,
## #   query_md5 <chr>, query_bp <dbl>, ksize <dbl>, moltype <chr>, scaled <dbl>,
## #   query_n_hashes <dbl>, query_abundance <lgl>, query_containment_ani <dbl>,
## #   match_containment_ani <dbl>, max_containment_ani <dbl>,
## #   potential_false_negative <lgl>, n_unique_weighted_found <dbl>, …
```

#### Take it further! 
1. What is the most abundant bacterial species based on average abundance?

```r
hotspring_microbiome %>% 
  relocate(query_name, name, average_abund, average_containment_ani) %>% 
  arrange(desc(average_abund)) %>% 
  top_n(1, average_abund) %>% 
  select(name)
```

```
## # A tibble: 1 × 1
##   name                                                                     
##   <chr>                                                                    
## 1 GCF_006265245.1 Prosthecochloris vibrioformis strain=DSM 260, ASM626524v1
```
2. Make a bar plot of `name` and `average_abund`. 

```r
theme_set(theme_minimal())
```


```r
p<- hotspring_microbiome %>% 
  relocate(query_name, name, average_abund, average_containment_ani) %>% 
  arrange(desc(average_abund))
```


```r
p %>% 
  ggplot(aes(x = name, y = average_abund, fill = name))+
  geom_col()+
  theme(legend.position = "none")+
  coord_flip()+
  labs(title = "Abundance of Microbes in Lemonade Creek Hot Spring",
       x = NULL,
       y = "Average Abundance")
```

![](lab14_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

3. Look up this species on wikipedia. are you surprised to find this in a hot spring?

## Wrap up 

Use of the Unix Shell is fundamental to a wide range of advanced computing tasks, including high-performance computing. Experience with CLI (command line interfaces) will free you to use research software, and begin to create your own data that can be visualized in R with all of the incredible skills you've developed in this class. 

The homework for this lesson is not coding based, but it is important! Please use the homework to reflect on everything you have learned this quarter, and how those skills might serve you in the future.  

Thank you for your attention all quarter, this has been a wonderful class.
