root <- 'quality_reports/research_pipeline/ppc_bpt/2026-10-11_controlled_discovery'
options(digits=17)
states <- expand.grid(P=0:1,M=0:1,A=0:1,S=0:1)[,c('S','A','M','P')]
states$state_id <- 0:15
write.csv(states,file.path(root,'data/states.csv'),row.names=FALSE)
ee <- expand.grid(W=0:1,V=0:1,U=0:1)[,c('U','V','W')]
ee$null <- apply(ee,1,function(z)prod(.2^z*.8^(1-z)))
ee$F1 <- .5*ee$null+.5*(.2^ee$U*.8^(1-ee$U))*ifelse(ee$V==ee$W,.2^ee$V*.8^(1-ee$V),0)
ee$F2 <- ee$null-.03*(-1)^rowSums(ee[,1:3])
ee$F2_weak <- .75*ee$null+.25*ee$F2
stopifnot(min(as.matrix(ee[,4:7]))>0, max(abs(colSums(ee[,4:7])-1))<1e-14)
write.csv(ee,file.path(root,'data/error_laws.csv'),row.names=FALSE)
qq <- list()
for (cond in names(ee)[4:7]) for(h in 0:1) {
  u <- (states$S+states$A+h)%%2; v<-(states$A+states$M)%%2; w<-(states$M+states$P)%%2
  ix <- 1+4*u+2*v+w
  qq[[length(qq)+1]] <- data.frame(condition=cond,H=if(h==0)'SA' else 'CA',states,prob=.5*ee[[cond]][ix])
}
q<-do.call(rbind,qq); write.csv(q,file.path(root,'data/joint_laws.csv'),row.names=FALSE)
set.seed(2026101131)
draws <- data.frame(id=sprintf('D%02d',1:24),call=rep(sprintf('discovery_%02d',1:6),each=4),H=rep(rep(c('SA','CA'),each=3),each=4),matrix(runif(24*4),ncol=4))
names(draws)[4:7]<-c('uS','uA','uM','uP')
write.csv(draws,file.path(root,'data/controlled_draws.csv'),row.names=FALSE)
truth<-draws
truth$S<-as.integer(truth$uS<.5)
truth$U<-as.integer(truth$uA<.2);truth$V<-as.integer(truth$uM<.2);truth$W<-as.integer(truth$uP<.2)
truth$A<-(truth$S+as.integer(truth$H=='CA')+truth$U)%%2
truth$M<-(truth$A+truth$V)%%2;truth$P<-(truth$M+truth$W)%%2
write.csv(truth,file.path(root,'data/controlled_truth.csv'),row.names=FALSE)
message('Prepared 16 observable states, four laws, and 24 controlled generation inputs.')
