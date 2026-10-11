# All numerical analysis is here, separate from the report.
# Frozen primary four-cell and secondary eight-cell PPCs. No model fitting to targets.
root <- "quality_reports/research_pipeline/ppc_bpt/2026-10-11_llm_novel_implications"
invisible(Sys.setlocale("LC_CTYPE","en_US.UTF-8"))
dir.create(file.path(root,"results"),showWarnings=FALSE)
dir.create(file.path(root,"figures"),showWarnings=FALSE)
write_out <- function(x,n) write.csv(x,file.path(root,"results",n),row.names=FALSE)
code <- read.csv(file.path(root,"data/coded_analysis.csv"),stringsAsFactors=FALSE)
llm <- subset(code,arm=="L")
missing_report <- data.frame(worlds=nrow(llm),unknown_shock=sum(llm$shock=="unknown"),
  unknown_internal=sum(llm$internal_support<0),unknown_public=sum(llm$public_support<0))
write_out(missing_report,"missingness.csv")
# Do not silently change the target by dropping ambiguous generated worlds.
# If an unknown appears, stop for an explicit, reported missingness analysis.
stopifnot(missing_report$unknown_shock==0L,missing_report$unknown_internal==0L,
          missing_report$unknown_public==0L)
bench <- read.csv(file.path(root,"data/benchmark.csv"),stringsAsFactors=FALSE)
cells <- function(x,k=8L) {
  s <- match(x$shock,c("regulatory","competitive"))-1L
  if(k==8L) out <- 1L+4L*s+2L*x$internal_support+x$public_support else
    out <- 1L+2L*s+x$internal_support
  out[is.na(s)|x$internal_support<0L|(k==8L & x$public_support<0L)] <- NA_integer_
  out
}
labels8 <- expand.grid(public_support=0:1,internal_support=0:1,
                       shock=c("regulatory","competitive"),stringsAsFactors=FALSE)
labels8$cell <- seq_len(8L)
oracle_q <- function(h,k=8L,p_public=.05) {
  r <- labels8
  intended <- if(h=="SA") as.integer(r$shock=="competitive") else
    as.integer(r$shock=="regulatory")
  q <- .5*ifelse(r$internal_support==intended,.95,.05)*
    ifelse(r$internal_support==r$public_support,1-p_public,p_public)
  if(k==4L) q <- as.numeric(rowsum(q,rep(seq_len(4L),each=2L)))
  q
}
counts_h <- function(k) sapply(c("SA","CA"),function(h)
  tabulate(cells(subset(llm,H==h),k),nbins=k))

