## Code 1.1 installing packages
install.packages("rmarkdown")

# Answer 1.1
#After installing the "rmarkdown" package, I have now the option to go to file menu -> New File -> R Markdown...

# load library "markdown"
library ("markdown")

## Code 1.2 Getting help
?sum

# Answer 1.2
# ...	   numeric or complex or logical vectors.
# na.rm	 logical. Should missing values (including NaN) be removed?

## Code 1.3 - Using Help
vector_example <- c(50:100)
vector_example
sd(vector_example)

# Answer 1.3
#> vector_example <- c(50:100)
#> vector_example
#[1]  50  51  52  53  54  55  56  57  58  59  60  61  62  63  64  65
#[17]  66  67  68  69  70  71  72  73  74  75  76  77  78  79  80  81
#[33]  82  83  84  85  86  87  88  89  90  91  92  93  94  95  96  97
#[49]  98  99 100
#> sd(vector_example)
#[1] 14.86607

## Code 2.1
a <- c("dog","cat","horse")
a[1]

# Answer 2.1
#> a[1]
#[1] "dog"

## Assignment 2.2
## Correct this code inside the ifelse function so that c will be assigned the value of TRUE if both a and b are equal to 5. Please ensure this test would work even if different values are assigned to a and b.
a <- 5
b <- 5
c <- ifelse(a ==  b,TRUE,FALSE)
c

# Answer 2.2

#> a <- 5
#> b <- 5
#> c <- ifelse(a ==  b,TRUE,FALSE)
#> c
#[1] TRUE

#> a <- 3
#> b <- 3
#> c <- ifelse(a ==  b,TRUE,FALSE)
#> c
#[1] TRUE

#> a <- 3
#> b <- 4
#> c <- ifelse(a ==  b,TRUE,FALSE)
#> c
#[1] FALSE

## 2.3 Fixing Syntax
example_matrix <- matrix(rexp(100, rate=.5), ncol=20)
normalize <- function (input_matrix) {
  t(t(input_matrix)/colSums(input_matrix))
  }
  normalized_matrix <- normalize(example_matrix)
  
## 2.4 Understanding Syntax
##Rewrite the normalize function from 2.3 so that it normalizes by rows instead of columns.
example_matrix <- matrix(rexp(100, rate=.5), ncol=20)
normalize_r <- function (input_matrix) {
    t(t(input_matrix)/rowSums(input_matrix))
  }
  normalized_matrix_r <- normalize_r(example_matrix)
  
## 2.5 Adding conditionals                            // need help
example_matrix <- matrix(rexp(100, rate=.5), ncol=20)
normalize_c <- function (input_matrix) {
  if (identical(input_matrix, normalized_matrix)) {
      print ("nothing to normalize")
    } else {
      normalized_matrix<- t(t(input_matrix)/colSums(input_matrix))
      print("matrix normalized")
    }
}
normalize_c (example_matrix)
normalize_c (normalized_matrix)

# Answer 2.5
#> normalize_c (example_matrix)
#[1] "matrix normalized"

#> normalize_c (normalized_matrix)
#[1] "nothing to normalize"

## 3 Assign  
# 3 ways to assign
assign ("z", c(10, 20))
x <- 10
y = 100
z[1]

rm(x)
mean (x = 1:10)
x

rm(y)
mean (y <- 1:10)
y

# Answer 3
#> mean (x = 1:10)
#[1] 5.5
#> x
#Error: object 'x' not found
#if the "=" operator is used within a function, 'x' is considered a parameter/argument, 'x' doesn't exist in the workspace, calling it, causes an error
# to correct it, it would have to be written as:
mean ({x = 1:10})
x

#> rm(y)
#> mean (y <- 1:10)
#[1] 5.5
#> y
#[1]  1  2  3  4  5  6  7  8  9 10
#using the "<-" operator y is declared in the workspace and is availabe after the function call

# Hadley-Wickham recommends the "<-" operator for assignment
# Code is easier to read using "<-" to assign variables and "=" withing functions to assign arguments
# The assign() function is "less functional" as you are returning a side-effect rather than the value that gets assigned. Also, it is supposed to be used with an environment.

## 4 For Loops and Apply
data(cars)
str(cars)
## Find the drive time for each car in the cars dataset. (Hint: Time = Distance/Speed)
time <- NULL
time <- cars$dist/cars$speed
round (time, digits = 2)

# Answer 4
#> time <- cars$dist/cars$speed
#> round (time, digits = 2)
#[1] 0.50 2.50 0.57 3.14 2.00 1.11 1.80 2.60 3.40 1.55 2.55 1.17 1.67
#[14] 2.00 2.33 2.00 2.62 2.62 3.54 1.86 2.57 4.29 5.71 1.33 1.73 3.60
#[27] 2.00 2.50 1.88 2.35 2.94 2.33 3.11 4.22 4.67 1.89 2.42 3.58 1.60
#[40] 2.40 2.60 2.80 3.20 3.00 2.35 2.92 3.83 3.88 5.00 3.40

