###---- RLadies Octubre ----###

# COMANDOS BASICOS #
getwd() #ruta de trabajo actual
setwd("C:/Users/Equipo_3/Desktop/RLadiesOctubre")


# DATOS
a <- 45
24 -> a

class(45)
class("RLadies")
class(TRUE)
class(1+2i)

# Vectores
x <- c(1,3,2,5)
x
x = c(1,6,2)
x
y = c(1,4,3)
length (x)
x+y
sqrt(x)
x^2
x=seq (1 ,10)
x=1:10
x=seq(-pi ,pi ,length =50)
c(rep(T,5),rep(F,5))
x[5]
x[c(4,5)]
set.seed(2424) 
rnorm(100, mean=10, sd=3)

ls() #ver todo los objetos
rm(x,y) #borrar
ls()
rm(list=ls()) #borrar todo de una vez

# Matrices
x=matrix (data=c(1,2,3,4) , nrow=2, ncol =2) #las matrices se llenan por columna
x=matrix (c(1,2,3,4),2,2)
matrix (c(1,2,3,4) ,2,2,byrow =TRUE)
A=matrix (1:16 ,4 ,4,byrow=T)
A[2,3] #corchetes permien acceder a las posiciones en el objeto
A[c(1,3) ,c(2,4) ]
A[1:3 ,2:4]
A[1:2 ,]
A[ ,1:2]
A[1,]
A[-c(1,3) ,]
dim(A)
nrow(A)
ncol(A)
length(A)
mes <- matrix(1:35,nrow=5,ncol=7,byrow=T)
filas <- c("Semana1","Semana2","Semana3","Semana4","Semana5")
columnas <- c("Lun","Mar","Mie","Jue","Vie","Sab","Dom")
colnames(mes) <- columnas #nombres en columnas 
rownames(mes) <- filas #nombres en filas
mes

# Factores
peso <- ordered(c('Ligero','Medio','Pesado'))
class(peso)
tam <- peso[c(sample(peso,25,replace=T))]
tam

#DataFrames
df <- data.frame(Dia = sample(columnas,10,replace = T),
                 Estimado = rep(c(T,F),10),
                 Lectura = rnorm(20,5))
names(df)
attach(df) #para escibir directamente los nombres del df
Dia
head(df)
df$Estimado==F
df[df$Estimado == F, c('Dia','Lectura')]

#Listas
a <- 45
Lista1 <- list(x,"Hola",columnas,a)
Lista1
Lista1[[2]]
Lista1[[3]][4]

# Carga de datos
# CSV -- se obtiene como resultado un data frame
rm(list=ls())
#install.packages("ISLR")
library(ISLR)
datos <- Auto
#data1 <- read.table("Auto.txt") #para leer el archivo txt
#data1 <- read.table("Auto.txt",header=T,na.strings = "?") #trata como missing a  "?"
#data <- read.csv2("Auto.csv") #considera header=T, sep=";" y dec=","
#data <- read.csv("Auto.csv")
#data1 <- na.omit(data1) #borrar observaciones perdidas
#data <- na.omit(data1) #borrar observaciones perdidas
fix(Auto) #Para editar la data
show(Auto)
View(Auto)
dim(Auto)
names(Auto)

# Otros formatos 
# Datos desde Excel:
## XLConnect para formatos xls xlsx
## xlsx
##install.packages("xlsx",dependencies = T)
##library(xlsx)
##write.xlsx(results, file = 'data/results.xlsx', sheetName = 'Resultados')

# Otros formatos
## foreign
## spss, dbf, octave y arff

# Desde el portapapeles
datos2 <- read.delim("clipboard")

# Analisis exploratorio
attach(Auto)
plot(cylinders,mpg)
plot(as.factor(cylinders),mpg,col ="red", varwidth =T, xlab=" cylinders ",
     ylab ="MPG ")
hist(mpg ,col =2, breaks =15)
pairs(Auto)
plot(horsepower ,mpg)
identify(horsepower,mpg,n=1)
identify (horsepower,mpg,name,n=3)
summary(Auto)
summary(mpg)
mean(mpg)

#install.packages("Hmisc")
library("Hmisc")
describe(Auto)

table(cylinders,year)
table(year)

#Exportar datos
write.csv(mpg,file="mpg.csv")

# Graficos
library(datasets)
plot(iris$Sepal.Length)
plot(iris$Sepal.Length, iris$Sepal.Width)
plot(iris$Sepal.Length, iris$Sepal.Width,col = iris$Species, pch = 19)
plot(iris$Petal.Length, iris$Petal.Width,
     col = iris$Species, pch = 19,
     xlab = 'Longitud del pétalo', ylab = 'Ancho del pétalo')
title(main = 'IRIS', sub = 'Exploración de los pétalos según especie',
    col.main = 'blue', col.sub = 'blue')
legend("bottomright", legend = levels(iris$Species),
    col = unique(iris$Species), ncol = 3, pch = 19, bty = "n")

boxplot(Petal.Length ~ Species, data = iris, notch = T,
      range = 1.25, width = c(1.0, 2.0, 2.0))
title(main = 'IRIS', ylab = 'Longitud pétalo',
      sub = 'Análisis de pétalo por familia')

datos <- read.csv(file.choose(),h=T)
