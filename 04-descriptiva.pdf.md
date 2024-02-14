---
title: Estadística Descriptiva
keep-md: true
lang: es
---






## Ejercicios Resueltos

Para la realización de esta práctica se requieren los siguientes paquetes:

```r
library(tidyverse) 
# Incluye los siguientes paquetes:
# - readr: para la lectura de ficheros csv. 
# - dplyr: para el preprocesamiento y manipulación de datos.
library(vtable) # para resúmenes estadísticos.
library(skimr) # para resúmenes estadísticos.
library(summarytools) # para resúmenes estadísticos.
library(knitr) # para el formateo de tablas.
library(kableExtra) # para personalizar el formato de las tablas.
```

:::{#exr-descriptiva-1}
En una encuesta a 25 matrimonios sobre el número de hijos que tenían se obtuvieron los siguientes datos:

| |
|:-:|
|1, 2, 4, 2, 2, 2, 3, 2, 1, 1, 0, 2, 2, 0, 2, 2, 1, 2, 2, 3, 1, 2, 2, 1, 2 |


a.  Crear un conjunto de datos con la variable `hijos`.

    :::{.callout-tip collapse="true"}
    ## Solución


    ::: {.cell}
    
    ```{.r .cell-code}
    df <- data.frame(hijos = c(1, 2, 4, 2, 2, 2, 3, 2, 1, 1, 0, 2, 2, 0, 2, 2, 1, 2, 2, 3, 1, 2, 2, 1, 2))
    ```
    :::


    :::

a.  Calcular el tamaño muestral. 

    :::{.callout-tip collapse="true"}
    ## Solución


    ::: {.cell}
    
    ```{.r .cell-code}
    nrow(df)
    ```
    
    ::: {.cell-output .cell-output-stdout}
    
    ```
    [1] 25
    ```
    
    
    :::
    :::


    :::

a.  Calcular la media.

    :::{.callout-tip collapse="true"}
    ## Solución


    ::: {.cell}
    
    ```{.r .cell-code}
    mean(df$hijos)
    ```
    
    ::: {.cell-output .cell-output-stdout}
    
    ```
    [1] 1.76
    ```
    
    
    :::
    :::


    :::

a.  Calcular la mediana.

    :::{.callout-tip collapse="true"}
    ## Solución


    ::: {.cell}
    
    ```{.r .cell-code}
    median(df$hijos)
    ```
    
    ::: {.cell-output .cell-output-stdout}
    
    ```
    [1] 2
    ```
    
    
    :::
    :::


    :::

a.  Calcular la moda.

    :::{.callout-tip collapse="true"}
    ## Solución
    El paquete base de R no tiene implementada ninguna función para calcular la moda, así que definiremos nuestra propia función.


    ::: {.cell}
    
    ```{.r .cell-code}
    moda <- function(x) {
    u <- unique(x) # Vector con los valores de la muestra sin repetir (sin ordenar).
    tab <- tabulate(match(x, u)) # Frecuencias absolutas de los valores en u.
    u[tab == max(tab)] # Valor con la mayor frecuencia.
    }
    
    moda(df$hijos)
    ```
    
    ::: {.cell-output .cell-output-stdout}
    
    ```
    [1] 2
    ```
    
    
    :::
    :::


    :::

a.  Calcular el mínimo.

    :::{.callout-tip collapse="true"}
    ## Solución


    ::: {.cell}
    
    ```{.r .cell-code}
    min(df$hijos)
    ```
    
    ::: {.cell-output .cell-output-stdout}
    
    ```
    [1] 0
    ```
    
    
    :::
    :::


    :::

a.  Calcular el máximo.

    :::{.callout-tip collapse="true"}
    ## Solución


    ::: {.cell}
    
    ```{.r .cell-code}
    max(df$hijos)
    ```
    
    ::: {.cell-output .cell-output-stdout}
    
    ```
    [1] 4
    ```
    
    
    :::
    :::


    :::

a.  Calcular los cuartiles.

    :::{.callout-tip collapse="true"}
    ## Solución


    ::: {.cell}
    
    ```{.r .cell-code}
    quantile(df$hijos, prob=c(0.25, 0.5, 0.75))
    ```
    
    ::: {.cell-output .cell-output-stdout}
    
    ```
    25% 50% 75% 
      1   2   2 
    ```
    
    
    :::
    :::


    :::

a.  Calcular los percentiles 5 y 95.

    :::{.callout-tip collapse="true"}
    ## Solución


    ::: {.cell}
    
    ```{.r .cell-code}
    quantile(df$hijos, prob=c(0.05, 0.95))
    ```
    
    ::: {.cell-output .cell-output-stdout}
    
    ```
     5% 95% 
    0.2 3.0 
    ```
    
    
    :::
    :::


    :::

a.  Calcular el rango. 

    :::{.callout-tip collapse="true"}
    ## Solución


    ::: {.cell}
    
    ```{.r .cell-code}
    max(df$hijos) - min(df$hijos)
    ```
    
    ::: {.cell-output .cell-output-stdout}
    
    ```
    [1] 4
    ```
    
    
    :::
    :::


    :::

a.  Calcular el rango intecuartílico. 

    :::{.callout-tip collapse="true"}
    ## Solución


    ::: {.cell}
    
    ```{.r .cell-code}
    IQR(df$hijos)
    ```
    
    ::: {.cell-output .cell-output-stdout}
    
    ```
    [1] 1
    ```
    
    
    :::
    :::


    :::

a.  Calcular la varianza 

    :::{.callout-tip collapse="true"}
    ## Solución
    R dispone de la función `var` para calcular la _cuasivarianza_ o _varianza corregida_ $\sum \frac{(x_i-\bar x)^2}{n-1}$, pero no dispone de una función para calcular la varianza, de manera que para calcularla hay que corregir la cuasivarianza.


    ::: {.cell}
    
    ```{.r .cell-code}
    n <- nrow(df)
    # Cuasivarianza
    print(paste("Cuasivarianza:", var(df$hijos)))
    ```
    
    ::: {.cell-output .cell-output-stdout}
    
    ```
    [1] "Cuasivarianza: 0.773333333333333"
    ```
    
    
    :::
    
    ```{.r .cell-code}
    # Varianza
    print(paste("Varianza: ", var(df$hijos)*(n-1)/n))
    ```
    
    ::: {.cell-output .cell-output-stdout}
    
    ```
    [1] "Varianza:  0.7424"
    ```
    
    
    :::
    :::


    :::

a.  Calcular la desviación típica.

    :::{.callout-tip collapse="true"}
    ## Solución
    R dispone de la función `sd` para calcular la _cuasidesviación típica_ o _desviación típica corregida_ $\sqrt{\sum \frac{(x_i-\bar x)^2}{n-1}}$, pero no dispone de una función para calcular la desviación típica, de manera que para calcularla hay que corregir la cuasidesviación típica.


    ::: {.cell}
    
    ```{.r .cell-code}
    n <- nrow(df)
    # Cuasidesviación típica
    print(paste("Cuasidesviación típica:", sd(df$hijos)))
    ```
    
    ::: {.cell-output .cell-output-stdout}
    
    ```
    [1] "Cuasidesviación típica: 0.879393730551528"
    ```
    
    
    :::
    
    ```{.r .cell-code}
    # Desviación típica
    print(paste("Desviación típica: ", sd(df$hijos)*sqrt((n-1)/n)))
    ```
    
    ::: {.cell-output .cell-output-stdout}
    
    ```
    [1] "Desviación típica:  0.861626369141521"
    ```
    
    
    :::
    :::


    :::

a.  Calcular el coeficiente de variación.

    :::{.callout-tip collapse="true"}
    ## Solución


    ::: {.cell}
    
    ```{.r .cell-code}
    sd(df$hijos) / abs(mean(df$hijos))
    ```
    
    ::: {.cell-output .cell-output-stdout}
    
    ```
    [1] 0.4996555
    ```
    
    
    :::
    :::


    :::

a.  Calcular el coeficiente de asimetría.

    :::{.callout-tip collapse="true"}
    ## Solución
    Para calcular el coeficiente de asimetría se utiliza el paquete _moments_.



    ::: {.cell}
    
    ```{.r .cell-code}
    library(moments)
    skewness(df$hijos)
    ```
    
    ::: {.cell-output .cell-output-stdout}
    
    ```
    [1] 0.1068549
    ```
    
    
    :::
    :::



    Como $g_1$ está próxima a $0$, la distribución es casi simétrica.
    :::

a.  Calcular el coeficiente de apuntamiento.

    :::{.callout-tip collapse="true"}
    ## Solución
    Para calcular el coeficiente de apuntamiento se utiliza el paquete _moments_.



    ::: {.cell}
    
    ```{.r .cell-code}
    library(moments)
    kurtosis(df$hijos)
    ```
    
    ::: {.cell-output .cell-output-stdout}
    
    ```
    [1] 3.71169
    ```
    
    
    :::
    :::



    Como $g_2>0$, la distribución es más apuntada de lo normal (leptocúrtica). Como además $g_2\not\in(-2,2)$ se puede concluir que la muestra es demasiado apuntada para provenir de una población normal.
    :::
:::

:::{#exr-descriptiva-2}
El fichero [`colesterol.csv`](datos/colesterol.csv) contiene información de una muestra de pacientes donde se han medido la edad, el sexo, el peso, la altura y el nivel de colesterol, además de su nombre.

a.  Crear un data frame con los datos de todos los pacientes del estudio a partir del fichero [`colesterol.csv`](datos/colesterol.csv).

    :::{.callout-tip collapse="true"}
    ## Solución 


    ::: {.cell}
    
    ```{.r .cell-code}
    df <- read.csv("https://raw.githubusercontent.com/asalber/estadistica-practicas-r/main/datos/colesterol.csv")
    df
    ```
    
    ::: {.cell-output .cell-output-stdout}
    
    ```
                                nombre edad sexo peso altura colesterol
    1     José Luis Martínez Izquierdo   18    H   85   1.79        182
    2                   Rosa Díaz Díaz   32    M   65   1.73        232
    3            Javier García Sánchez   24    H   NA   1.81        191
    4              Carmen López Pinzón   35    M   65   1.70        200
    5             Marisa López Collado   46    M   51   1.58        148
    6                Antonio Ruiz Cruz   68    H   66   1.74        249
    7          Antonio Fernández Ocaña   51    H   62   1.72        276
    8            Pilar Martín González   22    M   60   1.66         NA
    9             Pedro Gálvez Tenorio   35    H   90   1.94        241
    10         Santiago Reillo Manzano   46    H   75   1.85        280
    11           Macarena Álvarez Luna   53    M   55   1.62        262
    12      José María de la Guía Sanz   58    H   78   1.87        198
    13 Miguel Angel Cuadrado Gutiérrez   27    H  109   1.98        210
    14           Carolina Rubio Moreno   20    M   61   1.77        194
    ```
    
    
    :::
    :::


    :::

a.  Calcular el tamaño muestral según el sexo.

    :::{.callout-tip collapse="true"}
    ## Solución 1


    ::: {.cell}
    
    ```{.r .cell-code}
    table(df$sexo)
    ```
    
    ::: {.cell-output .cell-output-stdout}
    
    ```
    
    H M 
    8 6 
    ```
    
    
    :::
    :::


    :::

    :::{.callout-tip collapse="true"}
    ## Solución 2


    ::: {.cell}
    
    ```{.r .cell-code}
    library(dplyr)
    count(df, sexo)
    ```
    
    ::: {.cell-output .cell-output-stdout}
    
    ```
      sexo n
    1    H 8
    2    M 6
    ```
    
    
    :::
    :::


    :::

a.  Calcular la media y la desviación típica del nivel de colesterol sin tener en cuenta los datos perdidos.

    :::{.callout-tip collapse="true"}
    ## Solución 


    ::: {.cell}
    
    ```{.r .cell-code}
    print(paste("Media:", mean(df$colesterol, na.rm = TRUE)))
    ```
    
    ::: {.cell-output .cell-output-stdout}
    
    ```
    [1] "Media: 220.230769230769"
    ```
    
    
    :::
    
    ```{.r .cell-code}
    print(paste("Desviación típica:", sd(df$colesterol, na.rm = TRUE)))
    ```
    
    ::: {.cell-output .cell-output-stdout}
    
    ```
    [1] "Desviación típica: 39.8479481825473"
    ```
    
    
    :::
    :::


    :::

a.  Realizar un resumen estadístico con la media, el mínimo, los cuartiles y el máximo.

    :::{.callout-tip collapse="true"}
    ## Solución 1
    Usando el paquete base de R.



    ::: {.cell}
    
    ```{.r .cell-code}
    summary(df)
    ```
    
    ::: {.cell-output .cell-output-stdout}
    
    ```
        nombre               edad           sexo                peso       
     Length:14          Min.   :18.00   Length:14          Min.   : 51.00  
     Class :character   1st Qu.:24.75   Class :character   1st Qu.: 61.00  
     Mode  :character   Median :35.00   Mode  :character   Median : 65.00  
                        Mean   :38.21                      Mean   : 70.92  
                        3rd Qu.:49.75                      3rd Qu.: 78.00  
                        Max.   :68.00                      Max.   :109.00  
                                                           NA's   :1       
         altura        colesterol   
     Min.   :1.580   Min.   :148.0  
     1st Qu.:1.705   1st Qu.:194.0  
     Median :1.755   Median :210.0  
     Mean   :1.769   Mean   :220.2  
     3rd Qu.:1.840   3rd Qu.:249.0  
     Max.   :1.980   Max.   :280.0  
                     NA's   :1      
    ```
    
    
    :::
    :::


    :::

    :::{.callout-tip collapse="true"}
    ## Solución 2
    Usando la función `st` del paquete [`vtable`](https://cran.r-project.org/web/packages/vtable/vignettes/sumtable.html).
    


    ::: {.cell}
    
    ```{.r .cell-code}
    library(vtable)
    st(df)
    ```
    
    ::: {.cell-output-display}
    \begin{table}
    
    \caption{\label{tab:unnamed-chunk-22}Summary Statistics}
    \centering
    \begin{tabular}[t]{llllllll}
    \toprule
    Variable & N & Mean & Std. Dev. & Min & Pctl. 25 & Pctl. 75 & Max\\
    \midrule
    edad & 14 & 38 & 16 & 18 & 25 & 50 & 68\\
    sexo & 14 &  &  &  &  &  & \\
    ... H & 8 & 57\% &  &  &  &  & \\
    ... M & 6 & 43\% &  &  &  &  & \\
    peso & 13 & 71 & 16 & 51 & 61 & 78 & 109\\
    \addlinespace
    altura & 14 & 1.8 & 0.12 & 1.6 & 1.7 & 1.8 & 2\\
    colesterol & 13 & 220 & 40 & 148 & 194 & 249 & 280\\
    \bottomrule
    \end{tabular}
    \end{table}
    
    
    :::
    :::


    :::

    :::{.callout-tip collapse="true"}
    ## Solución 3
    Usando la función `skim` del paquete [`skimr`](https://cran.r-project.org/web/packages/skimr/vignettes/skimr.html).
    


    ::: {.cell}
    
    ```{.r .cell-code}
    library(skimr)
    skim(df)
    ```
    
    ::: {.cell-output-display}
    
    \begin{table}
    
    \caption{\label{tab:unnamed-chunk-23}Data summary}
    \centering
    \begin{tabular}[t]{l|l}
    \hline
    Name & df\\
    \hline
    Number of rows & 14\\
    \hline
    Number of columns & 6\\
    \hline
    \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ & \\
    \hline
    Column type frequency: & \\
    \hline
    character & 2\\
    \hline
    numeric & 4\\
    \hline
    \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ & \\
    \hline
    Group variables & None\\
    \hline
    \end{tabular}
    \end{table}
    
    
    **Variable type: character**
    
    
    \begin{tabular}{l|r|r|r|r|r|r|r}
    \hline
    skim\_variable & n\_missing & complete\_rate & min & max & empty & n\_unique & whitespace\\
    \hline
    nombre & 0 & 1 & 14 & 31 & 0 & 14 & 0\\
    \hline
    sexo & 0 & 1 & 1 & 1 & 0 & 2 & 0\\
    \hline
    \end{tabular}
    
    
    **Variable type: numeric**
    
    
    \begin{tabular}{l|r|r|r|r|r|r|r|r|r|l}
    \hline
    skim\_variable & n\_missing & complete\_rate & mean & sd & p0 & p25 & p50 & p75 & p100 & hist\\
    \hline
    edad & 0 & 1.00 & 38.21 & 15.62 & 18.00 & 24.75 & 35.00 & 49.75 & 68.00 & ▇▅▃▅▂\\
    \hline
    peso & 1 & 0.93 & 70.92 & 16.13 & 51.00 & 61.00 & 65.00 & 78.00 & 109.00 & ▇▅▅▂▂\\
    \hline
    altura & 0 & 1.00 & 1.77 & 0.12 & 1.58 & 1.70 & 1.75 & 1.84 & 1.98 & ▆▇▆▃▃\\
    \hline
    colesterol & 1 & 0.93 & 220.23 & 39.85 & 148.00 & 194.00 & 210.00 & 249.00 & 280.00 & ▂▇▂▅▅\\
    \hline
    \end{tabular}
    
    
    :::
    :::


    :::

    :::{.callout-tip collapse="true"}
    ## Solución 4
    Usando las funciones `descr` y `dfSummary` del paquete [`summarytools`](https://cran.r-project.org/web/packages/summarytools/vignettes/introduction.html).
    


    ::: {.cell}
    
    ```{.r .cell-code}
    library(summarytools)
    descr(df) |>
    kable() |>
    kable_styling()
    ```
    
    ::: {.cell-output-display}
    \begin{table}
    \centering
    \begin{tabular}{l|r|r|r|r}
    \hline
      & altura & colesterol & edad & peso\\
    \hline
    Mean & 1.7685714 & 220.2307692 & 38.2142857 & 70.9230769\\
    \hline
    Std.Dev & 0.1150155 & 39.8479482 & 15.6213787 & 16.1269006\\
    \hline
    Min & 1.5800000 & 148.0000000 & 18.0000000 & 51.0000000\\
    \hline
    Q1 & 1.7000000 & 194.0000000 & 24.0000000 & 61.0000000\\
    \hline
    Median & 1.7550000 & 210.0000000 & 35.0000000 & 65.0000000\\
    \hline
    Q3 & 1.8500000 & 249.0000000 & 51.0000000 & 78.0000000\\
    \hline
    Max & 1.9800000 & 280.0000000 & 68.0000000 & 109.0000000\\
    \hline
    MAD & 0.1111950 & 41.5128000 & 17.7912000 & 14.8260000\\
    \hline
    IQR & 0.1350000 & 55.0000000 & 25.0000000 & 17.0000000\\
    \hline
    CV & 0.0650330 & 0.1809372 & 0.4087837 & 0.2273858\\
    \hline
    Skewness & 0.2052057 & -0.0022401 & 0.3238511 & 0.9149779\\
    \hline
    SE.Skewness & 0.5973799 & 0.6163361 & 0.5973799 & 0.6163361\\
    \hline
    Kurtosis & -0.9852205 & -1.2502343 & -1.2886761 & -0.1208155\\
    \hline
    N.Valid & 14.0000000 & 13.0000000 & 14.0000000 & 13.0000000\\
    \hline
    Pct.Valid & 100.0000000 & 92.8571429 & 100.0000000 & 92.8571429\\
    \hline
    \end{tabular}
    \end{table}
    
    
    :::
    
    ```{.r .cell-code}
    print(dfSummary(df, plain.ascii = FALSE, style = "grid"), method = "render")
    ```
    
    ::: {.cell-output-display}
    

    ```{=html}
    <div class="container st-container">
    <h3>Data Frame Summary</h3>
    <h4>df</h4>
    <strong>Dimensions</strong>: 14 x 6
      <br/><strong>Duplicates</strong>: 0
    <br/>
    <table class="table table-striped table-bordered st-table st-table-striped st-table-bordered st-multiline ">
      <thead>
        <tr>
          <th align="center" class="st-protect-top-border"><strong>No</strong></th>
          <th align="center" class="st-protect-top-border"><strong>Variable</strong></th>
          <th align="center" class="st-protect-top-border"><strong>Stats / Values</strong></th>
          <th align="center" class="st-protect-top-border"><strong>Freqs (% of Valid)</strong></th>
          <th align="center" class="st-protect-top-border"><strong>Graph</strong></th>
          <th align="center" class="st-protect-top-border"><strong>Valid</strong></th>
          <th align="center" class="st-protect-top-border"><strong>Missing</strong></th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td align="center">1</td>
          <td align="left">nombre
    [character]</td>
          <td align="left" style="padding:8;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">1. Antonio Fern&#0225;ndez Oca&#0241;a</td></tr><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">2. Antonio Ruiz Cruz</td></tr><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">3. Carmen L&#0243;pez Pinz&#0243;n</td></tr><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">4. Carolina Rubio Moreno</td></tr><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">5. Javier Garc&#0237;a S&#0225;nchez</td></tr><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">6. Jos&#0233; Luis Mart&#0237;nez Izquie</td></tr><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">7. Jos&#0233; Mar&#0237;a de la Gu&#0237;a San</td></tr><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">8. Macarena &#0193;lvarez Luna</td></tr><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">9. Marisa L&#0243;pez Collado</td></tr><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">10. Miguel Angel Cuadrado Gut</td></tr><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">[ 4 others ]</td></tr></table></td>
          <td align="left" style="padding:0;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">7.1%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">7.1%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">7.1%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">7.1%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">7.1%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">7.1%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">7.1%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">7.1%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">7.1%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">7.1%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">4</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">28.6%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr></table></td>
          <td align="left" style="vertical-align:middle;padding:0;background-color:transparent;"><img style="border:none;background-color:transparent;padding:0;max-width:max-content;" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAADcAAAEKCAQAAAAcQQUKAAAAIGNIUk0AAHomAACAhAAA+gAAAIDoAAB1MAAA6mAAADqYAAAXcJy6UTwAAAACYktHRAD/h4/MvwAAAAd0SU1FB+gCDhcOL4Dnsj4AAAETSURBVHja7dZdDsFQFIVRFaMzAkbICEyP11s/oelub5yu/SbIipwmvuG+W3P7VbXi3KF9cXl7yNMwj2i/fhi/dXz58C3662rfDofD4XC4LtzTv3n2v/t1Q5snyzRn2yq1b9fzUbku0pkfOZ2Jw+FwONwfcjozOOEXXO3b4XA4HA63BU5nBqczg6t9OxwOh8PhtsDpzOB0ZnC1b4fD4XA4XBdO+AVXm9OZOBwOh8PhJk1nBleb05k4HA6Hw+EmTWcGJ/yCq307HA6Hw+G2wOnM4HRmcLVvh8PhcDjcFjidGZzODK727XA4HA6H68IJv+Bqcz905tydm+N97cy5Gz/rtW+Hw+FwOFwXrmdnLr/at1uZewBxe0ESBJWlqgAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAyNC0wMi0xNFQyMzoxNDo0NyswMDowMKIyk2oAAAAldEVYdGRhdGU6bW9kaWZ5ADIwMjQtMDItMTRUMjM6MTQ6NDcrMDA6MDDTbyvWAAAAKHRFWHRkYXRlOnRpbWVzdGFtcAAyMDI0LTAyLTE0VDIzOjE0OjQ3KzAwOjAwhHoKCQAAAABJRU5ErkJggg=="></td>
          <td align="center">14
    (100.0%)</td>
          <td align="center">0
    (0.0%)</td>
        </tr>
        <tr>
          <td align="center">2</td>
          <td align="left">edad
    [integer]</td>
          <td align="left" style="padding:8;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">Mean (sd) : 38.2 (15.6)</td></tr><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">min &le; med &le; max:</td></tr><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">18 &le; 35 &le; 68</td></tr><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">IQR (CV) : 25 (0.4)</td></tr></table></td>
          <td align="left" style="vertical-align:middle">12 distinct values</td>
          <td align="left" style="vertical-align:middle;padding:0;background-color:transparent;"><img style="border:none;background-color:transparent;padding:0;max-width:max-content;" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuCAQAAABxABKuAAAAIGNIUk0AAHomAACAhAAA+gAAAIDoAAB1MAAA6mAAADqYAAAXcJy6UTwAAAACYktHRAD/h4/MvwAAAAd0SU1FB+gCDhcOL4Dnsj4AAAFSSURBVHja7dzLCcJAFEBRI1ZnBVqhVmB7uh3dyImMH7xnJyTyuDBZPWa5biK2nx7g1xQMFQztxh/2PTtP/fwdlpmz2L+PD+/kxUd7ePaCT8+dZb2OJCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYuluom7tTaL5pltHDBuK79viek0lmzzLqSKKCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGXbqj7Xbaudxzu9PvTYOsXBzuSqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGBoGVfxTl96jd6njRuIS41MRxIVDBUM3QB5IxYydzivEAAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAyNC0wMi0xNFQyMzoxNDo0NyswMDowMKIyk2oAAAAldEVYdGRhdGU6bW9kaWZ5ADIwMjQtMDItMTRUMjM6MTQ6NDcrMDA6MDDTbyvWAAAAKHRFWHRkYXRlOnRpbWVzdGFtcAAyMDI0LTAyLTE0VDIzOjE0OjQ3KzAwOjAwhHoKCQAAAABJRU5ErkJggg=="></td>
          <td align="center">14
    (100.0%)</td>
          <td align="center">0
    (0.0%)</td>
        </tr>
        <tr>
          <td align="center">3</td>
          <td align="left">sexo
    [character]</td>
          <td align="left" style="padding:8;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">1. H</td></tr><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">2. M</td></tr></table></td>
          <td align="left" style="padding:0;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">8</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">57.1%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">6</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">42.9%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr></table></td>
          <td align="left" style="vertical-align:middle;padding:0;background-color:transparent;"><img style="border:none;background-color:transparent;padding:0;max-width:max-content;" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAGIAAAA3CAQAAABd71fBAAAAIGNIUk0AAHomAACAhAAA+gAAAIDoAAB1MAAA6mAAADqYAAAXcJy6UTwAAAACYktHRAD/h4/MvwAAAAd0SU1FB+gCDhcOL4Dnsj4AAACgSURBVGje7djBCYAwEADBRKzOCrRCrSDt6TcRBMknm2Pn50Nx4SJ4+U7zW0a/gBGRItb64pzogBz5IyKlbfS7/VSaqxDjZASFERRGUBhBYQSFERRGUBhBYQTF6x+79D1lsFwvOCZadqRq2RFjnEJENGfiGj5Pe+65C7U86/2shBgnIyiMoDCCwggKIyiMoDCCwggKIyjiLc9mFWKcjKB4AMlDC+F+elCbAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDI0LTAyLTE0VDIzOjE0OjQ3KzAwOjAwojKTagAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyNC0wMi0xNFQyMzoxNDo0NyswMDowMNNvK9YAAAAodEVYdGRhdGU6dGltZXN0YW1wADIwMjQtMDItMTRUMjM6MTQ6NDcrMDA6MDCEegoJAAAAAElFTkSuQmCC"></td>
          <td align="center">14
    (100.0%)</td>
          <td align="center">0
    (0.0%)</td>
        </tr>
        <tr>
          <td align="center">4</td>
          <td align="left">peso
    [numeric]</td>
          <td align="left" style="padding:8;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">Mean (sd) : 70.9 (16.1)</td></tr><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">min &le; med &le; max:</td></tr><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">51 &le; 65 &le; 109</td></tr><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">IQR (CV) : 17 (0.2)</td></tr></table></td>
          <td align="left" style="vertical-align:middle">12 distinct values</td>
          <td align="left" style="vertical-align:middle;padding:0;background-color:transparent;"><img style="border:none;background-color:transparent;padding:0;max-width:max-content;" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuCAQAAABxABKuAAAAIGNIUk0AAHomAACAhAAA+gAAAIDoAAB1MAAA6mAAADqYAAAXcJy6UTwAAAACYktHRAD/h4/MvwAAAAd0SU1FB+gCDhcOL4Dnsj4AAAFbSURBVHja7dzBbYMwAEBRiJguEzQTthNkvfTqVr08aCAR/90iIQRfMgfb8fyYIi5HP8C7KRgqGFrGH/Y9+8LP38d89MuuNT74svou0zRd4dr70W/9TxqSqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGDox7Zz3Xl/Rr/26Z9x571pSKKCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqFNZ++Y5y6x7HUU0o7BbIFFrt5zQaYhiQqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoZ2nKJ+Hbq6cBvWC04ZbMsfOBqSqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYGgep7c/O6zoT+Oc/lwj05BEBUMFQ99UMBOPZ+QYAQAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAyNC0wMi0xNFQyMzoxNDo0NyswMDowMKIyk2oAAAAldEVYdGRhdGU6bW9kaWZ5ADIwMjQtMDItMTRUMjM6MTQ6NDcrMDA6MDDTbyvWAAAAKHRFWHRkYXRlOnRpbWVzdGFtcAAyMDI0LTAyLTE0VDIzOjE0OjQ3KzAwOjAwhHoKCQAAAABJRU5ErkJggg=="></td>
          <td align="center">13
    (92.9%)</td>
          <td align="center">1
    (7.1%)</td>
        </tr>
        <tr>
          <td align="center">5</td>
          <td align="left">altura
    [numeric]</td>
          <td align="left" style="padding:8;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">Mean (sd) : 1.8 (0.1)</td></tr><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">min &le; med &le; max:</td></tr><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">1.6 &le; 1.8 &le; 2</td></tr><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">IQR (CV) : 0.1 (0.1)</td></tr></table></td>
          <td align="left" style="vertical-align:middle">14 distinct values</td>
          <td align="left" style="vertical-align:middle;padding:0;background-color:transparent;"><img style="border:none;background-color:transparent;padding:0;max-width:max-content;" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuCAQAAABxABKuAAAAIGNIUk0AAHomAACAhAAA+gAAAIDoAAB1MAAA6mAAADqYAAAXcJy6UTwAAAACYktHRAD/h4/MvwAAAAd0SU1FB+gCDhcOL4Dnsj4AAAFfSURBVHja7dyxbcMwFEDBKPB0mSCZMJnA6yUtHbh5BEFB8F3nwqbwAKqgvnz8vlG8n30BVyNYJFh0Gz/svp/9TC74eey9znG52/SvLPEx8Z37qVdsS0aCRYJFgkWCRYJFgkWCRYJFgkWCRYJFgkWCRYJFgkWCRYJFgkWCRYJFgkWCRYJFgkWCRYJFgkWCRYJFgkWCRYJFgkWCRYJFgkWCRUvGzmfn7Xevt2K+f9Gc/sy8/fzE/d7VHtmSkWCRYJFgkWCRYJFgkWCRYJFgkWCRYJFgkWCRYJFgkWCRYJFg0cn/vbPX7MOTr+HhyUsFW/HwxJaMBIsEiwSLBIsEiwSLBIsEiwSLBIsEiwSLBIsEiwSLBIsEix6OqHe/oHBF/870z3xl4BpsyUiwSLBIsEiwSLBIsEiwSLBIsEiwSLBIsEiwSLBIsEiwSLDoGI/xv53pPzXO6R8aNbZkJFgkWPQHoAkVNpKup5gAAAAldEVYdGRhdGU6Y3JlYXRlADIwMjQtMDItMTRUMjM6MTQ6NDcrMDA6MDCiMpNqAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDI0LTAyLTE0VDIzOjE0OjQ3KzAwOjAw028r1gAAACh0RVh0ZGF0ZTp0aW1lc3RhbXAAMjAyNC0wMi0xNFQyMzoxNDo0NyswMDowMIR6CgkAAAAASUVORK5CYII="></td>
          <td align="center">14
    (100.0%)</td>
          <td align="center">0
    (0.0%)</td>
        </tr>
        <tr>
          <td align="center">6</td>
          <td align="left">colesterol
    [numeric]</td>
          <td align="left" style="padding:8;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">Mean (sd) : 220.2 (39.8)</td></tr><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">min &le; med &le; max:</td></tr><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">148 &le; 210 &le; 280</td></tr><tr style="background-color:transparent"><td style="padding:0;margin:0;border:0" align="left">IQR (CV) : 55 (0.2)</td></tr></table></td>
          <td align="left" style="vertical-align:middle">13 distinct values</td>
          <td align="left" style="vertical-align:middle;padding:0;background-color:transparent;"><img style="border:none;background-color:transparent;padding:0;max-width:max-content;" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuCAQAAABxABKuAAAAIGNIUk0AAHomAACAhAAA+gAAAIDoAAB1MAAA6mAAADqYAAAXcJy6UTwAAAACYktHRAD/h4/MvwAAAAd0SU1FB+gCDhcOL4Dnsj4AAAFiSURBVHja7d1BTsJAGIBRazgdJ9AT6gm4Hm5HF2ZeQx3A7+1ISGm+ZLr4aTvb9SXidfUJPJqCoYKh0/jh1tezz+kDvm2rQ/xmPLnT7qNMOU9967KuBWtJooKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhg287v2fzTxG8Dzfq/+Ng+54iaEmigqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhJ5zpz/+5sccTBjv2FUktSVQwVDBUMFQwVDBUMFQwVDBUMFQwVDBUMFQwVDBUMFQwVDD0bUS9bsOAY+fwt/Rjpr9qw4CZ373cxXYGLUlUMFQwVDBUMFQwVDBUMFQwVDBUMFQwVDBUMFQwVDBUMFQwtI3D9I+Hmaz/rfFlRVuNTEsSFQwVDH0BYZcWNs7B9l8AAAAldEVYdGRhdGU6Y3JlYXRlADIwMjQtMDItMTRUMjM6MTQ6NDcrMDA6MDCiMpNqAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDI0LTAyLTE0VDIzOjE0OjQ3KzAwOjAw028r1gAAACh0RVh0ZGF0ZTp0aW1lc3RhbXAAMjAyNC0wMi0xNFQyMzoxNDo0NyswMDowMIR6CgkAAAAASUVORK5CYII="></td>
          <td align="center">13
    (92.9%)</td>
          <td align="center">1
    (7.1%)</td>
        </tr>
      </tbody>
    </table>
    <p>Generated by <a href='https://github.com/dcomtois/summarytools'>summarytools</a> 1.0.1 (<a href='https://www.r-project.org/'>R</a> version 4.3.2)<br/>2024-02-15</p>
    </div>
    ```

    
    :::
    :::


    :::

a.  ¿En qué variable es más representativa la media?

    :::{.callout-tip collapse="true"}
    ## Solución 1
    Usando la función `sumtable` del paquete [`vtable`](https://cran.r-project.org/web/packages/vtable/vignettes/sumtable.html).


    ::: {.cell}
    
    ```{.r .cell-code}
    library(vtable)
    sumtable(df, summ = c('mean(x)', 'sd(x)', 'sd(x)/mean(x)'),
    summ.names = c("Media", "Desviación Típica", "Coef. Variación"))
    ```
    
    ::: {.cell-output-display}
    \begin{table}
    
    \caption{\label{tab:unnamed-chunk-25}Summary Statistics}
    \centering
    \begin{tabular}[t]{llll}
    \toprule
    Variable & Media & Desviación Típica & Coef. Variación\\
    \midrule
    edad & 38 & 16 & 0.41\\
    sexo & 14 &  & \\
    ... H & 8 & 57\% & \\
    ... M & 6 & 43\% & \\
    peso & 71 & 16 & 0.23\\
    \addlinespace
    altura & 1.8 & 0.12 & 0.065\\
    colesterol & 220 & 40 & 0.18\\
    \bottomrule
    \end{tabular}
    \end{table}
    
    
    :::
    :::



    La variable con el coeficiente de variación más pequeño es la altura, por lo que es la que tiene la media más representativa.
    :::

    :::{.callout-tip collapse="true"}
    ## Solución 2
    Usando las funciones `summarise` y `across` del paquete `dplyr`.


    ::: {.cell}
    
    ```{.r .cell-code}
    library(dplyr)
    summarise(df, across(.cols = where(is.numeric), .fns = list(Media = ~ mean(.x, na.rm = T), `Desviación Típica` = ~ sd(.x, na.rm = T), `Coef. Variación` = ~ sd(.x, na.rm=T) / mean(.x, na.rm=T)))) |>
    kable() |>
    kable_styling()
    ```
    
    ::: {.cell-output-display}
    \begin{table}
    \centering
    \begin{tabular}{r|r|r|r|r|r|r|r|r|r|r|r}
    \hline
    edad\_Media & edad\_Desviación Típica & edad\_Coef. Variación & peso\_Media & peso\_Desviación Típica & peso\_Coef. Variación & altura\_Media & altura\_Desviación Típica & altura\_Coef. Variación & colesterol\_Media & colesterol\_Desviación Típica & colesterol\_Coef. Variación\\
    \hline
    38.21429 & 15.62138 & 0.4087837 & 70.92308 & 16.1269 & 0.2273858 & 1.768571 & 0.1150155 & 0.065033 & 220.2308 & 39.84795 & 0.1809372\\
    \hline
    \end{tabular}
    \end{table}
    
    
    :::
    :::


    :::

    :::{.callout-tip collapse="true"}
    ## Solución 3
    Usando las funciones `group_by` y `summarise` del paquete `dplyr` y pivotando el data frame a formato largo.


    ::: {.cell}
    
    ```{.r .cell-code}
    library(tidyverse)
    df |> select(where(is.numeric)) |> 
        pivot_longer(everything(), names_to = "Variable", values_to = "Valor") |>
        group_by(Variable) |>
        summarise("Media" = mean(Valor, na.rm = T), 
        "Desviación Típica" = sd(Valor, na.rm = T),
        "Coef. Variación" = sd(Valor, na.rm = T) / mean(Valor, na.rm = T)) |>
        kable() |>
        kable_styling()
    ```
    
    ::: {.cell-output-display}
    \begin{table}
    \centering
    \begin{tabular}{l|r|r|r}
    \hline
    Variable & Media & Desviación Típica & Coef. Variación\\
    \hline
    altura & 1.768571 & 0.1150155 & 0.0650330\\
    \hline
    colesterol & 220.230769 & 39.8479482 & 0.1809372\\
    \hline
    edad & 38.214286 & 15.6213787 & 0.4087837\\
    \hline
    peso & 70.923077 & 16.1269006 & 0.2273858\\
    \hline
    \end{tabular}
    \end{table}
    
    
    :::
    :::



    La variable con el coeficiente de variación más pequeño es la altura, por lo que es la que tiene la media más representativa.
    :::

    
a.  Realizar un resumen estadístico con el coeficiente de asimetría y el coeficiente de apuntamiento del peso y la estatura según el sexo. ¿Qué grupo tiene peso más normal, los hombres o las mujeres? ¿Y una estatura más normal?

    :::{.callout-tip collapse="true"}
    ## Solución 1
    Usando la función `sumtable` del paquete [`vtable`](https://cran.r-project.org/web/packages/vtable/vignettes/sumtable.html).


    ::: {.cell}
    
    ```{.r .cell-code}
    library(vtable)
    sumtable(df, vars = c("peso", "altura"), group = "sexo", summ = c('skewness(x)', 'kurtosis(x)'),
    summ.names = c("Coef. Asimetría", "Coef. Apuntamiento"))
    ```
    
    ::: {.cell-output-display}
    \begin{table}
    
    \caption{\label{tab:unnamed-chunk-28}Summary Statistics}
    \centering
    \begin{tabular}[t]{lllll}
    \toprule
    \multicolumn{1}{c}{sexo} & \multicolumn{2}{c}{H} & \multicolumn{2}{c}{M} \\
    \cmidrule(l{3pt}r{3pt}){1-1} \cmidrule(l{3pt}r{3pt}){2-3} \cmidrule(l{3pt}r{3pt}){4-5}
    Variable & Coef. Asimetría & Coef. Apuntamiento & Coef. Asimetría & Coef. Apuntamiento\\
    \midrule
    peso & 0.61 & 2.5 & -0.47 & 1.9\\
    altura & 0.27 & 1.9 & -0.07 & 1.8\\
    \bottomrule
    \end{tabular}
    \end{table}
    
    
    :::
    :::


    :::

    :::{.callout-tip collapse="true"}
    ## Solución 2
    Usando las funciones `group_by` y `summarise` del paquete [`dplyr`]().
    


    ::: {.cell}
    
    ```{.r .cell-code}
    library(dplyr)
    df |> select(sexo, peso, altura) |>
    group_by(sexo) |>
    summarise(across(.cols = everything(), .fns = list("Coef. Asimetría" = ~ skewness(.x, na.rm = T), "Coef. Apuntamiento" = ~ kurtosis(.x, na.rm = T)))) |>
    kable() |>
    kable_styling()
    ```
    
    ::: {.cell-output-display}
    \begin{table}
    \centering
    \begin{tabular}{l|r|r|r|r}
    \hline
    sexo & peso\_Coef. Asimetría & peso\_Coef. Apuntamiento & altura\_Coef. Asimetría & altura\_Coef. Apuntamiento\\
    \hline
    H & 0.6107239 & 2.508255 & 0.2668417 & 1.904435\\
    \hline
    M & -0.4661293 & 1.852431 & -0.0699589 & 1.756341\\
    \hline
    \end{tabular}
    \end{table}
    
    
    :::
    :::



    Las mujeres tienen un peso más normal ya que tanto el coeficiente de asimetría como el de apuntamiento están más próximos a 0. Lo mismo ocurre con la altura.
    :::
:::

## Ejercicios propuestos

:::{#exr-descriptiva-3}
El fichero [`renta-media-comunidades-autonomas.csv`](datos/renta-media-comunidades-autonomas.csv) contiene información sobre la renta neta media por persona de las comunidades autónomas desde 2008 a 2021. 

a.  Crear un data frame con los datos de las rentas medias por persona de las comunidades a partir del fichero [`renta-media-comunidades-autonomas.csv`](datos/renta-media-comunidades-autonomas.csv).

    :::{.callout-tip collapse="true"}
    ## Solución 



    ::: {.cell}
    
    :::

    ::: {.cell}
    
    ```{.r .cell-code}
    df <- read_csv2("https://aprendeconalf.es/estadistica-practicas-r/datos/renta-media-comunidades-autonomas.csv")
    df
    ```
    
    ::: {.cell-output .cell-output-stdout}
    
    ```
    # A tibble: 19 x 15
       Comunidad      `2021` `2020` `2019` `2018` `2017` `2016` `2015` `2014` `2013`
       <chr>           <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>
     1 Andalucía        9915   9990   9160   9258   9116   8398   7942   8079   8408
     2 Aragón          13345  13097  12300  11990  12110  11649  12427  12037  12022
     3 Asturias Prin~  12861  12786  12523  12085  12244  12060  11427  11251  11211
     4 Balears Illes   11235  12658  12410  13240  12665  12222  10828  10660  10386
     5 Canarias        10161   9935   9487   8964   8863   8702   8640   8302   8513
     6 Cantabria       12848  12748  12205  11239  11293  10670  10494   9824   9843
     7 Castilla y Le~  12656  12697  12003  11949  11239  10815  10570  10406  10760
     8 Castilla - La~  10257  10485   9715   9533   9045   8731   8498   8545   8425
     9 Cataluña        14159  14170  13527  13338  12712  12660  12283  12205  12111
    10 Comunitat Val~  11237  11332  10611  10232   9801   9265   9098   9144   9375
    11 Extremadura      9500   9147   8796   8503   8250   8674   8469   7729   8224
    12 Galicia         11453  11469  11218  11239  10753  10439  10212  10235  10106
    13 Madrid Comuni~  14836  14580  14199  13279  13099  12647  12534  12597  12823
    14 Murcia Región~   9931   9850   8956   9111   8702   8273   7924   7767   8253
    15 Navarra Comun~  15269  15094  13937  13585  13583  13408  13300  13221  13608
    16 País Vasco      15544  15813  15300  14722  14397  14345  13836  14281  14312
    17 Rioja La        12913  13504  12697  12029  12131  11589  11132  11120  10686
    18 Ceuta           10397   9853  10164   9784   9676   9435   8512   8712   9336
    19 Melilla         12012  11427  11733  12507  10161  10883  10027  11619  11313
    # i 5 more variables: `2012` <dbl>, `2011` <dbl>, `2010` <dbl>, `2009` <dbl>,
    #   `2008` <dbl>
    ```
    
    
    :::
    :::


    :::

a.  Realizar un resumen estadístico con la media y la desviación típica, mínimo, cuartiles y máximo de todas las rentas medias.

a.  Realizar un resumen estadístico con la media y la desviación típica de las rentas medias de cada año.

a.  ¿Qué año presenta una menor variabilidad relativa?

a.  ¿En qué comunidad autónoma hay menos dispersión relativa con respecto a la media?

a.  ¿En qué comunidad autónoma es más representativa la media de las rentas?

a.  ¿Qué comunidad autónoma presenta una distribución de las rentas más normal a lo largo de los años?

a.  ¿Qué comunidades autónomas tienen una renta media por debajo del percentil 10? ¿Y cuáles tienen una renta media por encima del percentil 90?

a.  Crear la variable `riqueza` que clasifique las comunidades según la media de sus rentas en `baja` (por debajo del primer cuartil), `media` (entre el primer y el tercer cuartil) y `alta` (por encima del tercer cuartil).

a.  Hacer un resumen estadístico con la media, cuartiles, desviación típica, coeficiente de variación, coeficiente de asimetría y coeficiente de curtosis de las rentas medias según la riqueza.
:::
<!-- 


df <- df |> 
    mutate(total = rowMeans(across(where(is.numeric)), na.rm = T))
df |> mutate(riqueza = cut(total, breaks = quantile(total, probs = c(0, 0.25, 0.75, 1)), include.lowest = T)) |> select(riqueza)
``` -->