# Ex12 Q5

pchisq(q = 1.25, df = 1)
pchisq(q = 1.75, df = 3)
1 - pt(q = 2.920, df = 2)

# Ex12 Additional Q2
## Y ~ chisq_n, then V = (Y - n) / sqrt(2n) --> N(0, 1)

n=200
v = seq(-3, 3, length.out = 500)

# Cumulative Density functon:
## F_V(v) = F_Y( sqrt(2n) * v + n)
p1 = pchisq(q = sqrt(2*n) * v + n, df = n)
p2 = pnorm(v)

plot(x = v, y = p1, type = "l")
lines(x = v, y = p2, col = "blue")

# Density functon:
## f_V(v) = f_Y( sqrt(2n) * v + n) * sqrt(2n)
d1 = dchisq(x = sqrt(2*n) * v + n, df = n) * sqrt(2*n)
d2 = dnorm(v)

plot(x = v, y = d1, type = "l")
lines(x = v, y = d2, col = "blue")