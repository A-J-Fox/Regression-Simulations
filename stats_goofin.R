a <- rnorm(10000, 0, 1)
b <- rnorm(10000, 0, 1)
c <- rnorm(10000, 0, 1)
d <- rnorm(10000, 0, 1)
e <- rnorm(10000, 0, 1)
f <- rnorm(10000, 0, 1)
g <- rnorm(10000, 0, 1)
h <- rnorm(10000, 0, 1)

chi_df1 <- a^2
hist(chi_df1)
dense <- density(chi_df1)
plot(dense)
# mean should be the degrees of freedom
mean(chi_df1)
# var should be 2*df
var(chi_df1)

chi_df4 <- a^2+b^2+c^2+d^2
hist(chi_df4)
dense2 <- density(chi_df4)
plot(dense2)
mean(chi_df4)
var(chi_df4)

chi_df8 <- chi_df4 + e^2+f^2+g^2+h^2
mean(chi_df8)
var(chi_df8)
hist(chi_df8)
dense3 <- density(chi_df8)
plot(dense3)

#consistency of sample mean
set.seed(101)
a1 <- rnorm(10, 0, 1)
a12 <- rnorm(50, 0, 1)
a2 <- rnorm(100, 0, 1)
a22 <- rnorm(500, 0, 1)
a3 <- rnorm(1000, 0, 1)
a32 <- rnorm(5000, 0, 1)
a4 <- rnorm(10000, 0, 1)
means <- c(mean(a1), mean(a12), mean(a2), mean(a22), mean(a3), mean(a32), mean(a4))
means
plot(means)

#unbiasedness of sample mean
half_means <- c(mean(a), mean(b), mean(c), mean(d))
unbias1 <- density(half_means)
plot(unbias1)
all_means <- c(mean(a), mean(b), mean(c), mean(d), mean(e), mean(f), mean(g), mean(h))
unbias <- density(all_means)
plot(unbias)

# some Chi-sq
curve(dchisq(x, df = 1), from = 0, to = 50)
curve(dchisq(x, df = 5), from = 0, to = 50)
curve(dchisq(x, df = 10), from = 0, to = 50)
curve(dchisq(x, df = 20), from = 0, to = 50)
curve(dchisq(x, df = 100), from = 0, to = 200)

# area under chisa
# for area under the right tail, greater than 4, and df 1 P(x>4)
pchisq(4, 1)
# for the left P(x<4)
pchisq(4, 1, lower.tail=FALSE)
# or equivalently
1-pchisq(4, 1)