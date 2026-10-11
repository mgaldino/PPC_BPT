# Exact sensitivity and independent check of the iid finite-sample benchmark.
arg <- grep('^--file=', commandArgs(), value=TRUE)
root <- dirname(dirname(normalizePath(sub('^--file=', '', arg))))
grid <- expand.grid(baseline=c(0, .1, .2), dominant=c(.3, .6, .8), minor=.1)
grid <- grid[grid$baseline+grid$dominant+grid$minor <= 1+1e-12, ]
grid$likelihood_SA <- .5*(grid$baseline+grid$dominant+.5*grid$minor)
grid$likelihood_CA <- .5*(grid$baseline+grid$minor+.5*grid$dominant)
grid$posterior_SA <- grid$likelihood_SA/(grid$likelihood_SA+grid$likelihood_CA)
grid$ppc_joint <- with(grid, posterior_SA*likelihood_SA+(1-posterior_SA)*likelihood_CA)
write.csv(grid,file.path(root,'results/sensitivity.csv'),row.names=FALSE)
# Enumerate independent binomial counts. This checks the multinomial simulation
# without sharing its sampler or implementation. It is NOT a p-value for the LLM.
counts <- expand.grid(sa=0:32,ca=0:32)
counts$mass <- dbinom(counts$sa,32,.375)*dbinom(counts$ca,32,.25)
counts$value <- (.6*counts$sa+.4*counts$ca)/32
stopifnot(abs(sum(counts$mass)-1)<1e-12)
ord <- order(counts$value)
quant <- function(p) counts$value[ord][which(cumsum(counts$mass[ord])>=p)[1]]
exact <- data.frame(mean=sum(counts$value*counts$mass),
   sd=sqrt(sum((counts$value-.325)^2*counts$mass)),
   q025=quant(.025),q975=quant(.975),
   fraction_abs_error_ge_A=sum(counts$mass[abs(counts$value-.325)>=abs(.39375-.325)-1e-12]))
mc <- read.csv(file.path(root,'results/iid_benchmark.csv'))
mc <- mc[mc$metric=='ppc_joint_fixed_weights',]
stopifnot(abs(exact$mean-mc$iid_mean)<.001,
          abs(exact$sd-mc$iid_sd)<.001,
          abs(exact$fraction_abs_error_ge_A-mc$iid_fraction_abs_error_ge_A)<.005)
write.csv(exact,file.path(root,'results/iid_exact_verification.csv'),row.names=FALSE)
print(exact)
print(grid)
