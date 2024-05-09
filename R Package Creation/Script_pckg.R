GSAfisher <-
  function(obj) {
    x <- -2 * sum(log(obj))
    df <- 2 * length(obj)
    p_val<- pchisq(x, df, lower.tail = FALSE)
    result <- list(fisher=x, p_value=p_val, degrees_freedom= df)
    class(result) <- "GSA_class"
    return (result)
  }


printGSAfisher <-
  function(result) {
    cat("The obtained p-value is:", result$p_value, "\n")
  }


summaryGSAfisher <-
  function(result) {
    cat("Summary:\n")
    cat("Fisher Combined Statistic (FCS):", result$fisher, "\n")
    cat("Degrees of freedom (df):", result$degrees_freedom, "\n")
    cat("P-value:", result$p_value, "\n")
  }


GSAmultiple <-
  function(obj) {
    result <- lapply(obj, function(x) GSAfisher(x))
    return(result)
  }


plotGSAfisher <- 
  function(result, threshold = 0.01) {
  p_values <- sapply(result, function(x) x$p_value)
  transf_pvals <- -log10(p_values)
  degrees_freedom <- sapply(result, function(x) x$degrees_freedom)
  
  qqplot(qchisq(ppoints(length(transf_pvals)), df = 2 * degrees_freedom), transf_pvals, 
         main = "Q-Q Plot", xlab = "Chi-Squared", ylab = "-log10(p-vals)")
  
  points(qchisq(ppoints(length(transf_pvals)), df = 2 * degrees_freedom)[transf_pvals < -log10(threshold)], transf_pvals[transf_pvals < -log10(threshold)], 
         col = "red", pch = 20)
}




package.skeleton("GSAfisherSM")


library(devtools)
check("GSAfisherSM")
install("GSAfisherSM")


library(GSAfisherSM)
help(GSAfisherSM)
