#B

#Per instalar i llegir les llibreries necesaries per fer els calculs:
#source("src/Install-libraries.R")#Per instalar
source("src/libraries.R")#Per lleguir

#per llegir les dades originals, ja guardades a la carpeta "data":
mydata1 <- read_sav("data/Microdades anonimitzades fusio cine telf.sav")
mydata2 <- read_sav("data/Microdades anonimitzades fusio cine presencial.sav")


#####
#
#PREPARACIÓ DE LES 2 BASES SELECCIONADES PER AJUNTARLES EN LA BASE DEFINITIVA
#
#####




####
##
## SELECCIONAR LES VARIABLES EXPLICATIVES 
##
####


#p4/P4 : Valoració de la situació econòmica actual a Catalunya.
#Aquesta pregunta, esta distribuida només en una variable:
# names(mydata1)
# grep("^p4",names(mydata1))
dataset1_tbl <- select( mydata1 ,c("ordre","POND_GEO","BOP_num","any","sexe","edat","gr_edat","mes"),56)
names(dataset1_tbl)

#
# head(mydata2$P4)
# grep("P4",names(mydata2))
# glimpse(mydata2[,212])
# View(mydata2[,212])
# table(mydata2[,212])
dataset2_tbl <- select( mydata2 ,c("ORDRECINE","PONDERA","BOP_NUM","ANY","SEXE","EDAT","GR_EDAT","MES"),212)
names(dataset2_tbl)


#p9/P9 : Valoració de la situació política actual a Catalunya.
#Aquesta questio nomes esta distribuida en una variable,pero te moltes categories
# names(mydata1)
# grep("^p9",names(mydata1))
dataset1_tbl <- select( mydata1 ,c("ordre","POND_GEO","BOP_num","any","sexe","edat","gr_edat","mes"),c(56,61))
names(dataset1_tbl)

#
# head(mydata2$P9)
# grep("P9",names(mydata2))
# glimpse(mydata2[,217])
# View(mydata2[,217])
# table(mydata2$P9)
dataset2_tbl <- select( mydata2 ,c("ORDRECINE","PONDERA","BOP_NUM","ANY","SEXE","EDAT","GR_EDAT","MES"),c(212,217))
names(dataset2_tbl)


#p18/P18:Satisfacció amb el funcionament de la nostra democràcia. 
#Aquesta pregunta només te una variable al dataset
# names(mydata1)
# grep("p18",names(mydata1))
# glimpse(mydata1[,88])
dataset1_tbl <- select( mydata1 ,c("ordre","POND_GEO","BOP_num","any","sexe","edat","gr_edat","mes"),c(56,61,88))
names(dataset1_tbl)

#
# head(mydata2$P18)
# grep("P18",names(mydata2))
# glimpse(mydata2[,271])
# View(mydata2[,271])
# table(mydata2$P18)
dataset2_tbl <- select( mydata2 ,c("ORDRECINE","PONDERA","BOP_NUM","ANY","SEXE","EDAT","GR_EDAT","MES"),c(212,217,271))
names(dataset2_tbl)


#p27/P29:Valoració del nivell D’autonomia de Catalunya.
#Aquesta pregunta del questionari te una codificació diferent al dataset, on es la p27
#i no mante el nom que te al questionari que es p29.Variable unica.Hi ha diferencies en les etiquetes
#les categories, entre dataset1 i dataset2.
# names(mydata1)
# grep("p27",names(mydata1))
dataset1_tbl <- select( mydata1 ,c("ordre","POND_GEO","BOP_num","any","sexe","edat","gr_edat","mes"),c(56,61,88,170))
names(dataset1_tbl)

#
# head(mydata2$P29)
# grep("P29",names(mydata2))
# glimpse(mydata2[,380])
# View(mydata2[,380])
# table(mydata2$P29)
dataset2_tbl <- select( mydata2 ,c("ORDRECINE","PONDERA","BOP_NUM","ANY","SEXE","EDAT","GR_EDAT","MES"),c(212,217,271,380))
names(dataset2_tbl)


