set.seed(123)
x = round(rnorm(15, 8, 0.4),1)
y = round(rnorm(15, 7.5, 0.3),1)
z = round(rnorm(15, 7.7, 0.35),1)

df <- data.frame(vinoA=x, vinoB=y, vinoC=z)

write.csv(df, "datos/cata-vinos.csv", row.names = FALSE)
