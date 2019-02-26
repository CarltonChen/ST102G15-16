# Quantiles
qt(p = 0.005, df = 22)
qt(p = 0.005, df = 120)
qnorm(0.005)

# Differences between normal and t under different n
nn = 10:500
d0 = qt(p = 0.005, df = nn) - qnorm(0.005)
plot(nn, d0, type = "l")
grid()

# Normal approximation of the binomial.
n = 425
phat = 370/425

x0 = 340:400
d0 = dbinom(x0, n, phat)
d1 = dnorm(x0, mean = n * phat, sd = sqrt(n * phat * (1 - phat)))
grid()

plot(x0, d0, type = "l")
lines(x0, d1, col = "red")
grid()

# Confidence Intervals of Chi-square.
n = 100
k1 = qchisq(0.05, df = n-1)
k2 = qchisq(0.95, df = n-1)
cover = U = L = rep(0, 200)

for(i in 1:200){
  
  sp = rnorm(n, mean = 0, sd = 10)
  s2 = var(sp)
  U[i] = (n-1)*s2/k1
  L[i] = (n-1)*s2/k2
  
  cover[i] = (L[i] < 100) & (U[i] > 100)
  
}

mean(cover)

plot(x = c(1, 200), y = range(U, L), type = "n")
abline(a = 100, b = 0)
for(i in 1:200){
  col0 = ifelse(cover[i] == TRUE, "blue", "red")
  segments(x0 = i, y0 = L[i], x1 = i, y1 = U[i], col = col0, lwd = 2)
}