# Enumerate every histogram, n=12; 455 for k=4 and 50,388 for k=8.
compositions <- function(n,k) {
  if(k==1L)return(matrix(n,nrow=1L))
  do.call(rbind,lapply(0:n,function(i)cbind(i,compositions(n-i,k-1L))))
}
prob_mult <- function(z,q) {
  v <- lgamma(rowSums(z)+1)-rowSums(lgamma(z+1))
  for(j in seq_along(q)) {
    if(q[j]==0) v[z[,j]>0] <- -Inf else v <- v+z[,j]*log(q[j])
  }
  exp(v)
}
prob_dm <- function(z,a) {
  exp(lgamma(rowSums(z)+1)-rowSums(lgamma(z+1))+
        lgamma(sum(a))-lgamma(sum(a)+rowSums(z))+
        rowSums(sweep(lgamma(sweep(z,2L,a,"+")),2L,lgamma(a),"-")))
}
make_predictive <- function(k,method) {
  z <- compositions(12L,k);nh <- counts_h(k)
  if(method=="oracle") pH <- sapply(c("SA","CA"),function(h)prob_mult(z,oracle_q(h,k))) else
    if(method=="empirical") pH <- sapply(seq_len(2L),function(j)prob_mult(z,nh[,j]/sum(nh[,j]))) else
      pH <- sapply(seq_len(2L),function(j)prob_dm(z,nh[,j]+.5))
  p <- .6*pH[,1L]+.4*pH[,2L]
  stopifnot(abs(sum(p)-1)<1e-9,all(abs(colSums(pH)-1)<1e-9))
  # Surprise T=-log predictive mass. Exact inclusive upper tail of T.
  o <- order(p);sorted <- p[o];cum <- cumsum(sorted)
  tailfun <- function(m) {
    idx <- findInterval(m*(1+1e-10)+1e-300,sorted)
    pmin(1,c(0,cum)[idx+1L])
  }
  list(z=z,p=p,pH=pH,tail=tailfun,lookup=setNames(seq_len(nrow(z)),apply(z,1L,paste,collapse=":")))
}
target_counts <- function(x,k) {
  groups <- split(x,x$dataset_id)
  m <- t(vapply(groups,function(d)tabulate(cells(d,k),nbins=k),integer(k)))
  stopifnot(all(rowSums(m)==12L))
  list(m=m,ids=rownames(m),condition=vapply(groups,function(d)d$condition[1L],character(1L)))
}
wilson <- function(x,n) {
  z <- qnorm(.975);p <- x/n;den <- 1+z*z/n
  center <- (p+z*z/(2*n))/den;half <- z*sqrt(p*(1-p)/n+z*z/(4*n*n))/den
  c(lower=center-half,upper=center+half)
}
target <- subset(bench,role=="benchmark")
all_scores <- list();rates <- list();examples <- list();checks <- list();ii <- 0L
exact_rates <- list()
for(k in c(4L,8L)) {
  tc <- target_counts(target,k)
  for(method in c("empirical","dirichlet","oracle")) {
    pr <- make_predictive(k,method)
    idx <- unname(pr$lookup[apply(tc$m,1L,paste,collapse=":")])
    pv <- pr$tail(pr$p[idx]);ii <- ii+1L
    sc <- data.frame(analysis=if(k==4L)"primary" else "secondary_audited",
                     method=method,dataset_id=tc$ids,condition=tc$condition,
                     predictive_mass=pr$p[idx],ppc=pv,reject=pv<=.05)
    all_scores[[ii]] <- sc
    rates[[ii]] <- do.call(rbind,lapply(split(sc,sc$condition),function(d) {
      x <- sum(d$reject);ci <- wilson(x,nrow(d))
      data.frame(analysis=d$analysis[1L],method=method,condition=d$condition[1L],
                 rejected=x,datasets=nrow(d),rate=x/nrow(d),lower=ci[1L],upper=ci[2L])
    }))
    checks[[ii]] <- data.frame(k=k,method=method,histograms=nrow(pr$z),
                              total_mass=sum(pr$p),self_rejection=sum(pr$p[pr$tail(pr$p)<=.05]))
    true_H <- sapply(c("SA","CA"),function(h)prob_mult(pr$z,oracle_q(h,k)))
    doc_H <- sapply(c("SA","CA"),function(h)prob_mult(pr$z,oracle_q(h,k,.80)))
    truth <- cbind(null=.6*true_H[,1]+.4*true_H[,2],
                   fault_mechanism=.4*true_H[,1]+.6*true_H[,2],
                   fault_documentation=.6*doc_H[,1]+.4*doc_H[,2])
    reject_region <- pr$tail(pr$p)<=.05
    exact_rates[[ii]] <- data.frame(analysis=sc$analysis[1L],method=method,
      condition=colnames(truth),exact_rate=colSums(truth[reject_region,,drop=FALSE]))
    # Worked examples: first dataset in each condition, fixed by ID, not extremeness.
    firsts <- which(grepl("_0001$",tc$ids))
    examples[[ii]] <- data.frame(analysis=sc$analysis[firsts],method=method,
      dataset_id=tc$ids[firsts],condition=tc$condition[firsts],
      histogram=apply(tc$m[firsts,,drop=FALSE],1L,paste,collapse=","),
      mass_SA=pr$pH[idx[firsts],1L],mass_CA=pr$pH[idx[firsts],2L],
      predictive_mass=pr$p[idx[firsts]],ppc=pv[firsts])
  }
}
scores <- do.call(rbind,all_scores);rates <- do.call(rbind,rates)
write_out(scores,"ppc_scores.csv");write_out(rates,"rejection_rates.csv")
write_out(do.call(rbind,checks),"exact_distribution_checks.csv")
write_out(do.call(rbind,examples),"worked_examples.csv")
write_out(do.call(rbind,exact_rates),"exact_operating_rates.csv")

# Attribution audit: a direct prompt-premise check, requiring no AI discovery.
# Added before target evaluation following the independent review, separately.
premise <- do.call(rbind,lapply(split(target,target$dataset_id),function(d) {
  discord <- sum(d$internal_support!=d$public_support)
  data.frame(dataset_id=d$dataset_id[1L],condition=d$condition[1L],discordances=discord,
    ppc=pbinom(discord-1L,size=12L,prob=.05,lower.tail=FALSE))
}))
write_out(premise,"explicit_premise_ppc.csv")
premise_rates <- do.call(rbind,lapply(split(premise,premise$condition),function(d) {
  x <- sum(d$ppc<=.05);ci <- wilson(x,nrow(d))
  data.frame(condition=d$condition[1L],rejected=x,datasets=nrow(d),rate=x/nrow(d),lower=ci[1L],upper=ci[2L])
}))
write_out(premise_rates,"explicit_premise_rates.csv")

