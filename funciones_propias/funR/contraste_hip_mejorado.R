funcion <- function(df,var_num,valor, var_cat,g1,g2,g3){
  attach(df, warn.conflicts=FALSE)
  vec_grupo <- list() 
  vec_on <- c()
  vector <- c()
  for(i in c(g1, g2, g3)){
    G = subset(df, var_cat == i)
    g = G[,valor]
    vec_lon = append(vec_lon,length(G$var_cat))
    vec_grupo = append(vec_grupo, g)
    if(all(vec_lon > 50)){
      kolmogorov=ks.test(g, "pnorm", mean=mean(g),sd=sd(g))
      vector = append(vector, kolmogorov$p.value)
    } else if(any(vec_lon <= 50)){
      shapiro=shapiro.test(as.numeric(unlist(g)))
      vector = append(vector, shapiro$p.value)
    }
  }
  normalidad=ifelse(all(vector>0.05)==TRUE,"p>0.05","p<0.05")
  levene=df %>% levene_test(var_num ~ as.factor(var_cat), center="mean")
  p_valor_levene = levene$p > 0.05
  homocedasticidad=ifelse(p_valor_levene==TRUE,"p>0.05","p<0.05")
  analisis <- if(normalidad == "p>0.05" & homocedasticidad == "p>0.05") {
    print(" >>> -1- ANOVA de una via")
    anova=aov(var_num ~ as.factor(var_cat), data = df)
    print(summary(anova))
    print(">>> -2- Test de Tukey en caso de diferencias significativas")
    TukeyHSD(anova)
  } else if(normalidad == "p>0.05" & homocedasticidad == "p<0.05"){
    print(">>> -1- ANOVA de Welch")
    welch=welch_anova_test(var_num ~ as.factor(var_cat), data = df)
    print(welch)
  } else{
    print(">>> -1- Kruskal-Wallis")
    kruskal=kruskal.test(var_num ~ as.factor(var_cat), data = df)
    print(kruskal)
    print(">> -2- Dunnet-Test (corrección de Bonferroni)")
    pairwise.wilcox.test(x=var_num, g=var_cat, p.adjust.method = "bonf")
  }
  return(analisis)
}

# funcion(iris, Petal.Width, "Petal.Width", 
#         Species, "setosa", "versicolor", "virginica")l
