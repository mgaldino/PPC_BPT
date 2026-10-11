root <- 'quality_reports/research_pipeline/ppc_bpt/2026-10-11_controlled_discovery'
options(digits=17)
invisible(Sys.setlocale('LC_CTYPE','en_US.UTF-8'))
x <- readRDS(file.path(root,'results/audit_draws_N96.rds'))
e <- x$evaluation$F2
s <- read.csv(file.path(root,'data/states.csv'))
# First generated F2 data set: no selection on a test result.
s$count <- e$counts[,1]
write.csv(s,file.path(root,'results/first_F2_counts.csv'),row.names=FALSE)
write.csv(data.frame(family=colnames(e$global_p),p=e$global_p[1,]),file.path(root,'results/first_F2_family_checks.csv'),row.names=FALSE)
write.csv(data.frame(check=colnames(e$T),T=e$T[1,],p=e$component_p[1,]),file.path(root,'results/first_F2_components.csv'),row.names=FALSE)
rows<-lapply(names(x$mapping),function(nm) {
  g<-x$mapping[[nm]];z<-as.vector(g%*%s$count);q<-x$predicted[[nm]]
  data.frame(check=nm,category=as.integer(rownames(q)),count=z,q_SA=q[,1],q_CA=q[,2])
})
write.csv(do.call(rbind,rows),file.path(root,'results/first_F2_categories.csv'),row.names=FALSE)
# Complete synthetic documentary record for all 96 episodes, in state order.
expand<-s[rep(seq_len(nrow(s)),s$count),c('S','A','M','P')]
expand$id<-sprintf('FIRST_F2_%03d',seq_len(nrow(expand)))
stance<-function(z) ifelse(z==1,'apoia a proposta','retira o apoio à proposta')
expand$notice<-ifelse(expand$S==0,'SINTÉTICO. O benefício regulatório caiu de 12 para 2; o benefício competitivo permaneceu em 12.','SINTÉTICO. O benefício competitivo caiu de 12 para 2; o benefício regulatório permaneceu em 12.')
expand$decision_record<-paste('SINTÉTICO. O registro direto da decisão informa: a coalizão',stance(expand$A))
expand$memo<-paste('SINTÉTICO. O memorando do dia seguinte registra: a coalizão',stance(expand$M))
expand$public_note<-paste('SINTÉTICO. O anúncio público do dia subsequente declara: a coalizão',stance(expand$P))
write.csv(expand,file.path(root,'results/first_F2_documents.csv'),row.names=FALSE,fileEncoding='UTF-8')
# A complete binary predictive mass example for the frozen new endpoint check.
k<-sum(s$count*(s$S!=s$P));n<-sum(s$count)
mass<- .6*dbinom(k,n,.392)+.4*dbinom(k,n,.608)
write.csv(data.frame(n=n,k=k,p_SA=.392,p_CA=.608,mass=mass,
 component_p=e$component_p[1,'IA_discovery_03_C2'],global_TIA=e$global_p[1,'TIA']),
 file.path(root,'results/first_F2_endpoint.csv'),row.names=FALSE)
u<-(s$S+s$A)%%2;v<-(s$A+s$M)%%2;w<-(s$M+s$P)%%2
resid<-expand.grid(W=0:1,V=0:1,Ustar=0:1)[,c('Ustar','V','W')]
resid$count<-sapply(0:7,function(i)sum(s$count[4*u+2*v+w==i]))
resid$q_SA<-apply(resid[,1:3],1,function(z)prod(.2^z*.8^(1-z)))
resid$q_CA<-apply(resid[,1:3],1,function(z){z[1]<-1-z[1];prod(.2^z*.8^(1-z))})
resid$expected_SA<-96*resid$q_SA;resid$expected_CA<-96*resid$q_CA
write.csv(resid,file.path(root,'results/first_F2_residual_patterns.csv'),row.names=FALSE)