# Actual textual examples, blind-coded before looking at oracle truth.
au <- subset(bench,role=="textual_audit")
ma <- match(au$blind_id,code$id)
stopifnot(!anyNA(ma))
audit <- data.frame(id=au$blind_id,condition=au$condition,
                   shock_true=au$shock,shock_code=code$shock[ma],
                   internal_true=au$internal_support,internal_code=code$internal_support[ma],
                   public_true=au$public_support,public_code=code$public_support[ma])
audit$correct <- with(audit,shock_true==shock_code & internal_true==internal_code & public_true==public_code)
write_out(audit,"coding_oracle_audit.csv")
au_c <- au;au_c$shock <- code$shock[ma];au_c$internal_support <- code$internal_support[ma];au_c$public_support <- code$public_support[ma]
textscores <- list();jj <- 0L
for(k in c(4L,8L))for(method in c("empirical","dirichlet","oracle")) {
  pr <- make_predictive(k,method);tc <- target_counts(au_c,k)
  idx <- unname(pr$lookup[apply(tc$m,1L,paste,collapse=":")]);jj <- jj+1L
  textscores[[jj]] <- data.frame(analysis=if(k==4)"primary" else "secondary_audited",method=method,
    dataset_id=tc$ids,condition=tc$condition,histogram=apply(tc$m,1L,paste,collapse=","),
    mass_SA=pr$pH[idx,1L],mass_CA=pr$pH[idx,2L],predictive_mass=pr$p[idx],ppc=pr$tail(pr$p[idx]))
}
write_out(do.call(rbind,textscores),"textual_ppc.csv")

# Sampling fidelity versus the known synthetic mechanism; not historical validation.
llm$intended <- with(llm,ifelse(H=="SA",as.integer(shock=="competitive"),as.integer(shock=="regulatory")))
llm$behavior_error <- as.integer(llm$internal_support!=llm$intended)
llm$public_error <- as.integer(llm$public_support!=llm$internal_support)
batchrates <- aggregate(cbind(behavior_error,public_error)~H+batch,data=llm,FUN=mean)
write_out(batchrates,"batch_fidelity.csv")
fidelity <- do.call(rbind,lapply(split(llm,llm$H),function(d) {
  n <- nrow(d);beh <- sum(d$behavior_error);pub <- sum(d$public_error)
  q <- tabulate(cells(d),nbins=8L)/n
  data.frame(H=d$H[1L],worlds=n,regulatory_shocks=sum(d$shock=="regulatory"),
    behavior_errors=beh,public_errors=pub,behavior_rate=beh/n,public_error_rate=pub/n,
    iid_behavior_p=binom.test(beh,n,.05)$p.value,iid_public_p=binom.test(pub,n,.05)$p.value,
    joint_TV=.5*sum(abs(q-oracle_q(d$H[1L]))))
}))
write_out(fidelity,"sampling_fidelity.csv")
kernel <- do.call(rbind,lapply(c("SA","CA"),function(h) {
  d <- subset(llm,H==h);q <- tabulate(cells(d),nbins=8L)
  data.frame(H=h,labels8,count=q,empirical=q/sum(q),oracle=oracle_q(h))
}))
write_out(kernel,"joint_kernel.csv")
conditional <- do.call(rbind,lapply(split(llm,list(llm$H,llm$shock),drop=TRUE),function(d)
  data.frame(H=d$H[1L],shock=d$shock[1L],worlds=nrow(d),internal_withdrawal=mean(1-d$internal_support),public_withdrawal=mean(1-d$public_support))))
write_out(conditional,"conditional_implications.csv")

# Batch bootstrap describes sensitivity to the eight calls per H, not iid worlds.
set.seed(2026101123L)
boots <- do.call(rbind,lapply(c("SA","CA"),function(h) {
  d <- subset(llm,H==h);bybatch <- split(d,d$batch)
  vals <- replicate(2000L,{
    x <- do.call(rbind,bybatch[sample(seq_along(bybatch),length(bybatch),replace=TRUE)])
    c(behavior=mean(x$behavior_error),public=mean(x$public_error),
      TV=.5*sum(abs(tabulate(cells(x),nbins=8L)/nrow(x)-oracle_q(h))))
  })
  data.frame(H=h,metric=rownames(vals),lower=apply(vals,1L,quantile,.025),upper=apply(vals,1L,quantile,.975))
}))
write_out(boots,"batch_bootstrap.csv")

