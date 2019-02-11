#R
library(readr)
anova <- read_csv("C:/Users/radhapavan/Desktop/Alex/anova.csv")
str(anova)
attach(anova)
av <- aov(deal_probability ~ parent_category_name)
summary(av)
print(av)

av2 <- oneway.test(deal_probability ~  parent_category_name, data=anova)
TukeyHSD(av)

library(car)
leveneTest(av)


############

analysis.anova <- read.csv("C:/Users/radhapavan/Desktop/Alex/anova.csv", sep=",", header = TRUE)
str(analysis.anova) # You should ge factor in Parent_category_name
is.factor(parent_category_name) # True
attach(analysis.anova)

levels(analysis.anova$parent_category_name)

library(dplyr)
group_by(analysis.anova, parent_category_name) %>%
  summarise(
    count = n(),
    mean = mean(deal_probability, na.rm = TRUE),
    sd = sd(deal_probability, na.rm = TRUE)
  )

## describe stas
summary(analysis.anova)

library(pastecs)
stat.desc(analysis.anova)
stat.desc(analysis.anova$deal_probability)

#boxplot
#las=2 vertical text label
boxplot(deal_probability~parent_category_name, main="Fig.-1: Boxplot of deal_probability of 9 Types of parent_category_name ", las=2,
col = c("red","sienna","palevioletred1","royalblue2","red","sienna","palevioletred1", "royalblue2","red","sienna","palevioletred1","royalblue2"), , par(mar = c(12, 5, 4, 2) + 0.1), ylab ="Deal Prob",  notch = TRUE,    varwidth = TRUE)

abline(h=0.6,col="red") # for line above


## issue with this
library(ggplot2)
ggplot(analysis.anova, aes(x=parent_category_name, y=deal_probability,  fill=parent_category_name)) + 
     geom_boxplot() + 
     theme(axis.text.x = element_text(angle = 90, vjust=0.5, hjust=1))





================

model1<- aov(deal_probability~parent_category_name)
print(model1)

summary(model1)

model2 <-  oneway.test(deal_probability~parent_category_name)
print(model2)

# Chisquare
model3 <- kruskal.test(deal_probability~parent_category_name)
print(model3)


pairwise.t.test(deal_probability,parent_category_name,
                 p.adjust.method = "BH", pool.sd = FALSE)
				 
#normality plot			 
plot(model1, 2)		

hist(deal_probability,xlab = "deal_probability",col = "yellow",border = "blue")

hist(deal_probability,xlab = "deal_probability",col = "yellow",border = "blue",xlim=c(0.1,1.0), ylim=c(0,50000))

hist(deal_probability,xlab = "deal_probability",col = "yellow",border = "blue",xlim=c(0.1,1.0), ylim=c(0,80000), breaks=18)

lines(density(deal_probability))



qplot(deal_probability, geom="histogram", binwidth = 10) 
qplot(deal_probability, geom="histogram",bins=10, xlim=c(0.2,1.0) fill=I("blue")) 
qplot(deal_probability, geom="histogram",bins=10, xlim=c(0.2,1.0), fill=I("blue"), alpha=I(.5)) 



ggplot(data=analysis.anova, aes(deal_probability)) + 
  geom_histogram()
  

  
		 
###
From the above results, it is observed that the F-statistic value is 17.94 and it is highly significant as the corresponding p-value is much less than the level of significance (1% or 0.01). Thus, it is wise to reject the null hypothesis of equal mean value of mileage run across all the tyre brands. In other words, the average mileage of the four tyre brands are not equal.

TukeyHSD(model1, conf.level = 0.99)

plot(TukeyHSD(model1, conf.level = 0.99),las=1, col = "red")


# mean plot
#Another way of visualization by plotting means of mileage of four brands of tyre with the help of gplots package. By using the plotmeans() function in the gplots package, you can create the mean plots for single factors including confidence intervals

library(gplots)
plotmeans(deal_probability~parent_category_name, main="Fig.-3: Mean Plot with 95% Confidence Interval", ylab = "Deal prob", xlab = "Brands of Category")

## save session
## save(file="d:/filename.RData")


par(mfrow=c(2,2))
plot(model1)

# Residuals
uhat<-resid(model1)
#where resid function extracts the model residual and it is saved as object ‘uhat’.

#Now you may apply the Shapiro-Wilk test for normality with the following hypotheses set-up:

shapiro.test(uhat)  # our sample size is big
###
As the p-value is higher than the level of significance, you cannot reject the null hypothesis, which implies that the samples are taken from the normal populations.
Ho: normal population, h1= non Normal population


# Barlett test, Levene test
Another assumption requirement is the homogeneity of variances across the groups, which can be statistically tested by Bartlett test and Levene test. In both the test, the null hypothesis is set as the homogeneity of variance across the cross-sectional group. The tests are conducted as follows:

bartlett.test(deal_probability~parent_category_name)

library(car)
levene.test(analysis.anova$deal_probability~analysis.anova$parent_category_name)


## chisq
chisq.test(analysis.anova$parent_category_name, analysis.anova$deal_probability)
#
#H0: The The two variables are independent
#H1: The two variables are related.

## The null hypothesis of the chi-squared test is that the two variables are independent and the alternate hypothesis is that they are related.
#  we reject the null hypothesis and conclude that the two variables are in fact dependent. Sweet!



