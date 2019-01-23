# r-: generate random spamels
# d-: density funcitons
# p-: cumulative density functions (probability mass functions)
# q-: quantiles

rnorm(n = 5, mean = 3, sd = 4)
dnorm(x = 3, mean = 3, sd = 4)
pnorm(q = 2, mean = 3, sd = 4)
qnorm(p = 0.5, mean = 3, sd = 4)

rpois(n = 5, lambda = 5)
dpois(x = 3, lambda = 5)
ppois(q = 5, lambda = 5)
qpois(p = 0.5, lambda = 5)

runif(5)
rexp(5)
rbinom(n = 5, size = 2, prob = 0.3)
# ...


## Simulation of the sample mean - CLT
x_bar = rep(0, 2000)
for(i in 1:2000){
  
  sp = rpois(n = 30, lambda = 5)
  x_bar[i] = mean(sp)
  
}
hist(x_bar, nclass = 30)

## order statistics: max{x1, x2, ..., x_n}

# True solution:
y = seq(160, 210, length.out = 200)
f_y = 60 * pnorm(y, mean = 174.9, sd = 7.39)^59 * dnorm(y, mean = 174.9, sd = 7.39)

# simulation:
x_max = rep(0, 5000)
for(i in 1:5000){
  
  sp = rnorm(60, mean = 174.9, sd = 7.39)
  x_max[i] = max(sp)
  
}
hist(x_max, nclass = 30, freq = F)
lines(y, f_y, col = "red")
