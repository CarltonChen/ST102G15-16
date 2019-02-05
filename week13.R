n = 20
lambda = 2
exp_lam = exp(lambda)

mme = rep(0, 50000)
e_xbar = rep(0, 50000)

for (i in 1:50000) {
  sp = rpois(n = n, lambda = lambda)
  mme[i] = ((n + 1) / n) ^ (sum(sp))
  e_xbar[i] = exp(mean(sp))
}


mean(mme - exp_lam)
mean(e_xbar - exp_lam)

var(mme)
var(e_xbar)

hist(mme, nclass = 30, freq = F)
lines(density(mme, bw = 0.4), col = "red")
lines(density(e_xbar, bw = 0.4))
