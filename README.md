# Advanced Data Science - R Products Tutorial

This tutorial is designed for students enrolled in the JHSPH Biostat Department required course "Advanced Data Science."  In this tutorial, we will 1) build an R package from scratch, 2) create a website for the R package using GitHub Pages, and 3) build a Shiny app, which will use the R package.  Slides describing overviews of these R products are available *here* (include link to slides...)

The theme of this tutorial is **Halloween candy**!  Using data from [this FiveThirtyEight blogpost](https://fivethirtyeight.com/features/the-ultimate-halloween-candy-power-ranking/), we will be building an R package and an accompanying Shiny app that visualizes the most popular candies (the rankings are done according to a series of pair-wise comparisons between candies - see the original blogpost for more details). 

----------

### 1) R package

First, we will build an R package that creates a barplot of the top-ranked candies using `ggplot2`.  

#### Create a new R project in RStudio
First, let's create a new local folder with an R package project:
1) Open RStudio and select "New R Project" in the drop down menu in the top right corner of the window
2) Select "New Directory"
3) Select "R Package"
4) Name your R package **halloween** (which will also be the name of the local folder housing the R package), and specify where you want this new directory to live locally. *Make sure that "Create a git repository" is selected!*

<img src="figures/r_package.png" width="500">

#### Create a new GitHub repo
Next, let's create a GitHub repository online and link it to the local directory of the R project.  You can do so by following the steps in [this GitHub help page](https://help.github.com/articles/adding-an-existing-project-to-github-using-the-command-line/), or by following these condensed steps: 

1) Create a new repo called "halloween" (*do* add a README, do *not* add a .gitignore)
2) Open a new Terminal/Git Bash console on your computer and make your way into your local "halloween" directory.
3) Edit the code chunk below according to your own GitHub username, and then paste it line by line into the terminal (if you forgot to select "Create a git repository" when making your R project, don't worry!  Before you enter the code below, type `git init` to initialize the repo):

```
git add .
git commit -m "first commit"
git remote add origin git@github.com:[YOUR-USERNAME]/halloween.git
git push -u origin master
```

Double check on the GitHub website to verify that the files have been pushed!

#### Download data for the R package
Next, while we have the terminal open and directed into the "halloween" directory, let's download the data that we'll be including in the R package.  In order to attach the data to the R package, we will need to save it as a .RData file.  I've written an R script located in the `R_package` directory that does the following:

1) Reads in the .csv file from FiveThirtyEight into R
2) Saves the dataframe as an .RData object in the `data/` directory of the package.

To download and run the R script, you can enter the following code into the command line:

```
mkdir data
curl https://raw.githubusercontent.com/benjamin-ackerman/R_products_tutorial/master/R_package/download_data.R > download_data.R
Rscript download_data.R
```

The code above does the following: 

1) `mkdir` creates a new directory within "halloween" called "data"
2) `curl` reads the R script from this repo
3) `>` funnels the output into a local file on your computer called 'download_data.R'. *A note for PC users:* you may need to use `wget` instead of `curl`.
4) `Rscript` executes the script `download_data.R` from the command line (if this line doesn't work, you can open the R script manually in RStudio and run the commands).

Now check to make sure there's a file called `candy_data.RData` in your `data/` directory!  If it's there, you can remove `download_data.R` from your project folder (you can enter `rm download_data.R` into the terminal console).

#### Add the `plot_candy` function to the `halloween/R` directory
The function that we will add to this R package, `plot_candy`, will take in a data frame, the number of top candies to plot, and the names of the columns specifying the candy name and ranking, and will produce a barplot from `ggplot` with the top ranked candies.  The function is *already written* and can be found in the `R_package` directory of this repo!  While still in the "halloween" directory in your terminal, run the following code to download the code into a .R file:

```
curl https://raw.githubusercontent.com/benjamin-ackerman/R_products_tutorial/master/R_package/plot_candy.R > R/plot_candy.R
```

**Optional** If you would like to also get rid of the "hello.R" function, you can also do so from the command line by entering the following:

```
rm R/hello.R
rm man/hello.Rd
```

The script `plot_candy.R` should now be in the `R` directory of your project's folder.

#### Add documentation and build package!
Now that the R function and the data are added to the project, it's time to add documentation!  We will need to add two types of documentation:
1) Documentation for the `plot_candy` function (in the `man/` directory)
2) Documentation for the R package (in the "DESCRIPTION" file)

To add documentation to the `plot_candy` function, notice that in the beginning of the `plot_candy.R` script, there is a section of code where every line starts with `#'`.  This section of the code actually *contains* the documentation 
First, let's go into the project settings to allow for some 