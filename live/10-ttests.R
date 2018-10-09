### import data
x=read.csv(url("http://llorban.net/psyc2300/levente_weight.csv"))


### Determining data quality & organize data
### What do we have here?
is.numeric(x$Date)
is.numeric(x$Weight)

### Encode date as a handy format
## Convert dates to "POSIXlt" format, which allows us to refer to year, 
## month and other elements of a date or time more easily
mydate=as.POSIXlt(x$Date)

### Because we encoded it as POSIXlt, we represent just the year in a handy format, 
## and add the weight data to it. 
yearweight=data.frame(year=mydate$year+1900,x$Weight)

### select just 2017 values
t2017 = yearweight[yearweight$year=="2017",]
t2016 = yearweight[yearweight$year=="2016",]
t2012 = yearweight[yearweight$year=="2012",]


### 3 dots allow you to send the na.rm argument

apply(t2017,2,mean,na.rm=TRUE)
apply(t2017,2,n,na.rm=TRUE)
apply(t2016,2,mean,na.rm=TRUE)
apply(t2012,2,mean,na.rm=TRUE)

### n
n = function(var,...){ length(var) }

### df
df = n-1

### mean
sum = sum(x)/n

### centered
cc=x-mean(x)

### ss
ss=sum(cc^2)
### variance
v=ss/df
### pooled variance
vp=ss1/df1 + ss2/df2
  
### se
se=sqrt(v1/n1 + v2/n2) ### assuming equal sample size
se=sqrt(vp/n1 + vp/n2) ### assuming unequal sample size

### t
t = m1-m2/se