#p28/P30:Relació entre Catalunya y Espanya.
#Aquesta pregunta esta en una sola variable.Te iverses categories i te diferencies entre 
#dataset1 i dataset2.Renombrar i ja....sino tindre embolics.Te el nom p28 a dataset1.
# 
# names(mydata1)
# grep("p28",names(mydata1))
# glimpse(mydata1[,171])
dataset1_tbl <- select( mydata1 ,c("ordre","POND_GEO","BOP_num","any","sexe","edat","gr_edat","mes"),c(56,61,88,170,171))
names(dataset1_tbl)

#
# head(mydata2$P30)
# grep("P30",names(mydata2))
# glimpse(mydata2[,381])
# View(mydata2[,381])
# table(mydata2$P30)
dataset2_tbl <- select( mydata2 ,c("ORDRECINE","PONDERA","BOP_NUM","ANY","SEXE","EDAT","GR_EDAT","MES"),c(212,217,271,380,381))
names(dataset2_tbl)


#p30_cens/p38cens.Cens.Record de vot sobre cens al Parlament de Catalunya.
#Aquesta pregunta, varia de nom en els diversos questionaris i se li van afegint partits
#de nova creacio i altres desapareixen
# names(mydata1)
# grep("p30_cens",names(mydata1))
# head(mydata1$p30_cens)
# glimpse(mydata1[,273:274])
dataset1_tbl <- select( mydata1 ,c("ordre","POND_GEO","BOP_num","any","sexe","edat","gr_edat","mes"),c(56,61,88,170,171,274))
names(dataset1_tbl)

#
# head(mydata2$P38_CENS)
# grep("P38_CENS",names(mydata2))
# glimpse(mydata2[,473:474])
# View(mydata2[,473:474])
# table(mydata2$P38_CENS)
dataset2_tbl <- select( mydata2 ,c("ORDRECINE","PONDERA","BOP_NUM","ANY","SEXE","EDAT","GR_EDAT","MES"),c(212,217,271,380,381,473))
names(dataset2_tbl)


#c100/C100.Lloc de naixement del enquestat.
# head(mydata1$c100)
# grep("c100",names(mydata1))
# table(mydata1$c100)
dataset1_tbl <- select( mydata1 ,c("ordre","POND_GEO","BOP_num","any","sexe","edat","gr_edat","mes"),c(56,61,88,170,171,274,474))
names(dataset1_tbl)

#
# head(mydata2$C100)
# grep("C100",names(mydata2))
# glimpse(mydata2[,769])
# View(mydata2[,769])
# table(mydata2$C100)
dataset2_tbl <- select( mydata2 ,c("ORDRECINE","PONDERA","BOP_NUM","ANY","SEXE","EDAT","GR_EDAT","MES"),c(212,217,271,380,381,473,769))
names(dataset2_tbl)


#c400/C401:Situació laboral (actual) del enquestat/ada.
#Variable amb 5 possibles respostes,Pero son diferents amb dataset2. Sha de recodificar
#perque coincideixin.
# head(mydata1$c400)
# grep("c400",names(mydata1))
# table(mydata1$c400)
dataset1_tbl <- select( mydata1 ,c("ordre","POND_GEO","BOP_num","any","sexe","edat","gr_edat","mes"),c(56,61,88,170,171,274,474,480))
names(dataset1_tbl)

#
# grep("C401",names(mydata2))
# glimpse(mydata2[,784])
# View(mydata2[,784])
# head(mydata2$C401)
# table(mydata2$C401)
dataset2_tbl <- select( mydata2 ,c("ORDRECINE","PONDERA","BOP_NUM","ANY","SEXE","EDAT","GR_EDAT","MES"),c(212,217,271,380,381,473,769,784))
names(dataset2_tbl)


#C320/C800. Classe social subjectiva ./ C800:Autoubicació en la classe social.   
#Aquesta variable canvia el nom.I te diferent etiqueta pels valors 98 i 99.
# head(mydata1$c320)
# grep("c320",names(mydata1))
dataset1_tbl <- select( mydata1 ,c("ordre","POND_GEO","BOP_num","any","sexe","edat","gr_edat","mes"),c(56,61,88,170,171,274,474,480,529))
names(dataset1_tbl)

