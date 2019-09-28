#Name: Daniyal Arshad
#Date: 30th January 2019



download.file("http://www.openintro.org/stat/data/ames.RData", destfile = "ames.RData")
load("ames.RData")


#1
sample_size <- sample(ames$Gr.Liv.Area, size = 60, replace = FALSE)
sample_mean <- mean(sample_size)
#1516.95


#2
sample_se <- sd(sample_size)/ sqrt(60)
#47.16373


#3
confidence_lvl_upper <-sample_mean + (1.96 * sample_se)
confidence_lvl_lower <-sample_mean - (1.96 * sample_se)

vec_lvl <- c(confidence_lvl_lower, confidence_lvl_upper)
vec_lvl
# 1424.509 1609.391


#4
pop_mean<- mean(ames$Gr.Liv.Area)
pop_mean
#1499.69
#Falls within confidence intervals



#5
sample_repli <- replicate(50, {
  sample_size <- sample(ames$Gr.Liv.Area, size = 60, replace = FALSE)
  sample_mean <- mean(sample_size)
  temp_se_lvl <- sd(sample_size)/ sqrt(60)
  temp_se_lw = sample_mean - 1.96 * temp_se_lvl
  temp_se_hg = sample_mean + 1.96 * temp_se_lvl
  vec_lvl <-  c(temp_se_lw, temp_se_hg)
})
dim(sample_repli)

#Matrix is of correct dimensions


#6
lower.bounds <- sample_repli[1,]
upper.bounds <- sample_repli[2,]

lower.bounds
#[1] 1388.878 1318.315 1410.426 1330.948 1307.974 1377.862 1439.039 1437.901 1294.369 1422.701
#[11] 1283.552 1340.029 1357.201 1314.835 1386.135 1439.103 1414.776 1271.348 1361.394 1360.819

upper.bounds
#[1] 1645.188 1521.185 1704.141 1590.985 1513.626 1615.771 1699.961 1740.466 1518.731 1804.832
#[11] 1486.281 1639.538 1580.433 1553.199 1718.999 1668.264 1660.624 1513.585 1666.106 1581.847



#7
plot_ci(lower.bounds, upper.bounds, pop_mean)
#Two confidence intervals do not contain the population mean, this matches my expectations because of the previous question. 


#8
new_level = qnorm(1 - (1 - .93)/2)
new_level
#1.811911

#9
sample_rep2 <- replicate(50, {
  sample_size <- sample(ames$Gr.Liv.Area, size = 60, replace = FALSE)
  sample_mean <- mean(sample_size)
  temp_se_lvl <- sd(sample_size)/ sqrt(60)
  temp_se_lw = sample_mean - new_level * temp_se_lvl
  temp_se_hg = sample_mean + new_level * temp_se_lvl
  vec_lvl <-  c(temp_se_lw, temp_se_hg)
})

low.bounds <- sample_rep2[1,]
up.bounds <- sample_rep2[2,]
plot_ci(low.bounds, up.bounds, sample_mean)

#10
# 13 confidence intervals that did not contain the population mean. This does not match my expectations as I was expecting a lower result. 
