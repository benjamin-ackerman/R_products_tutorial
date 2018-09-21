# Advanced Data Science - R Products Tutorial

This tutorial is designed for students enrolled in the JHSPH Biostat Department required course "Advanced Data Science."  In this tutorial, we will 1) build an R package from scratch, 2) create a website for the R package using GitHub Pages, and 3) build a Shiny app, which will use the R package.  Slides describing overviews of these R products are available *here* (include link to slides...)


The theme of this tutorial is **Halloween candy**!  Using data from [this FiveThirtyEight blogpost](https://fivethirtyeight.com/features/the-ultimate-halloween-candy-power-ranking/), we will be building an R package and an accompanying Shiny app that visualizes the most popular candies (the rankings are done according to a series of pair-wise comparisons between candies - see the original blogpost for more details). 

----------

### 1) R package

First, we will build an R package that creates a barplot of the top-ranked candies using `ggplot2`.  To start, create a new R project in RStudio:

1) Select "New R Project" in the drop down menu in the top right corner of the window
2) Select "New Directory"
3) Select "R Package"
4) Name your R package **halloween**, and specify where you want this new directory to live locally. *Make sure that "Create a git repository" is selected!*

<img src="figures/r_package.png" width="500">

Next, let's create a GitHub repository online and link it to the local directory.  You can do so by following the steps in [this GitHub help page](https://help.github.com/articles/adding-an-existing-project-to-github-using-the-command-line/), or follow these condensed steps: 

1) Create a new repo called "halloween" (*do* add a README, do *not* add a .gitignore)
2) Open the terminal and make your way into the "halloween" directory.
3) Edit the code chunk below according to your own GitHub username, and then paste it line by line into the terminal (if you forgot to select "Create a git repository" when making your R project, don't worry!  Before you enter the code below, type `git init` to initialize the repo):

```
git add .
git commit -m "first commit"
git remote add origin git@github.com:[YOUR-USERNAME]/halloween.git
git push -u origin master
```

Now double check on the GitHub website to verify that the files have been pushed!

Next, while we have the terminal open and directed into the "halloween" directory, let's download the data that we'll be including in the R package by running the following command:

```
mkdir data
curl https://raw.githubusercontent.com/fivethirtyeight/data/master/candy-power-ranking/candy-data.csv > data/candy_data.csv
```

Note that the code above does 3 things: 1) it creates a new directory within "halloween" called "data" using `mkdir`, 2) it uses `curl` to read the csv file from FiveThirtyEight's data repo, 3) it uses `>` to funnel the output into the file 'data/candy_data.csv'.

*a note for PC users, you may need to use `wget` instead of `curl`*

