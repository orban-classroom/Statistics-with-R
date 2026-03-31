

df1 <- read.csv("/Users/llorban/Downloads/adolescent_weight_study/baseline_assessment.csv")
df2 <- read.csv("/Users/llorban/Downloads/adolescent_weight_study/5_months_assessment.csv")


df3 <- data.frame(
  group = df1$group,
  code = df1$code,
  baselineBMI = df1$BMI,
  month5followup = df2$BMI
)

write.csv(df3, "~/Downloads/repeatedsamples.csv")
df4 <- read.csv("/Users/llorban/Downloads/adolescent_weight_study/repeatedsamples.csv")
