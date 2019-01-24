## Lecture 4

## How to install a package on a KPU PC
setwd("C://Users/lorban/My Documents")  ## lorban is my username. Replace it with yours instead
install.packages("lsr","C://Users/lorban/My Documents/R/win-library/3.5") ## again use your own user name
## When you run the code above, R may prompt to about using your own personal library, click yes
## Load the library
library(lsr)


# We'll do our best to get away without add-on packages in this class. A lot can be accomplished. 
# If you'd like to try out packages, I would suggest ggplot2


# Scatterplots

plot(
  main = "title of graph",
  sub = "subtitle of graph",
  xlab = "x-axis label",
  ylab = "y-axis label"
)


## other arguments
# Font styles: font.main, font.sub, font.lab, font.axis (1: plain, 2: bold, 3: italic)
# Font colours: col.main, col.sub, col.lab, col.axis
# Font size: cex.main, cex.sub, cex.lab, cex.axis
# Font family: family

## Plot types: 

• type = "o". Draw the line over the top of the points.
• type = "b". Draw both points and lines, but don’t overplot.
• type = "h". Draw “histogram-like” vertical bars.
• type = "s". Draw a staircase, going horizontally then vertically.
• type = "S". Draw a Staircase, going vertically then horizontally.
• type = "c". Draw only the connecting lines from the “b” version. • type = "n". Draw nothing. (Apparently this is useful sometimes?)



# Histograms

hist()

# Boxplots

boxplot()