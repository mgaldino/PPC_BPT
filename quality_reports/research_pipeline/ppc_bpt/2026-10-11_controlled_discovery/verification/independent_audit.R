r <- 'quality_reports/research_pipeline/ppc_bpt/2026-10-11_controlled_discovery';o<-file.path(r,'results')
rates<-read.csv(file.path(o,'rejection_rates.csv'));paired<-read.csv(file.path(o,'paired_differences.csv'));pout<-read.csv(file.path(o,'evaluation_pvalues.csv'));laws<-read.csv(file.path(r,'data/joint_laws.csv'))
qnull<-sapply(c('SA','CA'),function(h)laws$prob[laws$condition=='null'&laws$H==h]);qF2<-sapply(c('SA','CA'),function(h)laws$prob[laws$condition=='F2'&laws$H==h])
state_n<-0L;pcheck_n<-0L;g2max<-0
for(n in c(24L,96L,384L)){
 a<-readRDS(file.path(o,paste0('audit_draws_N',n,'.rds')));B<-ncol(a$reference_A$counts);B2<-ncol(a$reference_B$counts)
 stopifnot(B==50000,B2==50000,all(colSums(a$reference_A$counts)==n),all(colSums(a$reference_B$counts)==n))
 for(nm in names(a$mapping)){stopifnot(max(abs(a$predicted[[nm]]-a$mapping[[nm]]%*%qnull))<1e-14)}
 t0<-a$families$T0;stopifnot(all(vapply(t0,function(nm)max(abs(a$mapping[[nm]]%*%(qF2-qnull)))<1e-12,logical(1))))
 cdfupper<-lapply(seq_len(ncol(a$reference_A$T)),function(j)ecdf(-a$reference_A$T[,j]));names(cdfupper)<-colnames(a$reference_A$T)
 pcomp<-function(T){ans<-T;for(nm in colnames(T))ans[,nm]<-(1+round(B*cdfupper[[nm]](-T[,nm])))/(B+1);ans}
 pb<-pcomp(a$reference_B$T);stopifnot(max(abs(pb-a$reference_B$component_p))<1e-12)
 sb<-sapply(a$families,function(nms)apply(pb[,nms,drop=FALSE],1,min));stopifnot(max(abs(sb-a$reference_B$scores))<1e-12)
 cdfscore<-lapply(as.data.frame(sb),ecdf)
 for(cond in names(a$evaluation)){
  ev<-a$evaluation[[cond]];m<-ncol(ev$counts);stopifnot(m==5000,all(colSums(ev$counts)==n))
  ix<-unique(as.integer(round(seq(1,m,length.out=300))))
  # Independently reconstruct deviance via multinomial PMFs, including coefficients.
  for(nm in names(a$mapping)){
   obs<-a$mapping[[nm]]%*%ev$counts[,ix,drop=FALSE];qh<-a$mapping[[nm]]%*%qnull
   independent<-apply(obs,2,function(y){sat<-dmultinom(y,prob=y/n,log=TRUE);lh<-c(log(.6)+dmultinom(y,prob=qh[,1],log=TRUE),log(.4)+dmultinom(y,prob=qh[,2],log=TRUE));2*(sat-(max(lh)+log(sum(exp(lh-max(lh))))))})
   dif<-max(abs(independent-ev$T[ix,nm]));g2max<-max(g2max,dif);stopifnot(dif<1e-9);state_n<-state_n+length(ix)
  }
  pp<-pcomp(ev$T);stopifnot(max(abs(pp-ev$component_p))<1e-12)
  ss<-sapply(a$families,function(nms)apply(pp[,nms,drop=FALSE],1,min));pg<-ss
  for(fam in colnames(ss))pg[,fam]<-(1+round(B2*cdfscore[[fam]](ss[,fam])))/(B2+1)
  pg<-cbind(pg,T0_Bonferroni=pmin(1,7*ss[,'T0']));stopifnot(max(abs(pg-ev$global_p))<1e-12,identical(unname(pg<=.05),unname(ev$reject)))
  pcheck_n<-pcheck_n+length(pg)
  rr<-rates[rates$N==n&rates$condition==cond,];ii<-match(colnames(pg),rr$family);stopifnot(all(colSums(pg<=.05)==rr$n_reject[ii]),max(abs(colMeans(pg<=.05)-rr$rate[ii]))<1e-14)
  oo<-pout[pout$N==n&pout$condition==cond,];oo<-oo[order(oo$dataset),];stopifnot(max(abs(as.matrix(oo[paste0('p_',colnames(pg))])-pg))<1e-12)
  pr<-paired[paired$N==n&paired$condition==cond,]
  for(j in seq_len(nrow(pr))){x<-pg[,pr$first[j]]<=.05;y<-pg[,pr$second[j]]<=.05;dd<-as.integer(x)-as.integer(y);stopifnot(abs(mean(dd)-pr$difference[j])<1e-12,abs(sd(dd)/sqrt(m)-pr$standard_error[j])<1e-12,sum(x&!y)==pr$n_first_only[j],sum(!x&y)==pr$n_second_only[j],sum(x&y)==pr$n_both[j],sum(!x&!y)==pr$n_neither[j])}
 }
 cat('N=',n,': complete p-values, rejection rates and paired differences independently verified.\n',sep='')
 rm(a);gc()
}
cat('Independent raw-deviance comparisons=',state_n,'; maximum absolute difference=',g2max,'; globalp/rejection comparisons=',pcheck_n,'\n',sep='')
cat('All requested final output checks PASSED. No files modified.\n')