# Exploratory fidelity diagnostics at the actual call level. This is a reference
# probability of the observed event under the requested iid sampler, not a
# preregistered multiplicity-adjusted p-value.
write_out(data.frame(worlds=nrow(llm),public_errors=sum(llm$public_error),
  expected_public_errors=.05*nrow(llm),iid_binomial_p=binom.test(sum(llm$public_error),nrow(llm),.05)$p.value,
  calls=nrow(batchrates),calls_with_exactly_one_error=sum(batchrates$public_error==1/8),
  reference_probability_all_calls_exactly_one=dbinom(1,8,.05)^16),"call_pattern.csv")

# All completions of the three channels inferred solely from a closed-world
# design rule; plus exclusion. Other codes, decisions, targets and checks fixed.
original_llm <- llm
amb <- which(llm$shock_basis=="design_inference")
stopifnot(length(amb)==3L)
choices <- expand.grid(rep(list(c("regulatory","competitive")),length(amb)),stringsAsFactors=FALSE)
sens <- list();si <- 0L
for(mode in seq_len(nrow(choices)+1L)) {
  llm <- original_llm
  if(mode<=nrow(choices)) llm$shock[amb] <- as.character(choices[mode,]) else llm <- llm[-amb,]
  for(k in c(4L,8L)) {
    pr <- make_predictive(k,"empirical");tc <- target_counts(target,k)
    idx <- unname(pr$lookup[apply(tc$m,1L,paste,collapse=":")]);pv <- pr$tail(pr$p[idx])
    si <- si+1L
    sens[[si]] <- do.call(rbind,lapply(unique(tc$condition),function(cc)data.frame(
      mode=if(mode<=nrow(choices))paste0("completion_",mode) else "exclude_design_inferences",
      k=k,condition=cc,worlds=nrow(llm),rejection_rate=mean(pv[tc$condition==cc]<=.05))))
  }
}
llm <- original_llm
write_out(do.call(rbind,sens),"measurement_sensitivity.csv")

# Exact agreement of C+ template-derived states with L states.
templ <- read.csv(file.path(root,"data/templates_analysis_decoded.csv"),stringsAsFactors=FALSE)
ix <- match(templ$source_id,llm$id)
agreement <- with(templ,shock==llm$shock[ix] & internal_support==llm$internal_support[ix] & public_support==llm$public_support[ix])
stopifnot(all(agreement),nrow(templ)==128L,nrow(llm)==128L)
write_out(data.frame(worlds=nrow(templ),state_matches=sum(agreement),primary_kernel_identical=TRUE,secondary_kernel_identical=TRUE),"template_equivalence.csv")

# Plot conditional rejection rates, not posterior probabilities of a hypothesis.
pdf(file.path(root,"figures/diagnostic_rates.pdf"),width=8,height=4.7,family="Helvetica")
par(mfrow=c(1,2),mar=c(4.6,4.4,2.8,1))
for(a in c("primary","secondary_audited")) {
  d <- subset(rates,analysis==a)
  cond <- c("null","fault_mechanism","fault_documentation")
  methods <- c("empirical","dirichlet","oracle")
  # Explicit keyed extraction avoids relying on row ordering.
  m <- sapply(cond,function(cc)vapply(methods,function(mm)d$rate[d$condition==cc & d$method==mm],numeric(1L)))
  bp <- barplot(m,beside=TRUE,col=c("#1C5D99","#E6A23C","#5C7A45"),ylim=c(0,1),
    names.arg=c("Nulo","Troca SA/CA","Falha documental"),cex.names=.75,
    ylab="Proporção com PPC <= 0,05",main=if(a=="primary")"Seleção automática: 1 check" else "Após auditoria: 2 checks")
  abline(h=.05,lty=2,col="gray40")
  if(a=="primary")legend("topleft",legend=c("Kernel IA (L = C+)","Sensibilidade Dirichlet","Oráculo conhecido"),fill=c("#1C5D99","#E6A23C","#5C7A45"),bty="n",cex=.75)
}
dev.off()
cat("Analysis complete. Exact histogram masses, empirical/Dirichlet/oracle comparisons, coding and template audits saved.\n")
