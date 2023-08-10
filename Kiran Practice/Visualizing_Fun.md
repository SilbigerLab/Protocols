Running a marathon is a fun activity for leisure which some people
enjoy. There are many that you can register for, which are listed here:
<https://www.letsdothis.com/us>.

The amount of fun one is having while running has been shown to vary per
mile. Here, we are aiming to visualize this phenomenon.

## Step 1: Load *tidyverse* package

``` r
library('tidyverse')
```

## Step 2: Create a data frame of fun

``` r
miles <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,26.2)
fun <- c(10,10,9,9,9,3,8,7,7,10,8,2,2,1,6,2,3,1,1,1,0,0,0,0,10,10,10)
are_we_having_fun_yet <- data.frame(miles, fun)
```

## Step 3: Visualize the fun

``` r
visual_of_fun <- ggplot(are_we_having_fun_yet, aes(x=miles, y=fun))+
                  geom_line(linetype = "dotted")+
                  geom_point(size=3, fill="slategray3", color="gray25", shape=21)+
                  theme_classic()+
                  labs(title="How Much Fun We Are Having",
                                      x="Mile of Race", y = "Fun (on a scale of 1 - 10)")

visual_of_fun
```

![](Visualizing_Fun_files/figure-markdown_github/unnamed-chunk-3-1.png)
