#C
#Sys.getlocale ()
#source("src/B.R")
source("src/B.R",encoding = "UTF-8")#tenia un problema de conexio amb els accents

# partim de que ja tenim les variables seleccionades i preparades per fer la unio de les
#dues bases de dades i un cop unides tindrem la base de dades amb la que farem els grafics
#i els grafics els farem en un flesdasboard amb interaccions de shiny


#ara toco nomes renombrar les variables perque totes tinguin el mateix nom i sigui mes facil
#ajuntarles,comprovar que tambe tenen les mateixes etiquetes i els nivells ja he comprovat 
#que son els mateixos
#torno a fer una vista general de les dades:
look_for(dataset1_tbl)
look_for(dataset2_tbl)
str(dataset1_tbl)
str(dataset2_tbl)
#ja tenen les mateixes etiquetes a les variables
#nomes falta ordenar les variables iguals, tot i que no es necesari: https://rpubs.com/Rortizdu/140166
#"Comprobamos que R ha identificado los nombres de las variables o columnas y los ha reordenado 
#para que coincidan, antes de unirlos. En caso de que por cualquier motivo queramos dar un 
#orden específico al DF, tenemos varias opciones".

#A)primer ordenare un dataset i despres B)agafare aquest dataset ordenat com a referencia per ordenar el altre
names(dataset1_tbl)
names(dataset2_tbl)


#primer elimino G_EDAT i deixo tan sols GR_EDAT que es la variable ja preparada
head(dataset1_tbl$G_EDAT)
head(dataset1_tbl$GR_EDAT)
head(dataset2_tbl$GR_EDAT)

dataset1_tbl$G_EDAT<-NULL

#B)Opción 4 Utilizamos el orden de las variables o columnas del Data Frame referencia, para ordenar el DF objetivo.
#dataset2_tbl = dataset2_tbl [ , c(names(dataset1_tbl))]
#per posicio:
dataset1_tbl_sub = subset (dataset1_tbl, select=c(1:7,18:19,8:17))
names(dataset1_tbl_sub)
#dataset2_tbl_sub = subset (dataset2_tbl, select=c(3,2,1,7,6,5,4))
dataset2_tbl_sub = dataset2_tbl [ , c(names(dataset1_tbl_sub))]
names(dataset2_tbl_sub)

#reviso que els noms son iguals:
a <- names(dataset1_tbl_sub)
b <- names(dataset2_tbl_sub)
setdiff(a, b)

#as.data.frame(lapply(intersect(names(dataset1_tbl_sub), names(dataset2_tbl_sub)), 
#                     function(name) a[name] + b[name]))

#segon:veure que tots els nivells i valors i etiquetes de cada variable coincideix amb l'altre
#variable
str(dataset1_tbl)
class(dataset1_tbl)
str(dataset2_tbl)
class(dataset2_tbl)
str(dataset1_tbl_sub)
class(dataset1_tbl_sub)
str(dataset2_tbl_sub)
class(dataset2_tbl_sub)



#tercer ajuntare les bases i fare les comprovacions pertinent per veure si he perdut alguna cosa 
#pel cami


provabind2 = rbind(dataset1_tbl_sub, dataset2_tbl_sub)
str(provabind2)
provabind = rbind(dataset1_tbl, dataset2_tbl)
str(provabind)


#saber si te molts na's
my_na1 <- is.na(dataset1_tbl)
my_na2 <- is.na(dataset2_tbl)
my_na3 <- is.na(dataset1_tbl_sub)
my_na4 <- is.na(dataset2_tbl_sub)
my_na5 <- is.na(provabind)
my_na6 <- is.na(provabind2)
sum(my_na1)
table(my_na1)
sum(my_na2)
table(my_na2)
sum(my_na3)
table(my_na3)
sum(my_na4)
table(my_na4)
sum(my_na5)
table(my_na5)
sum(my_na6)
table(my_na6)

#verifico ke tinc els mateixos na's ja controlats per faltans
#comprovo ke no he perdut res en la unio
names(provabind)

sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 3])
table(provabind$Nº_ENQUESTA==3)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 4])
table(provabind$Nº_ENQUESTA==4)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 5])
table(provabind$Nº_ENQUESTA==5)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 6])
table(provabind$Nº_ENQUESTA==6)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 7])
table(provabind$Nº_ENQUESTA==7)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 8])
table(provabind$Nº_ENQUESTA==8)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 9])
table(provabind$Nº_ENQUESTA==9)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 10])
table(provabind$Nº_ENQUESTA==10)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 11])
table(provabind$Nº_ENQUESTA==11)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 12])
table(provabind$Nº_ENQUESTA==12)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 13])
table(provabind$Nº_ENQUESTA==13)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 14])
table(provabind$Nº_ENQUESTA==14)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 15])
table(provabind$Nº_ENQUESTA==15)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 16])
table(provabind$Nº_ENQUESTA==16)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 17])
table(provabind$Nº_ENQUESTA==17)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 18])
table(provabind$Nº_ENQUESTA==18)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 19])
table(provabind$Nº_ENQUESTA==19)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 20])
table(provabind$Nº_ENQUESTA==20)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 21])
table(provabind$Nº_ENQUESTA==21)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 22])
table(provabind$Nº_ENQUESTA==22)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 23])
table(provabind$Nº_ENQUESTA==23)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 24])
table(provabind$Nº_ENQUESTA==24)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 25])
table(provabind$Nº_ENQUESTA==25)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 26])
table(provabind$Nº_ENQUESTA==26)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 27])
table(provabind$Nº_ENQUESTA==27)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 28])
table(provabind$Nº_ENQUESTA==28)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 29])
table(provabind$Nº_ENQUESTA==29)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 30])
table(provabind$Nº_ENQUESTA==30)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 31])
table(provabind$Nº_ENQUESTA==31)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 32])
table(provabind$Nº_ENQUESTA==32)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 33])
table(provabind$Nº_ENQUESTA==33)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 34])
table(provabind$Nº_ENQUESTA==34)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 35])
table(provabind$Nº_ENQUESTA==35)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 36])
table(provabind$Nº_ENQUESTA==36)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 37])
table(provabind$Nº_ENQUESTA==37)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 38])
table(provabind$Nº_ENQUESTA==38)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 39])
table(provabind$Nº_ENQUESTA==39)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 40])
table(provabind$Nº_ENQUESTA==40)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 41])
table(provabind$Nº_ENQUESTA==41)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 42])
table(provabind$Nº_ENQUESTA==42)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 43])
table(provabind$Nº_ENQUESTA==43)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 44])
table(provabind$Nº_ENQUESTA==44)
sum( provabind$PONDERACIÓ[provabind[,"Nº_ENQUESTA"]== 45])
table(provabind$Nº_ENQUESTA==45)