#
# head(mydata2$C800)
# grep("C800",names(mydata2))
# table(mydata2$C800)
dataset2_tbl <- select( mydata2 ,c("ORDRECINE","PONDERA","BOP_NUM","ANY","SEXE","EDAT","GR_EDAT","MES"),c(212,217,271,380,381,473,769,784,796))
names(dataset2_tbl)


#c600/C600.Estat civil./ C600. Estat civil
#Variable codificada. El mateix problema de sempre. Que la 98 i 99 estan diferent.
# head(mydata1$c600)
# grep("c600",names(mydata1))
dataset1_tbl <- select( mydata1 ,c("ordre","POND_GEO","BOP_num","any","sexe","edat","gr_edat","mes"),c(56,61,88,170,171,274,474,480,529,510))
names(dataset1_tbl)

#
# head(mydata2$C600)
# grep("C600",names(mydata2))
# table(mydata2$C800)
dataset2_tbl <- select( mydata2 ,c("ORDRECINE","PONDERA","BOP_NUM","ANY","SEXE","EDAT","GR_EDAT","MES"),c(212,217,271,380,381,473,769,784,796,790))
names(dataset2_tbl)



##########################################################################
##
#ARA UN COP SELECCIONADES LES VARIABLES, LES HEM DE FER COMPATIBLES ENTRE ELLES
#I COM LES HEM POGUT VEURE UNA A UNA DURANT LA FASE DE SELECCIO, HEM DETECTAT LES QUE 
#NECESITEN RECODIFICACIONS I CANVIS DIVERSOS.HOMOGENITZAR CRITERIS
##
#########################################################################

# RECORDA  que per possar etiquetes a un vector aquest ha de ser numeric o character!!
#	A vector to label. Must be either numeric (integer or double) or character.
# labels	
# A named vector or NULL. The vector should be the same type as x. Unlike factors, labels don't need to be exhaustive: only a fraction of the values might be labelled.
# 
# label	
# A short, human-readable description of the vector.



#1
#
##"p4"
#ara miro les dues p4 i les faré compatibles en criteris, si s'escau

head(dataset1_tbl$p4)
head(dataset2_tbl$P4)

#veiem que totes dues son <labelled double>, pero l'etiqueta de p4 es diferent a la de la variable
#P4 , decideixo canviarli la etiqueta i possar la etiqueta de P4 , ja que el dataset es mes recent
#tambe observo que els codis de codificació coincideixen : 1= Molt bona, 2=Bona, etc...
#canvi de etiqueta a p4:
glimpse(dataset1_tbl$p4)
is.labelled(dataset1_tbl$p4)
na <-is.na(dataset1_tbl$p4)
table(na)
#s3 <- labelled(c(1, 1, 2), c(Male = 1, Female = 2),
#label="Assigned sex at birth")
dataset1_tbl$p4 <- labelled(dataset1_tbl$p4,labels = c("Molt bona" = 1, "Bona" = 2,
                                                       "Ni bona ni dolenta" = 3, "Dolenta" = 4,
                                                       "Molt dolenta" = 5, "No ho sap" = 98, "No contesta" = 99), 
                            label = "Valoració de la situació econòmica actual de Catalunya")

#Comprovo amb glimpse i verifico que tot esta igual
glimpse(dataset1_tbl$p4)
glimpse(dataset2_tbl$P4)
class(dataset1_tbl$p4)
class(dataset2_tbl$P4)
#vull comparar les etiquetes de les dues variables a veure si son iguals 
#etiquetes1 & etiquetes2 o etiquetes1 | etiquetes2


#2
#
##"p9"

#com sempre miro com son les dues p9
head(dataset1_tbl$p9)
head(dataset2_tbl$P9)

#Comprovo amb glimpse i verifico que tot esta igual
glimpse(dataset1_tbl$p9)
glimpse(dataset2_tbl$P9)
class(dataset1_tbl$p9)
class(dataset2_tbl$P9)
#Modifico l'etiqueta explicativa de la variable
dataset1_tbl$p9
dataset1_tbl$p9 <- labelled(dataset1_tbl$p9,labels = c("Molt bona" = 1, "Bona" = 2,
                                                       "Ni bona ni dolenta" = 3, "Dolenta" = 4,
                                                       "Molt dolenta" = 5, "No ho sap" = 98, "No contesta" = 99), 
                            label = "Valoració de la situació política actual de Catalunya")
