pkgname <- "tidylda"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('tidylda')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("calc_prob_coherence")
### * calc_prob_coherence

flush(stderr()); flush(stdout())

### Name: calc_prob_coherence
### Title: Probabilistic coherence of topics
### Aliases: calc_prob_coherence

### ** Examples

# Load a pre-formatted dtm and topic model
data(nih_sample_dtm)

# fit a model
set.seed(12345)
model <- tidylda(
  data = nih_sample_dtm[1:20, ], k = 5,
  iterations = 100, burnin = 50
)

calc_prob_coherence(beta = model$beta, data = nih_sample_dtm, m = 5)



cleanEx()
nameEx("glance.tidylda")
### * glance.tidylda

flush(stderr()); flush(stdout())

### Name: glance.tidylda
### Title: Glance method for 'tidylda' objects
### Aliases: glance.tidylda

### ** Examples




cleanEx()
nameEx("posterior")
### * posterior

flush(stderr()); flush(stdout())

### Name: posterior
### Title: Draw from the marginal posteriors of a tidylda topic model
### Aliases: posterior posterior.tidylda generate.tidylda_posterior

### ** Examples




cleanEx()
nameEx("predict.tidylda")
### * predict.tidylda

flush(stderr()); flush(stdout())

### Name: predict.tidylda
### Title: Get predictions from a Latent Dirichlet Allocation model
### Aliases: predict.tidylda

### ** Examples




cleanEx()
nameEx("print.tidylda")
### * print.tidylda

flush(stderr()); flush(stdout())

### Name: print.tidylda
### Title: Print Method for tidylda
### Aliases: print.tidylda

### ** Examples




cleanEx()
nameEx("refit.tidylda")
### * refit.tidylda

flush(stderr()); flush(stdout())

### Name: refit.tidylda
### Title: Update a Latent Dirichlet Allocation topic model
### Aliases: refit.tidylda

### ** Examples




cleanEx()
nameEx("tidy.tidylda")
### * tidy.tidylda

flush(stderr()); flush(stdout())

### Name: tidy.tidylda
### Title: Tidy a matrix from a 'tidylda' topic model
### Aliases: tidy.tidylda tidy.matrix

### ** Examples




cleanEx()
nameEx("tidylda")
### * tidylda

flush(stderr()); flush(stdout())

### Name: tidylda
### Title: Fit a Latent Dirichlet Allocation topic model
### Aliases: tidylda

### ** Examples

# load some data
data(nih_sample_dtm)

# fit a model
set.seed(12345)
m <- tidylda(
  data = nih_sample_dtm[1:20, ], k = 5,
  iterations = 200, burnin = 175
)

str(m)

# predict on held-out documents using gibbs sampling "fold in"
p1 <- predict(m, nih_sample_dtm[21:100, ],
  method = "gibbs",
  iterations = 200, burnin = 175
)

# predict on held-out documents using the dot product method
p2 <- predict(m, nih_sample_dtm[21:100, ], method = "dot")

# compare the methods
barplot(rbind(p1[1, ], p2[1, ]), beside = TRUE, col = c("red", "blue"))



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
