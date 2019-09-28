#Name: Daniyal Arshad
#Date: 30th January 2019



download.file("http://www.openintro.org/stat/data/ames.RData", destfile = "ames.RData")
load("ames.RData")


#1
living_area = ames$Gr.Liv.Area
mean_value = mean(living_area)
mean_value
# 1499.69


#2
sample_living_area = sample(living_area, size = 50, replace = FALSE)
sample_mean = mean(sample_living_area)
sample_mean
#1510.74
#mean of sample is different from the mean of whole population. 

#3
par(mfrow = c(2,1))
area.xlim = range(living_area)
area.xlim
# lowest: 334, Highest: 5642

#4
hist(living_area, xlim = area.xlim)
abline(v = sample_mean, col = 'red', lwd = 3)
#plots historgram with sample mean as the red line

#5
hist(sample_living_area, xlim = area.xlim)
abline(v = sample_mean, col = 'red', lwd = 3)
# Left skewed so different to actual plot


#6
new_sample = sample(living_area, size = 10, replace = FALSE)
new_mean = mean(new_sample)
area.means.10 = replicate(5000, {new_sample = sample(living_area, size = 10, replace = FALSE); new_mean = mean(new_sample)})
hist(area.means.10)
#shape of histogram is equally balanced.

#7
sample_two = sample(living_area, size = 50, replace = FALSE)
mean_two = mean(sample_two)
area.means.50 = replicate(5000, {sample_two = sample(living_area, size = 50, replace = FALSE);new_mean = mean(sample_two)})
area.means.50

#[1] 1447.70 1420.46 1479.24 1697.82 1674.04 1453.80 1582.08
#[8] 1401.36 1494.40 1440.44 1492.64 1537.98 1493.92 1434.64
#  ........

sample_three = sample(living_area, size = 100, replace = FALSE)
mean_three = mean(sample_three)
area.means.100 = replicate(5000, {sample_three = sample(living_area, size = 100, replace = FALSE);new_mean = mean(sample_three) })
area.means.100


#[1] 1506.59 1495.87 1571.39 1540.58 1547.48 1464.64 1471.48
#[8] 1590.28 1485.51 1483.93 1536.22 1397.32 1535.69 1410.96




#8
par(mfrow = c(3,1))
area.means.10.xlim = range(area.means.10)
area.means.10.xlim
# Ranges: 928.5, 2219.0



#9
hist(area.means.10, breaks = 20, xlim = area.means.10.xlim)
hist(area.means.50, breaks = 20, xlim = area.means.10.xlim)
hist(area.means.100, breaks = 20, xlim = area.means.10.xlim)
#Hist with sample choice of 100 is the the one with the largest data, the data representated supports our choice because we have more data to work with


#10
sample_four = sample(living_area, size =1, replace = FALSE)
mean_four = mean(sample_four)
area.means.1 = replicate(5000, {sample_four = sample(living_area, size =1, replace = FALSE); mean_four = mean(sample_four)})
hist(area.means.1, breaks = 20, xlim = area.means.10.xlim)


sample_five = sample(living_area, size = 2930, replace = FALSE)
mean_five = mean(sample_five)
area.means.2930 = replicate(5000, {sample_five= sample(living_area, size = 2930, replace =  FALSE); mean_five = mean(sample_five)})
hist(area.means.2930, breaks= 20, xlim = area.means.10.xlim)

#sample four gives different means compared to sample five
