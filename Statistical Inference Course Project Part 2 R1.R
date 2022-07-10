## Statistical Inference Course Project

## ## Part 2: Basic Inferential Data Analysis Instructions
## Analyze the ToothGrowth data in the R datasets package.
## The response is the length of odontoblasts (cells responsible for tooth growth) in 60 guinea pigs. 
## Each animal received one of three dose levels of vitamin C (0.5, 1, and 2 mg/day) 
## by one of two delivery methods, orange juice or ascorbic acid (a form of vitamin C and coded as VC).

## Load ggplot 2 and knitr
library(ggplot2)
library(knitr)

## 1. Load the ToothGrowth data and perform some basic exploratory data analyses
## Load the ToothGrowth Data
data("ToothGrowth")
head(ToothGrowth)
str(ToothGrowth)
summary(ToothGrowth)

ggplot(ToothGrowth, aes(x= as.factor(dose), y = len, fill = supp)) + 
  geom_bar(stat = "identity") + facet_grid(supp~.) + labs(x = "Dose (mg/day)", y = "tooth length", title = "The Effect of Vitamin C on Tooth Growth in Guinea Pigs")

ggplot(ToothGrowth, aes(x= dose, y = len, col = supp)) + 
  geom_point(stat = "identity") + geom_smooth(method = "lm") + labs(x = "Dose (mg/day)", y = "tooth length", title = "The Effect of Vitamin C on Tooth Growth in Guinea Pigs")


## 2. Provide a basic summary of the data.
summary(ToothGrowth)

## From the summary function, we can find out followings:
## - minimum length is 4.20. 
## - Median is 19.25
## - Mean length is 19.81
## - Maximum tooth growth is 33.90. 
## - Two delivery methods of the vitamin C are Orange Juice (OC) and As orbic Acid (VC)
## - Three amount of doses (0.5, 1.0, and 2.0) are given to 60 guinea pigs.
## As we can see from the bar charts above, the amount of daily dose of vitamin C makes an impact on the tooth growth. 
## In addition, at the same amount of dose, Orange Juice (OC) contributes to the higher increase of tooth growth than Ascorbic Acid (VC).
## On the other hand, the tooth growth with VC is larger than one with OC since the slope of VC is steeper than the slope of OJ.


## 3. Use confidence intervals and/or hypothesis tests to compare tooth growth by supp and dose. 
## (Only use the techniques from class, even if there's other approaches worth considering)
## Assumption: 
## - We assume that the dataset is normally distributed. 
## - The given sample size is small, T distribution is preferred. 

## 3.1. Tooth growth by supplements
## The null hypothesis is that there is no difference between the means in teeth growth after taking two types of vitamin C supplements. 
t.test(len ~ supp, data = ToothGrowth)

## By comparing the outcome of the t.test, estimate tooth growth by supplements, we fail to reject the null hypothesis. 
## because the p-value (0.06063) is bigger than the 0.05 significance level.

## 3.2. Tooth growth by doses of supplements
## The null hypothesis is that there is no difference between the means in teeth growth after administering different doses of vitamin C. 
## 3.2.1 Dose 0.5
t.test(len ~ supp, data = subset(ToothGrowth, dose == 0.5))
## By comparing the outcome of the t.test, we reject the null hypothesis because the p-value (0.006359) is smaller than the 0.05 significance level.

## 3.2.2 Dose 1.0
t.test(len ~ supp, data = subset(ToothGrowth, dose == 1.0))
## By comparing the outcome of the t.test, we reject the null hypothesis because the p-value (0.001038) is smaller than the 0.05 significance level.

## 3.2.3 Dose 2.0
t.test(len ~ supp, data = subset(ToothGrowth, dose == 2.0))
## By comparing the outcome of the t.test, we fail to reject the null hypothesis because the p-value (0.9639) is smaller than the 0.05 significance level.

## 4. State your conclusions and the assumptions needed for your conclusions.
## The conclusions are  
## - There is a difference in tooth growth at the dose of 0.5 mg/day and 1.0 mg/day after taking Orange Juice (OC) and Ascorbic Acid (VC).
## - However, there is no difference in tooth growth at the dose of 2.0 mg/day. 
## - We cannot say that one delivery method is more effective than the other. (OC is more effective than VC for tooth growth, or VC is more effective than OC.)

## Our assumption is that the whole population is normally distributed and the population under each dose is also normally distributed.

