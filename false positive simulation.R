data.frame(x <- replicate(100, rnorm(100)))
means <- apply(x, 2, mean)
hist(means)
test <- apply(x, 2, t.test)
pvals <- sapply(test, '[[', 'p.value')
hist(pvals)
sigs <- pvals[pvals<=.05]

pvals2 <- replicate(1000, t.test(rnorm(100))$p.value)
sigs2 <- pvals2[pvals2<=.05]
length(sigs2)/length(pvals2)