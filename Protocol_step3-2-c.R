### Protocol step 3)2.c. - PC Visualization ###

# Before beginning, add the packages ‘ggplot2,’ ‘devtools,’ ‘ellipse,’ and ’roxygen2' to R.

library(ggplot2)
install.packages("devtools")
library(devtools)
install.packages("ellipse")
library(ellipse)
install.packages("roxygen")
library(roxygen2)

# Read in the data.

data <- read.table("PC_percents.txt", header=TRUE)

# Bar graph of the percent variance explained by each PC.

p <- ggplot(data, aes(x=factor(PC), y=Percent)) + geom_bar(stat="identity")
p + geom_bar()

# Visualize the covariates most modulating shape variance and to better understand the morphospace. It is helpful to have the file with PC scores and additional leaf information as detailed in the protocol step 3)2.b. in order to visualize aspects of the data in morphospace.

data <- read.table("PC_scores_info.txt", header=TRUE)

# In this example code, 'species,' a column of information included in the 'master spreadsheet,' is used to color the data. 95% confidence ellipses are added around species points using ‘stat_ellipse.’

p <- ggplot(data, aes(PC1, PC2, colour=species))
p + geom_point(size=2.5, alpha=0.75) + scale_colour_manual(values=c("purple4","green4"))+ theme_bw() + stat_ellipse(size=2, alpha=0.75)

# To investigate if some PCs are statistically more correlated with certain characteristics (such as species or genotype), test for correlations in the PC spaces using the nonparametric Spearman’s correlation test. P value designates significant correlations. In the below example, 'species' is used to test if there is a correlation with any PCs.

cor.test(PC1, species, method="spearman", data=data)
cor.test(PC2, species, method="spearman", data=data)
cor.test(PC3, position, method="spearman", data=data)
cor.test(PC4, position, method="spearman", data=data)

cor.test(data$PC1, data$species, method="spearman", data=data)
cor.test(data$PC2, data$species, method="spearman", data=data)
cor.test(data$PC3, data$species, method="spearman", data=data)
cor.test(data$PC4, data$species, method="spearman", data=data)

# A Kruskal-Wallis rank sum test can also be used to test ‘a priori’ assumptions.

kruskal.test(data$PC1~data$species)
kruskal.test(data$PC2~data$species)
kruskal.test(data$PC3~data$species)
kruskal.test(data$PC4~data$species)
