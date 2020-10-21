library(tercen)
library(dplyr)

options("tercen.workflowId" = "d330322c43363eb4f9b27738ef0042b9")
options("tercen.stepId"     = "1ae42627-e9ce-4d9f-9797-8700adfd7718")

do.chisq <- function(df, levels_ri, levels_col) {
  cts <- table(
    factor(df$.ri, levels = levels_ri),
    factor(df$coul, levels = levels_col)
  )
  chisq <- chisq.test(cts)
  df_out <- data.frame(
    .ci = df$.ci[1],
    chisq_stat = chisq$statistic,
    chisq_pval = chisq$p.value
  )
  return(df_out)
}

df <- (ctx = tercenCtx())  %>% 
  select(.y, .ci, .ri) %>% 
  mutate(coul = ctx$select(ctx$colors[[1]])[[1]])

levels_ri <- unique(df$.ri)
levels_col <- unique(df$coul)

df %>%
  group_by(.ci) %>%
  do(do.chisq(., levels_ri, levels_col)) %>%
  ctx$addNamespace() %>%
  ctx$save()
