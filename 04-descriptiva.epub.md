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

    `````{=html}
    <table class="table" style="margin-left: auto; margin-right: auto;">
    <caption>Summary Statistics</caption>
     <thead>
      <tr>
       <th style="text-align:left;"> Variable </th>
       <th style="text-align:left;"> N </th>
       <th style="text-align:left;"> Mean </th>
       <th style="text-align:left;"> Std. Dev. </th>
       <th style="text-align:left;"> Min </th>
       <th style="text-align:left;"> Pctl. 25 </th>
       <th style="text-align:left;"> Pctl. 75 </th>
       <th style="text-align:left;"> Max </th>
      </tr>
     </thead>
    <tbody>
      <tr>
       <td style="text-align:left;"> edad </td>
       <td style="text-align:left;"> 14 </td>
       <td style="text-align:left;"> 38 </td>
       <td style="text-align:left;"> 16 </td>
       <td style="text-align:left;"> 18 </td>
       <td style="text-align:left;"> 25 </td>
       <td style="text-align:left;"> 50 </td>
       <td style="text-align:left;"> 68 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> sexo </td>
       <td style="text-align:left;"> 14 </td>
       <td style="text-align:left;">  </td>
       <td style="text-align:left;">  </td>
       <td style="text-align:left;">  </td>
       <td style="text-align:left;">  </td>
       <td style="text-align:left;">  </td>
       <td style="text-align:left;">  </td>
      </tr>
      <tr>
       <td style="text-align:left;"> ... H </td>
       <td style="text-align:left;"> 8 </td>
       <td style="text-align:left;"> 57% </td>
       <td style="text-align:left;">  </td>
       <td style="text-align:left;">  </td>
       <td style="text-align:left;">  </td>
       <td style="text-align:left;">  </td>
       <td style="text-align:left;">  </td>
      </tr>
      <tr>
       <td style="text-align:left;"> ... M </td>
       <td style="text-align:left;"> 6 </td>
       <td style="text-align:left;"> 43% </td>
       <td style="text-align:left;">  </td>
       <td style="text-align:left;">  </td>
       <td style="text-align:left;">  </td>
       <td style="text-align:left;">  </td>
       <td style="text-align:left;">  </td>
      </tr>
      <tr>
       <td style="text-align:left;"> peso </td>
       <td style="text-align:left;"> 13 </td>
       <td style="text-align:left;"> 71 </td>
       <td style="text-align:left;"> 16 </td>
       <td style="text-align:left;"> 51 </td>
       <td style="text-align:left;"> 61 </td>
       <td style="text-align:left;"> 78 </td>
       <td style="text-align:left;"> 109 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> altura </td>
       <td style="text-align:left;"> 14 </td>
       <td style="text-align:left;"> 1.8 </td>
       <td style="text-align:left;"> 0.12 </td>
       <td style="text-align:left;"> 1.6 </td>
       <td style="text-align:left;"> 1.7 </td>
       <td style="text-align:left;"> 1.8 </td>
       <td style="text-align:left;"> 2 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> colesterol </td>
       <td style="text-align:left;"> 13 </td>
       <td style="text-align:left;"> 220 </td>
       <td style="text-align:left;"> 40 </td>
       <td style="text-align:left;"> 148 </td>
       <td style="text-align:left;"> 194 </td>
       <td style="text-align:left;"> 249 </td>
       <td style="text-align:left;"> 280 </td>
      </tr>
    </tbody>
    </table>
    
    `````

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
    
    <table style='width: auto;'
          class='table table-condensed'>
    <caption>Data summary</caption>
    <tbody>
      <tr>
       <td style="text-align:left;"> Name </td>
       <td style="text-align:left;"> df </td>
      </tr>
      <tr>
       <td style="text-align:left;"> Number of rows </td>
       <td style="text-align:left;"> 14 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> Number of columns </td>
       <td style="text-align:left;"> 6 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> _______________________ </td>
       <td style="text-align:left;">  </td>
      </tr>
      <tr>
       <td style="text-align:left;"> Column type frequency: </td>
       <td style="text-align:left;">  </td>
      </tr>
      <tr>
       <td style="text-align:left;"> character </td>
       <td style="text-align:left;"> 2 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> numeric </td>
       <td style="text-align:left;"> 4 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> ________________________ </td>
       <td style="text-align:left;">  </td>
      </tr>
      <tr>
       <td style="text-align:left;"> Group variables </td>
       <td style="text-align:left;"> None </td>
      </tr>
    </tbody>
    </table>
    
    
    **Variable type: character**
    
    <table>
     <thead>
      <tr>
       <th style="text-align:left;"> skim_variable </th>
       <th style="text-align:right;"> n_missing </th>
       <th style="text-align:right;"> complete_rate </th>
       <th style="text-align:right;"> min </th>
       <th style="text-align:right;"> max </th>
       <th style="text-align:right;"> empty </th>
       <th style="text-align:right;"> n_unique </th>
       <th style="text-align:right;"> whitespace </th>
      </tr>
     </thead>
    <tbody>
      <tr>
       <td style="text-align:left;"> nombre </td>
       <td style="text-align:right;"> 0 </td>
       <td style="text-align:right;"> 1 </td>
       <td style="text-align:right;"> 14 </td>
       <td style="text-align:right;"> 31 </td>
       <td style="text-align:right;"> 0 </td>
       <td style="text-align:right;"> 14 </td>
       <td style="text-align:right;"> 0 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> sexo </td>
       <td style="text-align:right;"> 0 </td>
       <td style="text-align:right;"> 1 </td>
       <td style="text-align:right;"> 1 </td>
       <td style="text-align:right;"> 1 </td>
       <td style="text-align:right;"> 0 </td>
       <td style="text-align:right;"> 2 </td>
       <td style="text-align:right;"> 0 </td>
      </tr>
    </tbody>
    </table>
    
    
    **Variable type: numeric**
    
    <table>
     <thead>
      <tr>
       <th style="text-align:left;"> skim_variable </th>
       <th style="text-align:right;"> n_missing </th>
       <th style="text-align:right;"> complete_rate </th>
       <th style="text-align:right;"> mean </th>
       <th style="text-align:right;"> sd </th>
       <th style="text-align:right;"> p0 </th>
       <th style="text-align:right;"> p25 </th>
       <th style="text-align:right;"> p50 </th>
       <th style="text-align:right;"> p75 </th>
       <th style="text-align:right;"> p100 </th>
       <th style="text-align:left;"> hist </th>
      </tr>
     </thead>
    <tbody>
      <tr>
       <td style="text-align:left;"> edad </td>
       <td style="text-align:right;"> 0 </td>
       <td style="text-align:right;"> 1.00 </td>
       <td style="text-align:right;"> 38.21 </td>
       <td style="text-align:right;"> 15.62 </td>
       <td style="text-align:right;"> 18.00 </td>
       <td style="text-align:right;"> 24.75 </td>
       <td style="text-align:right;"> 35.00 </td>
       <td style="text-align:right;"> 49.75 </td>
       <td style="text-align:right;"> 68.00 </td>
       <td style="text-align:left;"> ▇▅▃▅▂ </td>
      </tr>
      <tr>
       <td style="text-align:left;"> peso </td>
       <td style="text-align:right;"> 1 </td>
       <td style="text-align:right;"> 0.93 </td>
       <td style="text-align:right;"> 70.92 </td>
       <td style="text-align:right;"> 16.13 </td>
       <td style="text-align:right;"> 51.00 </td>
       <td style="text-align:right;"> 61.00 </td>
       <td style="text-align:right;"> 65.00 </td>
       <td style="text-align:right;"> 78.00 </td>
       <td style="text-align:right;"> 109.00 </td>
       <td style="text-align:left;"> ▇▅▅▂▂ </td>
      </tr>
      <tr>
       <td style="text-align:left;"> altura </td>
       <td style="text-align:right;"> 0 </td>
       <td style="text-align:right;"> 1.00 </td>
       <td style="text-align:right;"> 1.77 </td>
       <td style="text-align:right;"> 0.12 </td>
       <td style="text-align:right;"> 1.58 </td>
       <td style="text-align:right;"> 1.70 </td>
       <td style="text-align:right;"> 1.75 </td>
       <td style="text-align:right;"> 1.84 </td>
       <td style="text-align:right;"> 1.98 </td>
       <td style="text-align:left;"> ▆▇▆▃▃ </td>
      </tr>
      <tr>
       <td style="text-align:left;"> colesterol </td>
       <td style="text-align:right;"> 1 </td>
       <td style="text-align:right;"> 0.93 </td>
       <td style="text-align:right;"> 220.23 </td>
       <td style="text-align:right;"> 39.85 </td>
       <td style="text-align:right;"> 148.00 </td>
       <td style="text-align:right;"> 194.00 </td>
       <td style="text-align:right;"> 210.00 </td>
       <td style="text-align:right;"> 249.00 </td>
       <td style="text-align:right;"> 280.00 </td>
       <td style="text-align:left;"> ▂▇▂▅▅ </td>
      </tr>
    </tbody>
    </table>
    
    
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

    `````{=html}
    <table class="table" style="margin-left: auto; margin-right: auto;">
     <thead>
      <tr>
       <th style="text-align:left;">   </th>
       <th style="text-align:right;"> altura </th>
       <th style="text-align:right;"> colesterol </th>
       <th style="text-align:right;"> edad </th>
       <th style="text-align:right;"> peso </th>
      </tr>
     </thead>
    <tbody>
      <tr>
       <td style="text-align:left;"> Mean </td>
       <td style="text-align:right;"> 1.7685714 </td>
       <td style="text-align:right;"> 220.2307692 </td>
       <td style="text-align:right;"> 38.2142857 </td>
       <td style="text-align:right;"> 70.9230769 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> Std.Dev </td>
       <td style="text-align:right;"> 0.1150155 </td>
       <td style="text-align:right;"> 39.8479482 </td>
       <td style="text-align:right;"> 15.6213787 </td>
       <td style="text-align:right;"> 16.1269006 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> Min </td>
       <td style="text-align:right;"> 1.5800000 </td>
       <td style="text-align:right;"> 148.0000000 </td>
       <td style="text-align:right;"> 18.0000000 </td>
       <td style="text-align:right;"> 51.0000000 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> Q1 </td>
       <td style="text-align:right;"> 1.7000000 </td>
       <td style="text-align:right;"> 194.0000000 </td>
       <td style="text-align:right;"> 24.0000000 </td>
       <td style="text-align:right;"> 61.0000000 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> Median </td>
       <td style="text-align:right;"> 1.7550000 </td>
       <td style="text-align:right;"> 210.0000000 </td>
       <td style="text-align:right;"> 35.0000000 </td>
       <td style="text-align:right;"> 65.0000000 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> Q3 </td>
       <td style="text-align:right;"> 1.8500000 </td>
       <td style="text-align:right;"> 249.0000000 </td>
       <td style="text-align:right;"> 51.0000000 </td>
       <td style="text-align:right;"> 78.0000000 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> Max </td>
       <td style="text-align:right;"> 1.9800000 </td>
       <td style="text-align:right;"> 280.0000000 </td>
       <td style="text-align:right;"> 68.0000000 </td>
       <td style="text-align:right;"> 109.0000000 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> MAD </td>
       <td style="text-align:right;"> 0.1111950 </td>
       <td style="text-align:right;"> 41.5128000 </td>
       <td style="text-align:right;"> 17.7912000 </td>
       <td style="text-align:right;"> 14.8260000 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> IQR </td>
       <td style="text-align:right;"> 0.1350000 </td>
       <td style="text-align:right;"> 55.0000000 </td>
       <td style="text-align:right;"> 25.0000000 </td>
       <td style="text-align:right;"> 17.0000000 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> CV </td>
       <td style="text-align:right;"> 0.0650330 </td>
       <td style="text-align:right;"> 0.1809372 </td>
       <td style="text-align:right;"> 0.4087837 </td>
       <td style="text-align:right;"> 0.2273858 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> Skewness </td>
       <td style="text-align:right;"> 0.2052057 </td>
       <td style="text-align:right;"> -0.0022401 </td>
       <td style="text-align:right;"> 0.3238511 </td>
       <td style="text-align:right;"> 0.9149779 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> SE.Skewness </td>
       <td style="text-align:right;"> 0.5973799 </td>
       <td style="text-align:right;"> 0.6163361 </td>
       <td style="text-align:right;"> 0.5973799 </td>
       <td style="text-align:right;"> 0.6163361 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> Kurtosis </td>
       <td style="text-align:right;"> -0.9852205 </td>
       <td style="text-align:right;"> -1.2502343 </td>
       <td style="text-align:right;"> -1.2886761 </td>
       <td style="text-align:right;"> -0.1208155 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> N.Valid </td>
       <td style="text-align:right;"> 14.0000000 </td>
       <td style="text-align:right;"> 13.0000000 </td>
       <td style="text-align:right;"> 14.0000000 </td>
       <td style="text-align:right;"> 13.0000000 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> Pct.Valid </td>
       <td style="text-align:right;"> 100.0000000 </td>
       <td style="text-align:right;"> 92.8571429 </td>
       <td style="text-align:right;"> 100.0000000 </td>
       <td style="text-align:right;"> 92.8571429 </td>
      </tr>
    </tbody>
    </table>
    
    `````

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
          <td align="left" style="vertical-align:middle;padding:0;background-color:transparent;"><img style="border:none;background-color:transparent;padding:0;max-width:max-content;" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAADcAAAEKCAQAAAAcQQUKAAAAIGNIUk0AAHomAACAhAAA+gAAAIDoAAB1MAAA6mAAADqYAAAXcJy6UTwAAAACYktHRAD/h4/MvwAAAAd0SU1FB+gCDhcOM5Tm7nEAAAETSURBVHja7dZdDsFQFIVRFaMzAkbICEyP11s/oelub5yu/SbIipwmvuG+W3P7VbXi3KF9cXl7yNMwj2i/fhi/dXz58C3662rfDofD4XC4LtzTv3n2v/t1Q5snyzRn2yq1b9fzUbku0pkfOZ2Jw+FwONwfcjozOOEXXO3b4XA4HA63BU5nBqczg6t9OxwOh8PhtsDpzOB0ZnC1b4fD4XA4XBdO+AVXm9OZOBwOh8PhJk1nBleb05k4HA6Hw+EmTWcGJ/yCq307HA6Hw+G2wOnM4HRmcLVvh8PhcDjcFjidGZzODK727XA4HA6H68IJv+Bqcz905tydm+N97cy5Gz/rtW+Hw+FwOFwXrmdnLr/at1uZewBxe0ESBJWlqgAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAyNC0wMi0xNFQyMzoxNDo1MSswMDowMA1Ips4AAAAldEVYdGRhdGU6bW9kaWZ5ADIwMjQtMDItMTRUMjM6MTQ6NTErMDA6MDB8FR5yAAAAKHRFWHRkYXRlOnRpbWVzdGFtcAAyMDI0LTAyLTE0VDIzOjE0OjUxKzAwOjAwKwA/rQAAAABJRU5ErkJggg=="></td>
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
          <td align="left" style="vertical-align:middle;padding:0;background-color:transparent;"><img style="border:none;background-color:transparent;padding:0;max-width:max-content;" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuCAQAAABxABKuAAAAIGNIUk0AAHomAACAhAAA+gAAAIDoAAB1MAAA6mAAADqYAAAXcJy6UTwAAAACYktHRAD/h4/MvwAAAAd0SU1FB+gCDhcOM5Tm7nEAAAFSSURBVHja7dzLCcJAFEBRI1ZnBVqhVmB7uh3dyImMH7xnJyTyuDBZPWa5biK2nx7g1xQMFQztxh/2PTtP/fwdlpmz2L+PD+/kxUd7ePaCT8+dZb2OJCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYuluom7tTaL5pltHDBuK79viek0lmzzLqSKKCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGXbqj7Xbaudxzu9PvTYOsXBzuSqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGBoGVfxTl96jd6njRuIS41MRxIVDBUM3QB5IxYydzivEAAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAyNC0wMi0xNFQyMzoxNDo1MSswMDowMA1Ips4AAAAldEVYdGRhdGU6bW9kaWZ5ADIwMjQtMDItMTRUMjM6MTQ6NTErMDA6MDB8FR5yAAAAKHRFWHRkYXRlOnRpbWVzdGFtcAAyMDI0LTAyLTE0VDIzOjE0OjUxKzAwOjAwKwA/rQAAAABJRU5ErkJggg=="></td>
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
          <td align="left" style="vertical-align:middle;padding:0;background-color:transparent;"><img style="border:none;background-color:transparent;padding:0;max-width:max-content;" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAGIAAAA3CAQAAABd71fBAAAAIGNIUk0AAHomAACAhAAA+gAAAIDoAAB1MAAA6mAAADqYAAAXcJy6UTwAAAACYktHRAD/h4/MvwAAAAd0SU1FB+gCDhcOM5Tm7nEAAACgSURBVGje7djBCYAwEADBRKzOCrRCrSDt6TcRBMknm2Pn50Nx4SJ4+U7zW0a/gBGRItb64pzogBz5IyKlbfS7/VSaqxDjZASFERRGUBhBYQSFERRGUBhBYQTF6x+79D1lsFwvOCZadqRq2RFjnEJENGfiGj5Pe+65C7U86/2shBgnIyiMoDCCwggKIyiMoDCCwggKIyjiLc9mFWKcjKB4AMlDC+F+elCbAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDI0LTAyLTE0VDIzOjE0OjUxKzAwOjAwDUimzgAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyNC0wMi0xNFQyMzoxNDo1MSswMDowMHwVHnIAAAAodEVYdGRhdGU6dGltZXN0YW1wADIwMjQtMDItMTRUMjM6MTQ6NTErMDA6MDArAD+tAAAAAElFTkSuQmCC"></td>
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
          <td align="left" style="vertical-align:middle;padding:0;background-color:transparent;"><img style="border:none;background-color:transparent;padding:0;max-width:max-content;" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuCAQAAABxABKuAAAAIGNIUk0AAHomAACAhAAA+gAAAIDoAAB1MAAA6mAAADqYAAAXcJy6UTwAAAACYktHRAD/h4/MvwAAAAd0SU1FB+gCDhcOM5Tm7nEAAAFbSURBVHja7dzBbYMwAEBRiJguEzQTthNkvfTqVr08aCAR/90iIQRfMgfb8fyYIi5HP8C7KRgqGFrGH/Y9+8LP38d89MuuNT74svou0zRd4dr70W/9TxqSqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGDox7Zz3Xl/Rr/26Z9x571pSKKCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqFNZ++Y5y6x7HUU0o7BbIFFrt5zQaYhiQqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoZ2nKJ+Hbq6cBvWC04ZbMsfOBqSqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYGgep7c/O6zoT+Oc/lwj05BEBUMFQ99UMBOPZ+QYAQAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAyNC0wMi0xNFQyMzoxNDo1MSswMDowMA1Ips4AAAAldEVYdGRhdGU6bW9kaWZ5ADIwMjQtMDItMTRUMjM6MTQ6NTErMDA6MDB8FR5yAAAAKHRFWHRkYXRlOnRpbWVzdGFtcAAyMDI0LTAyLTE0VDIzOjE0OjUxKzAwOjAwKwA/rQAAAABJRU5ErkJggg=="></td>
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
          <td align="left" style="vertical-align:middle;padding:0;background-color:transparent;"><img style="border:none;background-color:transparent;padding:0;max-width:max-content;" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuCAQAAABxABKuAAAAIGNIUk0AAHomAACAhAAA+gAAAIDoAAB1MAAA6mAAADqYAAAXcJy6UTwAAAACYktHRAD/h4/MvwAAAAd0SU1FB+gCDhcOM5Tm7nEAAAFfSURBVHja7dyxbcMwFEDBKPB0mSCZMJnA6yUtHbh5BEFB8F3nwqbwAKqgvnz8vlG8n30BVyNYJFh0Gz/svp/9TC74eey9znG52/SvLPEx8Z37qVdsS0aCRYJFgkWCRYJFgkWCRYJFgkWCRYJFgkWCRYJFgkWCRYJFgkWCRYJFgkWCRYJFgkWCRYJFgkWCRYJFgkWCRYJFgkWCRYJFgkWCRUvGzmfn7Xevt2K+f9Gc/sy8/fzE/d7VHtmSkWCRYJFgkWCRYJFgkWCRYJFgkWCRYJFgkWCRYJFgkWCRYJFg0cn/vbPX7MOTr+HhyUsFW/HwxJaMBIsEiwSLBIsEiwSLBIsEiwSLBIsEiwSLBIsEiwSLBIsEix6OqHe/oHBF/870z3xl4BpsyUiwSLBIsEiwSLBIsEiwSLBIsEiwSLBIsEiwSLBIsEiwSLDoGI/xv53pPzXO6R8aNbZkJFgkWPQHoAkVNpKup5gAAAAldEVYdGRhdGU6Y3JlYXRlADIwMjQtMDItMTRUMjM6MTQ6NTErMDA6MDANSKbOAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDI0LTAyLTE0VDIzOjE0OjUxKzAwOjAwfBUecgAAACh0RVh0ZGF0ZTp0aW1lc3RhbXAAMjAyNC0wMi0xNFQyMzoxNDo1MSswMDowMCsAP60AAAAASUVORK5CYII="></td>
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
          <td align="left" style="vertical-align:middle;padding:0;background-color:transparent;"><img style="border:none;background-color:transparent;padding:0;max-width:max-content;" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuCAQAAABxABKuAAAAIGNIUk0AAHomAACAhAAA+gAAAIDoAAB1MAAA6mAAADqYAAAXcJy6UTwAAAACYktHRAD/h4/MvwAAAAd0SU1FB+gCDhcOM5Tm7nEAAAFiSURBVHja7d1BTsJAGIBRazgdJ9AT6gm4Hm5HF2ZeQx3A7+1ISGm+ZLr4aTvb9SXidfUJPJqCoYKh0/jh1tezz+kDvm2rQ/xmPLnT7qNMOU9967KuBWtJooKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhg287v2fzTxG8Dzfq/+Ng+54iaEmigqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhgqGCoYKhJ5zpz/+5sccTBjv2FUktSVQwVDBUMFQwVDBUMFQwVDBUMFQwVDBUMFQwVDBUMFQwVDD0bUS9bsOAY+fwt/Rjpr9qw4CZ373cxXYGLUlUMFQwVDBUMFQwVDBUMFQwVDBUMFQwVDBUMFQwVDBUMFQwtI3D9I+Hmaz/rfFlRVuNTEsSFQwVDH0BYZcWNs7B9l8AAAAldEVYdGRhdGU6Y3JlYXRlADIwMjQtMDItMTRUMjM6MTQ6NTErMDA6MDANSKbOAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDI0LTAyLTE0VDIzOjE0OjUxKzAwOjAwfBUecgAAACh0RVh0ZGF0ZTp0aW1lc3RhbXAAMjAyNC0wMi0xNFQyMzoxNDo1MSswMDowMCsAP60AAAAASUVORK5CYII="></td>
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

    `````{=html}
    <table class="table" style="margin-left: auto; margin-right: auto;">
    <caption>Summary Statistics</caption>
     <thead>
      <tr>
       <th style="text-align:left;"> Variable </th>
       <th style="text-align:left;"> Media </th>
       <th style="text-align:left;"> Desviación Típica </th>
       <th style="text-align:left;"> Coef. Variación </th>
      </tr>
     </thead>
    <tbody>
      <tr>
       <td style="text-align:left;"> edad </td>
       <td style="text-align:left;"> 38 </td>
       <td style="text-align:left;"> 16 </td>
       <td style="text-align:left;"> 0.41 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> sexo </td>
       <td style="text-align:left;"> 14 </td>
       <td style="text-align:left;">  </td>
       <td style="text-align:left;">  </td>
      </tr>
      <tr>
       <td style="text-align:left;"> ... H </td>
       <td style="text-align:left;"> 8 </td>
       <td style="text-align:left;"> 57% </td>
       <td style="text-align:left;">  </td>
      </tr>
      <tr>
       <td style="text-align:left;"> ... M </td>
       <td style="text-align:left;"> 6 </td>
       <td style="text-align:left;"> 43% </td>
       <td style="text-align:left;">  </td>
      </tr>
      <tr>
       <td style="text-align:left;"> peso </td>
       <td style="text-align:left;"> 71 </td>
       <td style="text-align:left;"> 16 </td>
       <td style="text-align:left;"> 0.23 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> altura </td>
       <td style="text-align:left;"> 1.8 </td>
       <td style="text-align:left;"> 0.12 </td>
       <td style="text-align:left;"> 0.065 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> colesterol </td>
       <td style="text-align:left;"> 220 </td>
       <td style="text-align:left;"> 40 </td>
       <td style="text-align:left;"> 0.18 </td>
      </tr>
    </tbody>
    </table>
    
    `````

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

    `````{=html}
    <table class="table" style="margin-left: auto; margin-right: auto;">
     <thead>
      <tr>
       <th style="text-align:right;"> edad_Media </th>
       <th style="text-align:right;"> edad_Desviación Típica </th>
       <th style="text-align:right;"> edad_Coef. Variación </th>
       <th style="text-align:right;"> peso_Media </th>
       <th style="text-align:right;"> peso_Desviación Típica </th>
       <th style="text-align:right;"> peso_Coef. Variación </th>
       <th style="text-align:right;"> altura_Media </th>
       <th style="text-align:right;"> altura_Desviación Típica </th>
       <th style="text-align:right;"> altura_Coef. Variación </th>
       <th style="text-align:right;"> colesterol_Media </th>
       <th style="text-align:right;"> colesterol_Desviación Típica </th>
       <th style="text-align:right;"> colesterol_Coef. Variación </th>
      </tr>
     </thead>
    <tbody>
      <tr>
       <td style="text-align:right;"> 38.21429 </td>
       <td style="text-align:right;"> 15.62138 </td>
       <td style="text-align:right;"> 0.4087837 </td>
       <td style="text-align:right;"> 70.92308 </td>
       <td style="text-align:right;"> 16.1269 </td>
       <td style="text-align:right;"> 0.2273858 </td>
       <td style="text-align:right;"> 1.768571 </td>
       <td style="text-align:right;"> 0.1150155 </td>
       <td style="text-align:right;"> 0.065033 </td>
       <td style="text-align:right;"> 220.2308 </td>
       <td style="text-align:right;"> 39.84795 </td>
       <td style="text-align:right;"> 0.1809372 </td>
      </tr>
    </tbody>
    </table>
    
    `````

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

    `````{=html}
    <table class="table" style="margin-left: auto; margin-right: auto;">
     <thead>
      <tr>
       <th style="text-align:left;"> Variable </th>
       <th style="text-align:right;"> Media </th>
       <th style="text-align:right;"> Desviación Típica </th>
       <th style="text-align:right;"> Coef. Variación </th>
      </tr>
     </thead>
    <tbody>
      <tr>
       <td style="text-align:left;"> altura </td>
       <td style="text-align:right;"> 1.768571 </td>
       <td style="text-align:right;"> 0.1150155 </td>
       <td style="text-align:right;"> 0.0650330 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> colesterol </td>
       <td style="text-align:right;"> 220.230769 </td>
       <td style="text-align:right;"> 39.8479482 </td>
       <td style="text-align:right;"> 0.1809372 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> edad </td>
       <td style="text-align:right;"> 38.214286 </td>
       <td style="text-align:right;"> 15.6213787 </td>
       <td style="text-align:right;"> 0.4087837 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> peso </td>
       <td style="text-align:right;"> 70.923077 </td>
       <td style="text-align:right;"> 16.1269006 </td>
       <td style="text-align:right;"> 0.2273858 </td>
      </tr>
    </tbody>
    </table>
    
    `````

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

    `````{=html}
    <table class="table" style="margin-left: auto; margin-right: auto;">
    <caption>Summary Statistics</caption>
     <thead>
    <tr>
    <th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="1"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">sexo</div></th>
    <th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="2"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">H</div></th>
    <th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="2"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">M</div></th>
    </tr>
      <tr>
       <th style="text-align:left;"> Variable </th>
       <th style="text-align:left;"> Coef. Asimetría </th>
       <th style="text-align:left;"> Coef. Apuntamiento </th>
       <th style="text-align:left;"> Coef. Asimetría </th>
       <th style="text-align:left;"> Coef. Apuntamiento </th>
      </tr>
     </thead>
    <tbody>
      <tr>
       <td style="text-align:left;"> peso </td>
       <td style="text-align:left;"> 0.61 </td>
       <td style="text-align:left;"> 2.5 </td>
       <td style="text-align:left;"> -0.47 </td>
       <td style="text-align:left;"> 1.9 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> altura </td>
       <td style="text-align:left;"> 0.27 </td>
       <td style="text-align:left;"> 1.9 </td>
       <td style="text-align:left;"> -0.07 </td>
       <td style="text-align:left;"> 1.8 </td>
      </tr>
    </tbody>
    </table>
    
    `````

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

    `````{=html}
    <table class="table" style="margin-left: auto; margin-right: auto;">
     <thead>
      <tr>
       <th style="text-align:left;"> sexo </th>
       <th style="text-align:right;"> peso_Coef. Asimetría </th>
       <th style="text-align:right;"> peso_Coef. Apuntamiento </th>
       <th style="text-align:right;"> altura_Coef. Asimetría </th>
       <th style="text-align:right;"> altura_Coef. Apuntamiento </th>
      </tr>
     </thead>
    <tbody>
      <tr>
       <td style="text-align:left;"> H </td>
       <td style="text-align:right;"> 0.6107239 </td>
       <td style="text-align:right;"> 2.508255 </td>
       <td style="text-align:right;"> 0.2668417 </td>
       <td style="text-align:right;"> 1.904435 </td>
      </tr>
      <tr>
       <td style="text-align:left;"> M </td>
       <td style="text-align:right;"> -0.4661293 </td>
       <td style="text-align:right;"> 1.852431 </td>
       <td style="text-align:right;"> -0.0699589 </td>
       <td style="text-align:right;"> 1.756341 </td>
      </tr>
    </tbody>
    </table>
    
    `````

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
    # A tibble: 19 × 15
       Comunidad      `2021` `2020` `2019` `2018` `2017` `2016` `2015` `2014` `2013`
       <chr>           <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>
     1 Andalucía        9915   9990   9160   9258   9116   8398   7942   8079   8408
     2 Aragón          13345  13097  12300  11990  12110  11649  12427  12037  12022
     3 Asturias Prin…  12861  12786  12523  12085  12244  12060  11427  11251  11211
     4 Balears Illes   11235  12658  12410  13240  12665  12222  10828  10660  10386
     5 Canarias        10161   9935   9487   8964   8863   8702   8640   8302   8513
     6 Cantabria       12848  12748  12205  11239  11293  10670  10494   9824   9843
     7 Castilla y Le…  12656  12697  12003  11949  11239  10815  10570  10406  10760
     8 Castilla - La…  10257  10485   9715   9533   9045   8731   8498   8545   8425
     9 Cataluña        14159  14170  13527  13338  12712  12660  12283  12205  12111
    10 Comunitat Val…  11237  11332  10611  10232   9801   9265   9098   9144   9375
    11 Extremadura      9500   9147   8796   8503   8250   8674   8469   7729   8224
    12 Galicia         11453  11469  11218  11239  10753  10439  10212  10235  10106
    13 Madrid Comuni…  14836  14580  14199  13279  13099  12647  12534  12597  12823
    14 Murcia Región…   9931   9850   8956   9111   8702   8273   7924   7767   8253
    15 Navarra Comun…  15269  15094  13937  13585  13583  13408  13300  13221  13608
    16 País Vasco      15544  15813  15300  14722  14397  14345  13836  14281  14312
    17 Rioja La        12913  13504  12697  12029  12131  11589  11132  11120  10686
    18 Ceuta           10397   9853  10164   9784   9676   9435   8512   8712   9336
    19 Melilla         12012  11427  11733  12507  10161  10883  10027  11619  11313
    # ℹ 5 more variables: `2012` <dbl>, `2011` <dbl>, `2010` <dbl>, `2009` <dbl>,
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