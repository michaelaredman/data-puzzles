# F(18*60, mean=time, sd=10)^4 = 0.99
# by symmetry we want (1 - pnorm(time, 18*60, 10))^4 = 0.99

1 - 0.01^(1/4) = pnorm(time, 18*60, 10)

give.the.time <- qnorm(1 - 0.99^(1/4), 18*60, 10)
floor(give.the.time / 60) - 12
give.the.time %% 60

pnorm(18*60, give.the.time, 10)^4

