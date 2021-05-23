##### Extract start values from fitted model
```{r}
extract_start=function(fitted_model) {
  parf=c()
  for (i in 1:length(summary(fitted_model)$ coefficients$fixed))      {
    par1=summary(fitted_model)$ coefficients$fixed[[i]]
    parf=rbind(parf,par1)
  } 
  row.names(parf) <- names(summary(fitted_model)$ coefficients$fixed)
  return(parf)
}

extract_start(modelZ)

mk=as.data.frame(matrix(extract_start(modelZ),ncol=3))

colnames(mk) <- c("a","b","k")

marker_start <- c()
for (i in 1:ncol(mk)) {
  marker_start[[i]] <- mk[,i]  
}
names(marker_start) <- c("a","b","k")

k=c(marker_start$k,0)

new_stv_k=list(fixed=c(marker_start$a,marker_start$b,k))

a=c(marker_start$a,0)

new_stv_a=list(fixed=c(a,marker_start$b,marker_start$k))

new_stv_ak=c(a,marker_start$b,k)
```