dataset2_tbl$P9 <- labelled(dataset2_tbl$P9,labels = c("Molt bona" = 1, "Bona" = 2,
                                                       "Ni bona ni dolenta" = 3, "Dolenta" = 4,
                                                       "Molt dolenta" = 5, "No ho sap" = 98, "No contesta" = 99),
                            label = "Valoració de la situació política actual de Catalunya")


#3
#
##"p18"

#com sempre miro com son les dues p18
head(dataset1_tbl$p18)
head(dataset2_tbl$P18)

#Comprovo amb glimpse 
glimpse(dataset1_tbl$p18)
glimpse(dataset2_tbl$P18)
class(dataset1_tbl$p18)
class(dataset2_tbl$P18)
#canvio el nom de les label
#library(labelled)
var_label(dataset1_tbl$p18) <- "Satisfacció amb el funcionament de la nostra democràcia"
var_label(dataset2_tbl$P18) <- "Satisfacció amb el funcionament de la nostra democràcia"


#4
#
##"p27 i P29"

#com sempre miro com son les dues p27 i P29 (son les mateixes pero amb noms diferents als Datasets)
head(dataset1_tbl$p27)
head(dataset2_tbl$P29)

#Comprovo amb glimpse 
glimpse(dataset1_tbl$p27)
glimpse(dataset2_tbl$P29)
class(dataset1_tbl$p27)
class(dataset2_tbl$P29)

#canvio el nom de les label nomes
#library(labelled)
#var_label(dataset1_tbl$p27) <- "Valoració del nivell d'autonomia de Catalunya"
var_label(dataset2_tbl$P29) <- "Valoració del nivell d'autonomia de Catalunya"

#canvi de labels i label de la var p27 del Dataset1 ja que te diferencies a N/S i N/C
dataset1_tbl$p27 <- labelled(dataset1_tbl$p27,labels = c("Massa autonomia" = 1, "Un nivell suficient d'autonomia" = 2,
                                                         "Un nivell insuficient d'autonomia" = 3, "No ho sap" = 98, "No contesta" = 99), 
                             label = "Valoració del nivell d'autonomia de Catalunya")

#5
#
##"p28 i P30"

head(dataset1_tbl$p28)
head(dataset2_tbl$P30)

#Comprovo amb glimpse 
glimpse(dataset1_tbl$p28)
glimpse(dataset2_tbl$P30)
class(dataset1_tbl$p28)
class(dataset2_tbl$P30)

#var_label(dataset1_tbl$p28) <- "Relació entre Catalunya i Espanya"
var_label(dataset2_tbl$P30) <- "Relació entre Catalunya i Espanya"

#canvi de labels i label de la var p28 del Dataset1 ja que te diferencies a N/S i N/C
dataset1_tbl$p28 <- labelled(dataset1_tbl$p28,labels = c("Una regió d’Espanya" = 1, "Una Comunitat Autònoma d’Espanya" = 2,
                                                         "Un estat dins una Espanya federal" = 3, "Un estat independent" = 4,"No ho sap" = 98, "No contesta" = 99), 
                             label = "Relació entre Catalunya i Espanya")


#6
#
##P38 Cens es la p30_cens i la P38_CENS

head(dataset1_tbl$p30_cens)
head(dataset2_tbl$P38_CENS)

#Comprovo amb glimpse 
glimpse(dataset1_tbl$p30_cens)
glimpse(dataset2_tbl$P38_CENS)
class(dataset1_tbl$p30_cens)
class(dataset2_tbl$P38_CENS)

var_label(dataset1_tbl$p30_cens) <- "Record de vot a les eleccions al Parlament de Catalunya sobre cens"
var_label(dataset2_tbl$P38_CENS) <- "Record de vot a les eleccions al Parlament de Catalunya sobre cens"


#7
#
##c100/C100