#el mateix amb les dades que tenen les variables ordenades 
names(provabind2)

sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 3])
table(provabind2$Nº_ENQUESTA==3)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 4])
table(provabind2$Nº_ENQUESTA==4)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 5])
table(provabind2$Nº_ENQUESTA==5)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 6])
table(provabind2$Nº_ENQUESTA==6)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 7])
table(provabind2$Nº_ENQUESTA==7)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 8])
table(provabind2$Nº_ENQUESTA==8)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 9])
table(provabind2$Nº_ENQUESTA==9)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 10])
table(provabind2$Nº_ENQUESTA==10)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 11])
table(provabind2$Nº_ENQUESTA==11)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 12])
table(provabind2$Nº_ENQUESTA==12)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 13])
table(provabind2$Nº_ENQUESTA==13)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 14])
table(provabind2$Nº_ENQUESTA==14)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 15])
table(provabind2$Nº_ENQUESTA==15)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 16])
table(provabind2$Nº_ENQUESTA==16)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 17])
table(provabind2$Nº_ENQUESTA==17)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 18])
table(provabind2$Nº_ENQUESTA==18)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 19])
table(provabind2$Nº_ENQUESTA==19)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 20])
table(provabind2$Nº_ENQUESTA==20)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 21])
table(provabind2$Nº_ENQUESTA==21)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 22])
table(provabind2$Nº_ENQUESTA==22)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 23])
table(provabind2$Nº_ENQUESTA==23)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 24])
table(provabind2$Nº_ENQUESTA==24)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 25])
table(provabind2$Nº_ENQUESTA==25)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 26])
table(provabind2$Nº_ENQUESTA==26)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 27])
table(provabind2$Nº_ENQUESTA==27)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 28])
table(provabind2$Nº_ENQUESTA==28)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 29])
table(provabind2$Nº_ENQUESTA==29)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 30])
table(provabind2$Nº_ENQUESTA==30)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 31])
table(provabind2$Nº_ENQUESTA==31)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 32])
table(provabind2$Nº_ENQUESTA==32)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 33])
table(provabind2$Nº_ENQUESTA==33)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 34])
table(provabind2$Nº_ENQUESTA==34)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 35])
table(provabind2$Nº_ENQUESTA==35)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 36])
table(provabind2$Nº_ENQUESTA==36)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 37])
table(provabind2$Nº_ENQUESTA==37)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 38])
table(provabind2$Nº_ENQUESTA==38)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 39])
table(provabind2$Nº_ENQUESTA==39)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 40])
table(provabind2$Nº_ENQUESTA==40)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 41])
table(provabind2$Nº_ENQUESTA==41)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 42])
table(provabind2$Nº_ENQUESTA==42)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 43])
table(provabind2$Nº_ENQUESTA==43)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 44])
table(provabind2$Nº_ENQUESTA==44)
sum( provabind2$PONDERACIÓ[provabind2[,"Nº_ENQUESTA"]== 45])
table(provabind2$Nº_ENQUESTA==45)


#Decideixo crear una base de dades amb nomes les variables que realment fare servir:
names(provabind2)
DataFinal = subset (provabind2, select=c(5,8:19))
names(DataFinal)


#un cop verificats les coses, decideixo quedarme amb els datasets ja preparats dels workspace i aixi 
#treballar mes comode a partir d'ara

ls()
rm( list = c("dataset1_tbl","dataset1_tbl","dataset2_tbl","datas","names_dataset1_tbl",
             "names_dataset2_tbl","my_na4","my_na1","my_na2","my_na3","my_na5",
             "my_na6","na","na.vec","a","b"))

#The function save() can be used to save one or more R objects to a specified file (in .RData or .rda file formats). 
#The function can be read back from the file using the function load().
#It’s a good idea to save your workspace image when your work sessions are long.
#This can be done at any time using the function save.image()
#http://www.sthda.com/english/wiki/saving-data-into-r-data-format-rds-and-rdata



save(dataset1_tbl_sub,dataset2_tbl_sub,mydata1,mydata2,provabind,provabind2,DataFinal, file = "All_Datasets_CEO.RData")
save.image(file = "Work_Space_CEO.RData")
