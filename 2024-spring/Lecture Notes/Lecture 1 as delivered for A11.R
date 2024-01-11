##
## LECTURE 1
##

# To  make a new notebook
# Go to: File >> New File >> R Script

# This is your first notebook (R Script)
# hashtag sign means that I am writing remarks that are not to be computed
# 1 + 1

# Basic Operations
1+1
1-1
1*1
1/1
1^2

# To activate the code: 
# 1) Option one, select/highlight the code and click Run
# 2) Select/highlight the code, and press (Windows)Ctrl+Enter or (Mac)command+return

# Other operators
## double equal sign: asking is something equal to one another
1 == 1
2 == 1
1.0 == 1 #when I use a . it means 1.00 which decimal type data. if there is no period, than it assumed an integer

# explamation mark and an equal sign means "not equal to"
1 != 1
2 != 1

# greater than signs
2 > 1
2 < 1
-2 < 1

# Data types
# integers: int
# float point data / decimal data: numeric
# boolean: TRUE or FALSE
# text based data: character

is.integer(1)
is.numeric(1)
is.character(1)
is.character("1")

# Variable: is a container for a value that can change
# Constant: is a container for a value that doesn't change

## Different naming conventions for variables
stress.levels
stresslevels
StressLevels
stressLevels
stress_levels
stress9_levels

## a few naming schemes that don't work
_cantuse < 0
cantuse- = 0
4cantuse
cantuse&
cantuse%


# to assign a value, use the less than and dash symbols. In most programming languages, you would an equal
stress.levels <- 10

happiness.levels <- 1:10


# Functions
# functions are built-in operations that are defined within R

sum.happiness.levels <- sum(happiness.levels)
## manually
1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10


# Tips: 
# Watch the order in which you activate the code
# Don't accidentally overwrite a variable that matters to you


stress.levels2 <- 11