head(dataset1_tbl$c100)
head(dataset2_tbl$C100)

#Comprovo amb glimpse 
glimpse(dataset1_tbl$c100)
glimpse(dataset2_tbl$C100)
class(dataset1_tbl$c100)
class(dataset2_tbl$C100)

var_label(dataset1_tbl$c100) <- "Lloc de naixement de l'enquestat/ada"
var_label(dataset2_tbl$C100) <- "Lloc de naixement de l'enquestat/ada"

dataset1_tbl$c100 <- labelled(dataset1_tbl$c100,labels = c("Catalunya" = 1, "Altres comunitats autònomes" = 2,
                                                           "Unió Europea" = 3, "Resta del mon" = 4,"No ho sap" = 98, "No contesta" = 99),
                              label = "Lloc de naixement de l'enquestat/ada")



#8
#
##La c400 del dataset1 /La C401 del dataset2
#Despres la c400 sera renombrada com a c400b

#Aquesta variable, la c400 no es identica a la c401 del dataset2 , per aixo haig de complementar-la
#amb informacio de la variable c410 del dataset1 i aixi preguntara el mateix que la c410 del dataset2
#i podre ajuntarles adecuadament. Aleshore, he de buscar la pregunta ha afegir i ajuntarla
#convenientment sense perdua d'informació ni errors.
head(dataset1_tbl$c400)
head(dataset2_tbl$C401)
#aquestes son les 2 variables que han de ser iguals,cadasquna d'un dataset diferent
glimpse(dataset1_tbl$c400)
glimpse(dataset2_tbl$C401)
class(dataset1_tbl$c400)
class(dataset2_tbl$C401)
#veig moltes coses que canviar....

table(mydata1$c410)
table(mydata1$c400)
sum(table(mydata1$c410))

#ara creare una nova variable amb la pregunta de la c410 i amb les preguntes de la c400
#despres ajuntare les 2 primeres preguntes de la c400 en una sola i ja tindre la var creada
#les 3 variables d'interes son:
head(mydata1$c400)
head(mydata1$c410)
head(mydata2$C401)

dataset1_tbl$c410<- mydata1$c410

dataset1_tbl$c400b <- ifelse(dataset1_tbl$c400 ==3 & dataset1_tbl$c410 ==7 ,dataset1_tbl$c410,dataset1_tbl$c400)
#hem ceat la variable c400b , pero es un vector 
table(dataset1_tbl$c400b)
table(dataset1_tbl$c400)
table(dataset1_tbl$c410)
sum(table(dataset1_tbl$c400b))
sum(table(dataset1_tbl$c400))
sum(table(dataset1_tbl$c410))
head(dataset1_tbl$c400b)
str(dataset1_tbl$c400b)
#molt maco pero em retorna un vector i jo vull una variable              
#names(dataset1_tbl)
glimpse(dataset1_tbl)

#transformo el vector numeric en un vector labelled:
dataset1_tbl$c400b <- labelled(dataset1_tbl$c400b,labels = c("Treballa" = 1,"Treballa2" = 2, "No treballa" = 3,
                                                             "Està temporalment de baixa" = 7,"No ho sap" = 98,"No contesta" = 99),
                               label = "Situació laboral actual (enquestat/ada)")
glimpse(dataset1_tbl$c400b)
glimpse(dataset1_tbl)
str(dataset1_tbl)
head(dataset1_tbl$c400b)
class(dataset1_tbl$c400b)
table(dataset1_tbl$c400b)
sum(table(dataset1_tbl$c400b))
#vale fins ara ja tinc les dades, ara haig de canviar i sumar els valors dels que treballan
# i posar-li codificació 1 ( ara son 1 i 2, sumarlos), i canviar el valor 7 per 3 
head(dataset1_tbl$c400b)
names(dataset1_tbl)

