install.packages("RCurl") ### you can only run this on your computer. Run it only once

### load SSL connections (https instead of http)
require(RCurl)
myCsv <- getURL("https://raw.githubusercontent.com/llorban/stats101/master/live_data/whyhatethegoodguy.csv")
data <- read.csv(textConnection(myCsv))

x=read.csv("")




names(x)           

t.test(x[x$Condition==1,]["MoralPun"],x[x$Condition==0,]["MoralPun"])

t.test(x[x$Condition==1,]["AntiSocPun"],x[x$Condition==0,]["AntiSocPun"])



x[x$Condition==1,]["MoralPun"]
