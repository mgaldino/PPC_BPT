invisible(Sys.setlocale('LC_CTYPE','en_US.UTF-8'))
root<-'quality_reports/research_pipeline/ppc_bpt/2026-10-11_controlled_discovery'
d<-read.csv(file.path(root,'results/rejection_rates.csv'))
fam<-c('T0','Tpath','TpathXOR','TIA','Tfull')
labs<-c('Checks diretos','Templates: caminhos','Templates: paridades','Implicações da IA','Distribuição conjunta')
draw<-function(){
 par(mfrow=c(1,2),mar=c(4,10.7,3,1),mgp=c(2.5,.7,0),las=1)
 for(n in c(96,384)){
  z<-d[d$N==n & d$condition=='F2',];z<-z[match(fam,z$family),]
  plot(c(0,100),c(.6,5.4),type='n',xlab='Falha detectada (%)',ylab='',yaxt='n',main=paste('N =',n),bty='n')
  abline(v=seq(0,100,25),col='#EEEEEE');axis(2,at=5:1,labels=labs,tick=FALSE,cex.axis=.92)
  segments(100*z$Wilson_lower,5:1,100*z$Wilson_upper,5:1,col='#1D5069',lwd=2)
  points(100*z$rate,5:1,pch=19,col=c('#707070','#4477AA','#4477AA','#CC6677','#228833'),cex=1.1)
 }
}
png(file.path(root,'results/hard_fault_power.png'),width=2100,height=720,res=180)
draw();dev.off()