#faig una copia de seguretat per si de cas:
dataset1_tbl$c400bb<-dataset1_tbl$c400b
head(dataset1_tbl$c400bb)
#primer li treure les etiquetes per que sigui un vector normal i despres ja li tornare a posar
val_labels(dataset1_tbl$c400bb)<-NULL
#ja el tinc com a numeric
is.numeric(dataset1_tbl$c400bb)
#ara li fare els canvis i despres tornare a afegirli les etiquetes i fer-lo "haven_llabeled"
dataset1_tbl$c400bb <- ifelse(dataset1_tbl$c400bb == 1 | dataset1_tbl$c400bb == 2 ,1,dataset1_tbl$c400bb)
#ja he canviat el 2 per 1 i comprovo que no sha perdut res
table(dataset1_tbl$c400bb)
#Torno a fer el mateix amb el valor 7 pel 3, pero abans li canvio el valor 3 pel 2
dataset1_tbl$c400bb <- ifelse(dataset1_tbl$c400bb == 3 ,2,dataset1_tbl$c400bb)
table(dataset1_tbl$c400bb)#veig que tot ok
#canvio el 7 pel 3
dataset1_tbl$c400bb <- ifelse(dataset1_tbl$c400bb == 7 ,3,dataset1_tbl$c400bb)
table(dataset1_tbl$c400bb)#veig que tot ok
#vale,ara torno a posar les etiquetes als valors
dataset1_tbl$c400bb <- labelled(dataset1_tbl$c400bb,labels = c("Treballa" = 1, "No treballa" = 2,
                                                               "Està temporalment de baixa" = 3,"No ho sap" = 98,"No contesta" = 99),
                                label = "Situació laboral actual (enquestat/ada)")

#verificacions finals i ja puc fer el ultim pas
glimpse(dataset1_tbl$c400bb)
head(dataset1_tbl$c400bb)
class(dataset1_tbl$c400bb)
table(dataset1_tbl$c400bb)
#traspaso una variable a una latre:
names(dataset1_tbl)
table(dataset1_tbl$c400b)
dataset1_tbl$c400b <- dataset1_tbl$c400bb
table(dataset1_tbl$c400b)
#ara nomes em queda eliminar la variable c400bb
dataset1_tbl$c400bb <- NULL


# el mateix per dataset2 :)
names(dataset1_tbl)
names(dataset2_tbl)
head(dataset2_tbl$C401)
head(dataset1_tbl$c400)#la variable tal i com estava abans de les modificacions
head(dataset1_tbl$c400b)
#veig que esta igual que la varible c400b del dataset1, i que nomes haig de posar la mateixa
#etiqueta a la explicació de la variable
var_label(dataset2_tbl$C401) <- "Situació laboral actual (enquestat/ada)"
#decideixo eliminar la variable "C410. Població no activa i aturats (enquestat/ada)", que he utilitzat
#per crear la variable c400b , una creacio modificant la c400 amb ajuda de la c410.
dataset1_tbl$c410 <- NULL
#Elimino tambe la c400 per evitar problemes posteriors, i per tenir el mateix nombre de variables
#a cada dataset i veure que no em passi
dataset1_tbl$c400 <- NULL



#9
#
##La c320 del dataset1  /La C800 del dataset2
#"C320. Classe social subjectiva" i "C800. Autoubicació en la classe social"

names(dataset1_tbl)
names(dataset2_tbl)
#head(mydata1$c320)
head(dataset1_tbl$c320)
#head(mydata2$C800)
head(dataset2_tbl$C800)



#veig que haure de canviar-lis les etiquetes i ampliar el NS / NC de la var C320. Per la 
#resta veig que la configuració es similar i compatible. Decideixo posar com a etiqueta 
#"Classe social de l'enquestat/ada", ja que es el terme principal i el comu a les dues variables:

dataset1_tbl$c320 <- labelled(dataset1_tbl$c320,labels = c("Classe baixa" = 1, "Classe mitjana-baixa" = 2,
                                                           "Classe mitjana" = 3, "Classe mitjana-alta" = 4,"Classe alta" = 5,"No ho sap" = 98, "No contesta" = 99),
                              label = "classe social de l'enquestat/ada")

head(dataset1_tbl$c320)

#licanvio l'etiqueta a la variable C800
var_label(dataset2_tbl$C800) <- "classe social de l'enquestat/ada"
head(dataset2_tbl$C800)


#10
#
###La c600 del dataset1  /La C600 del dataset2