## 4a. Do it wrong using For
time <- NULL
for (i in 1:50) {
  time[i] <- (cars$dist[i]/cars$speed[i])
  print (time[i])
}
round (time, digits = 2)

## 4b. Do it right using apply
#assigning the apply output to a vector time
str(cars)
time <- NULL
time <- apply(cars, 1, function(x) {x["dist"]/x["speed"]})
time

#adding the apply output to a time column of the dataframe
str(cars)
time <- NULL
cars$time <- apply(cars, 1, function(x) {x["dist"]/x["speed"]})
cars$time

# not quite right, left for reference
str(cars)
time <- NULL
time <- sapply(cars, function (x) cars$dist/cars$speed)
time
str(time)

## 5a. Scope Example
## If the below block of code were to be executed, what are the resulting values of a and b?
rm (a,b)
a <- c(3,6,2,3,6,4,1,7,6,3,9)
b <- 0.5
function_1 <- function(a,b){
  b <- lapply(a,function(x) x/b)
  b
  
}
a = b <- function_1(a,b)

str(a)
str(b)
# Answer 5a
#The function function_1 divides each element in a by the value of b (=0.5), returning b as a list of 11 values
#List of 11
#$ : num 6
#$ : num 12
#$ : num 4
#$ : num 6
#$ : num 12
#$ : num 8
#$ : num 2
#$ : num 14
#$ : num 12
#$ : num 6
#$ : num 18
#This list is then assigned to a, which then turns into the same list.

## 5b. Another Scoping Example
#If the below block of code were to be executed, what are the resulting values of a and b?

rm(a,b)
a <- c(3,6,2,3,6,4,1,7,6,3,9)
b <- 0.5
function_2 <- function(a,b){
  b <- lapply(a,function(x) x/b)
  b
}
function_2(a,b)
a
b

#Answer 5b
#> a
#[1] 3 6 2 3 6 4 1 7 6 3 9
#> b
#[1] 0.5
# Here, the values of a and b don't change.

## 5c. A Questions On Scope
#How does variable assignment within a function affect a variable that has already been previously assigned a value outside a function (look back to questions 5a and 5b)?
# Answer 5c
#Variable assignment within a function does not affect a variable that has already been previously assigned a value outside a function (2b).
#only if the variable is overwritten outside a function (e.g. with the results of a function), the values change (2a).

## Question 6
data(iris)
str(iris)

## 6a i. If/else and apply

test <- function(x) { # Defines some custom function
  if(as.numeric(x["Petal.Length"])/as.numeric(x["Petal.Width"]) >5) { 
    return(x["Sepal.Length"])
  } else { 
    NA 
  } 
} 
apply(iris, 1, test)

apply(iris, 1, function(x) { if (as.numeric(x["Petal.Length"])/as.numeric(x["Petal.Width"]) >5){ return(x["Sepal.Length"]) } else { NA } })

## 6a ii. ifelse instead of apply()

############ wrong solution, just left for reference ############
rm(sepal_length)
sepal_length <- NULL
for (i in  1:150){
  if(iris$Petal.Length[i]/iris$Petal.Width[i] >5){
    sepal_length <- c(sepal_length, iris$Sepal.Length[i])
  } else {
    
  }
}
sepal_length

########### correct solution:

# ?ifelse
# Example: ifelse(iris$Sepal.Length>1,1,0)
ifelse((iris$Petal.Length/iris$Petal.Width) >5, iris$Sepal.Length, NA)

## 6b. Switches

#Using switch, define a function that will return sepal dimensions (Length and width) for setosa flowers and return Petal demensions (Length and width) otherwise. Run this on iris and report your results.
?switch

## Method A using concatenate
switch_function <- function (x) {
  switch (x["Species"], 
          setosa = c(x["Sepal.Length"], x["Sepal.Width"]),
          versicolor = c(x["Petal.Length"], x["Petal.Width"]), 
          virginica = c(x["Petal.Length"],x["Petal.Width"]))
}
a<-apply(iris,1,switch_function)
a

## Method B using paste
switch_function <- function (x) {
  switch (x["Species"], 
          setosa = paste(x["Sepal.Length"], x["Sepal.Width"]),
          versicolor = paste(x["Petal.Length"], x["Petal.Width"]), 
          virginica = paste(x["Petal.Length"],x["Petal.Width"]))
}
b<-apply(iris,1,switch_function)
b

## Question 7
#How long did this problem set take to complete?

# Answer 7
# Probably 8 hours. The devil is in the detail.
