################################################################################
############  Fórmulas para modelos de inferencia automáticos     ##############
################################################################################

##########################################
# Librerías para el uso de las funciones #
##########################################

library(tidyverse)
library(rstatix)
library(DescTools)

##### Comparar dos grupos independientes

tw.groups <- function(df,var_num,valor, var_cat,g1,g2) {
  attach(df)
  G1 = subset(df, var_cat == g1)
  uno=G1[,valor]
  G2 = subset(df, var_cat == g2)
  dos=G2[,valor]
  shapiro1=shapiro.test(as.numeric(unlist(uno)))
  shapiro2=shapiro.test(as.numeric(unlist(dos)))
  vector=c(shapiro1$p.value,shapiro2$p.value)
  normalidad=ifelse(all(vector>0.05)==TRUE,"p>0.05","p<0.05")
  levene=df %>% levene_test(var_num ~ as.factor(var_cat))
  p_valor_levene = levene$p > 0.05
  homocedasticidad=ifelse(p_valor_levene==TRUE,"p>0.05","p<0.05")
  analisis <- if(normalidad == "p>0.05" & homocedasticidad == "p>0.05") {
    print("Normalidad p > 0.05, Homocedasticidad p > 0.05: T de student es el modelo elegido")
    t.test(var_num ~ as.factor(var_cat), data = df, var.eq=TRUE)
  } else if(normalidad == "p>0.05" & homocedasticidad == "p<0.05"){
    print("Normalidad p > 0.05, Homocedasticidad p < 0.05: T de Welch es el modelo elegido")
    t.test(var_num ~ as.factor(var_cat), data = df, var.eq=FALSE)
  } else{
    print("Normalidad p < 0.05: Wilcoxon es el modelo elegido")
    wilcox.test(var_num ~ as.factor(var_cat), data = df, exact=F)
  }
  
  return(analisis)
}

#### Plantilla de la función ####
# tw.groups(df = ,var_num = ,valor = ,
#           var_cat = ,g1 = ,g2 = )

###### Comparar 3 grupos independientes (en caso de valores sigificativos, tienes que hacer tu el post_hoc)

th.groups <- function(df,var_num,valor, var_cat,g1,g2,g3) {
  attach(df)
  G1 = subset(df, var_cat == g1)
  uno=G1[,valor]
  G2 = subset(df, var_cat == g2)
  dos=G2[,valor]
  G3 = subset(df, var_cat == g3)
  tres=G3[,valor]
  shapiro1=shapiro.test(as.numeric(unlist(uno)))
  shapiro2=shapiro.test(as.numeric(unlist(dos)))
  shapiro3=shapiro.test(as.numeric(unlist(tres)))
  vector=c(shapiro1$p.value,shapiro2$p.value,shapiro3$p.value)
  normalidad=ifelse(all(vector>0.05)==TRUE,"p>0.05","p<0.05")
  levene=df %>% levene_test(var_num ~ as.factor(var_cat), center="mean")
  p_valor_levene = levene$p > 0.05
  homocedasticidad=ifelse(p_valor_levene==TRUE,"p>0.05","p<0.05")
  analisis <- if(normalidad == "p>0.05" & homocedasticidad == "p>0.05") {
    print("ANOVA de una vía")
    summary(aov(var_num ~ as.factor(var_cat), data = df))
  } else if(normalidad == "p>0.05" & homocedasticidad == "p<0.05"){
    print("ANOVA de Welch")
    welch_anova_test(var_num ~ as.factor(var_cat), data = df)
  } else{
    print("Kruskal-Wallis")
    kruskal.test(var_num ~ as.factor(var_cat), data = df)
  }
  return(analisis)
  
}

#### Plantilla de la función ####
# tw.groups(df = ,var_num = ,valor = ,
#           var_cat = ,g1 = ,g2 = , g3 = )

###### Comparar 4 grupos independientes (en caso de valores sigificativos, tienes que hacer tu el post_hoc)
fo.groups <- function(df,var_num,valor, var_cat,g1,g2,g3,g4) {
  attach(df)
  G1 = subset(df, var_cat == g1)
  uno=G1[,valor]
  G2 = subset(df, var_cat == g2)
  dos=G2[,valor]
  G3 = subset(df, var_cat == g3)
  tres=G3[,valor]
  G4 = subset(df, var_cat == g4)
  cuatro=G4[,valor]
  shapiro1=shapiro.test(as.numeric(unlist(uno)))
  shapiro2=shapiro.test(as.numeric(unlist(dos)))
  shapiro3=shapiro.test(as.numeric(unlist(tres)))
  shapiro4=shapiro.test(as.numeric(unlist(cuatro)))
  vector=c(shapiro1$p.value,shapiro2$p.value,shapiro3$p.value,shapiro4$p.value)
  normalidad=ifelse(all(vector>0.05)==TRUE,"p>0.05","p<0.05")
  levene=df %>% levene_test(var_num ~ as.factor(var_cat))
  p_valor_levene = levene$p > 0.05
  homocedasticidad=ifelse(p_valor_levene==TRUE,"p>0.05","p<0.05")
  analisis <- if(normalidad == "p>0.05" & homocedasticidad == "p>0.05") {
    print("Normalidad p > 0.05, Homocedasticidad p > 0.05: ANOVA de una vía")
    summary(aov(var_num ~ as.factor(var_cat), data = df))
  } else if(normalidad == "p>0.05" & homocedasticidad == "p<0.05"){
    print("Normalidad p > 0.05, Homocedasticidad p < 0.05: ANOVA de Welch")
    welch_anova_test(var_num ~ as.factor(var_cat), data = df)
  } else{
    print("Normalidad p > 0.05: Kruskal-Wallis")
    kruskal.test(var_num ~ as.factor(var_cat), data = df)
  }
  return(analisis)
  
}

#### Plantilla de la función ####
# tw.groups(df = ,var_num = ,valor = ,
#           var_cat = ,g1 = ,g2 = , g3 = , g4 = )