head(dataset1_tbl$c600)
head(dataset2_tbl$C600)

#veig que la codificació es la mateixa pero amb les etiquetes lleugerement canviades.
#les homogeritzare cap a la versió mes moderna. NS/NC igual que sempre.

dataset1_tbl$c600 <- labelled(dataset1_tbl$c600,labels = c("Casat/ada" = 1, "Amb parella estable" = 2,
                                                           "Divorciat/ada" = 3, "Separat/ada" = 4,"Vidu/a" = 5,"Solter/a" = 6,"No ho sap" = 98, "No contesta" = 99),
                              label = "Estat civil de l'enquestat/ada")

head(dataset1_tbl$c600)
#licanvio l'etiqueta a la variable C600 del dataset2
var_label(dataset2_tbl$C600) <- "Estat civil de l'enquestat/ada"
head(dataset2_tbl$C600)



names(dataset1_tbl)
names(dataset2_tbl)
head(dataset1_tbl)
head(dataset2_tbl)
glimpse(dataset1_tbl)
glimpse(dataset2_tbl)

####
#
# Finalment tenim dataset1_tbl i dataset2_tbl
#
####

############################################################
#
#ACABAR DE PREPARAR LES VARIABLES IDENTIFICATIVES, AFEGINT PROVI I ARREGLANT GR_EDAT
#
############################################################

names(dataset1_tbl)
names(dataset2_tbl)

#Igualar les variables gr_edat2 a GR_EDAT
source("src/gr_edat2.R")
table(dataset1_tbl$gr_edat)
sum(table(dataset1_tbl$gr_edat))
table(dataset1_tbl$gr_edat2)
sum(table(dataset1_tbl$gr_edat2))
var_label(dataset1_tbl$gr_edat2) <- "Grups d'edat"
var_label(dataset2_tbl$GR_EDAT) <- "Grups d'edat"
table(dataset2_tbl$GR_EDAT)
head(dataset2_tbl$GR_EDAT)
head(dataset1_tbl$gr_edat2)
#veig que no te etiquetes els nivells,li posso:
library(sjlabelled)
val_labels(dataset1_tbl$gr_edat2) <- c("De 18 a 24 anys"= 1,"De 25 a 34 anys"= 2,"De 35 a 49 anys"=3,"De 50 a 64 anys"=4,"Mès de 64 anys"=5)
val_labels(dataset1_tbl$gr_edat2)
#table(dataset1_tbl$GR_EDAT)
names(dataset1_tbl)
names(dataset2_tbl)


#ara fem el mateix amb la variable provi i PROVI iguals
source("src/PROVI.R")
table(dataset1_tbl$provi)
table(dataset2_tbl$PROVI)
var_label(dataset1_tbl$provi)
var_label(dataset2_tbl$PROVI)
head(dataset2_tbl$PROVI)
head(dataset1_tbl$provi)
names(dataset1_tbl)
names(dataset2_tbl)


#veiem la resta de variables identificatives com tenen les etiquetes de variable
var_label(dataset1_tbl$ordre) <- "Número d'ordre de registre "
var_label(dataset2_tbl$ORDRECINE) <- "Número d'ordre de registre "
var_label(dataset1_tbl$POND_GEO) <- "Ponderació taules"
var_label(dataset2_tbl$PONDERA) <- "Ponderació taules"
var_label(dataset1_tbl$BOP_num)
var_label(dataset2_tbl$BOP_NUM)
var_label(dataset1_tbl$any)
var_label(dataset2_tbl$ANY)
var_label(dataset1_tbl$sexe)
var_label(dataset2_tbl$SEXE) <- "Sexe"
var_label(dataset1_tbl$edat)
var_label(dataset2_tbl$EDAT) <- "Edat"
var_label(dataset1_tbl$gr_edat)
var_label(dataset2_tbl$GR_EDAT)
var_label(dataset1_tbl$mes)
var_label(dataset2_tbl$MES)
var_label(dataset1_tbl$provi)
var_label(dataset2_tbl$PROVI)

#comprovo les etiquetes de les variables explicatives
var_label(dataset1_tbl$p4) <- "Valoració de la situació econòmica actual de Catalunya"
var_label(dataset2_tbl$P4) <- "Valoració de la situació econòmica actual de Catalunya"
var_label(dataset1_tbl$p9) <- "Valoració de la situació política actual de Catalunya"
var_label(dataset2_tbl$P9) <- "Valoració de la situació política actual de Catalunya"
var_label(dataset1_tbl$p18) <- "Satisfacció amb el funcionament de la nostra democràcia"
var_label(dataset2_tbl$P18) <- "Satisfacció amb el funcionament de la nostra democràcia"
var_label(dataset1_tbl$p27) <- "Valoració del nivell d'autonomia de Catalunya"
var_label(dataset2_tbl$P29) <- "Valoració del nivell d'autonomia de Catalunya"
var_label(dataset1_tbl$p28) <- "Relació entre Catalunya i Espanya"
var_label(dataset2_tbl$P30) <- "Relació entre Catalunya i Espanya"
var_label(dataset1_tbl$p30_cens) <- "Record de vot al Parlament de Catalunya sobre cens"
var_label(dataset2_tbl$P38_CENS) <- "Record de vot al Parlament de Catalunya sobre cens"
var_label(dataset1_tbl$c320)
var_label(dataset2_tbl$C800)
var_label(dataset1_tbl$c600)
var_label(dataset2_tbl$C600)
var_label(dataset1_tbl$c400b) <- "Situació laboral actual (enquestat/ada)"
var_label(dataset2_tbl$C401) <- "Situació laboral actual (enquestat/ada)"


#ja que estic possat decideixo ordenarles i canviarlis el nom a les variables:
#torno a fer una vista general de les dades:
look_for(dataset1_tbl)
look_for(dataset2_tbl)

#primer renombrare les variables amb el mateix nom

names(dataset1_tbl)
names_dataset1_tbl <- c("ORDRE","PONDERACIÓ","Nº_ENQUESTA","ANY_ENQUESTA",
                        "SEXE_ENQUESTAT","EDAT_ENQUESTAT","G_EDAT","MES_ENQUESTA","VALORACIÓ_SITUACIÓ_ECONÒMICA",
                        "VALORACIÓ_SITUACIÓ_POLÍTICA","SATISFACCIÓ_AMB_LA_DEMOCRÀCIA","VALORACIÓ_NIVELL_AUTONOMIA",
                        "RELACIÓ_CATALUNYA_ESPANYA","RECORD_VOT_PARLAMENT","LLOC_NAIXEMENT_ENQUESTAT",
                        "CLASSE_SOCIAL_ENQUESTAT","ESTAT_CIVIL_ENQUESTAT","SITUACIÓ_LABORAL_ENQUESTAT","GR_EDAT","PROVÍNCIA")

colnames(dataset1_tbl) <- names_dataset1_tbl

names(dataset2_tbl)
names_dataset2_tbl <- c("ORDRE","PONDERACIÓ","Nº_ENQUESTA","ANY_ENQUESTA",
                        "SEXE_ENQUESTAT","EDAT_ENQUESTAT","GR_EDAT","MES_ENQUESTA","VALORACIÓ_SITUACIÓ_ECONÒMICA",
                        "VALORACIÓ_SITUACIÓ_POLÍTICA","SATISFACCIÓ_AMB_LA_DEMOCRÀCIA","VALORACIÓ_NIVELL_AUTONOMIA",
                        "RELACIÓ_CATALUNYA_ESPANYA","RECORD_VOT_PARLAMENT","LLOC_NAIXEMENT_ENQUESTAT","SITUACIÓ_LABORAL_ENQUESTAT",
                        "CLASSE_SOCIAL_ENQUESTAT","ESTAT_CIVIL_ENQUESTAT","PROVÍNCIA")

colnames(dataset2_tbl) <- names_dataset2_tbl




#######################
#
#Acabem B.R amb les nostres 2 bases ja seleccionades i preparades
#Amb les variables elegides i similars per poder ser ajuntades en C.R
#
#######################

########################################################################################
#
# ARA A FER LA GRAN BASE DE DADES AMB LES BASES PETITES 
#
########################################################################################




