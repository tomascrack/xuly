#1
########################################
#
#Coses que fer:
#
########################################
#Explorar les dades brutes
#Ordenar les dades 
#Preparar les dades pels analisis
#Possarles totes juntes


#Per instalar i llegir les llibreries necesaries per fer els calculs:
#source("src/Install-libraries.R")#Per instalar
source("src/libraries.R")#Per lleguir

#per llegir les dades originals, ja guardades a la carpeta "data":
mydata1 <- read_sav("data/Microdades anonimitzades fusio cine telf.sav")
mydata2 <- read_sav("data/Microdades anonimitzades fusio cine presencial.sav")


###############################################################################
#
# Observar les bases de dades, visio general
#
###############################################################################

#Tipus de dades:
class(mydata1)#aqui veig que es un tibble object
class(mydata2)

# options sobre els tibbles
options(tibble.print_max = 10, tibble.print_min = 5)

#veig com son les dades
dim(mydata1)
dim(mydata2)
length(mydata1)
#str(mydata1)
#str(mydata2)

#Nom de les variables
names(mydata1)
names(mydata2)


##################################################################################
#
# Ara juntare les variables IDENTIFICATIVES comunes a les dues bases
#
#################################################################################

names(mydata1)
#exemple de busqueda:
grep("^mes",names(mydata1),T)
grep("provi",names(mydata1))
dataset1 <- mydata1[c("ordre","POND_GEO","BOP_num","any","sexe","edat","gr_edat","mes","provi")]
#verifiquem:
head(dataset1)#observo que he fet
is.data.frame(dataset1)#verifico que sigui de la clase d'objecte que vull

dataset2 <- mydata2[c("ORDRECINE","PONDERA","BOP_NUM","ANY","SEXE","EDAT","GR_EDAT","MES","PROVI")]
head(dataset2)
is.data.frame(dataset2)



########################################################################
#
# Veure na's en les variables IDENTIFICATIVES
#
########################################################################

na.vec <- which(!complete.cases(mydata1$ordre))
table(na.vec)
#is.na(mydata1$ordre)
na.vec <- which(!complete.cases(mydata1$POND_GEO))
table(na.vec)
na.vec <- which(!complete.cases(mydata1$BOP_num))
table(na.vec)
na.vec <- which(!complete.cases(mydata1$any))
table(na.vec)
na.vec <- which(!complete.cases(mydata1$sexe))
table(na.vec)
na.vec <- which(!complete.cases(mydata1$edat))
table(na.vec)
na.vec <- which(!complete.cases(mydata1$gr_edat))
table(na.vec)
na.vec <- which(!complete.cases(mydata1$mes))
table(na.vec)
na.vec <- which(!complete.cases(mydata1$provi))
table(na.vec)
#NO HI HA NA'S EN LES VARIABLES IDENTIFICATIVES DE LA 1 BASE DE DADES

# dataset2 <- mydata2[c("ORDRECINE","PONDERA","BOP_NUM","ANY","SEXE","EDAT","GR_EDAT","MES","PROVI")]

names(mydata2)
na.vec <- which(!complete.cases(mydata2$ORDRECINE))
#View(mydata2[20337:21840,1:4])# te faltants entre 20339-21840 i despres no ho te correctament ordenat
table(is.na(mydata2$ORDRECINE))
#aquesta variable no importa que tingui faltants,es un comptador
na.vec <- which(!complete.cases(mydata2$PONDERA))
table(na.vec)
na.vec <- which(!complete.cases(mydata2$BOP_NUM))
table(na.vec)
na.vec <- which(!complete.cases(mydata2$ANY))
table(na.vec)
na.vec <- which(!complete.cases(mydata2$SEXE))
table(na.vec)
na.vec <- which(!complete.cases(mydata2$EDAT))
table(na.vec)
na.vec <- which(!complete.cases(mydata2$GR_EDAT))
table(na.vec)
na.vec <- which(!complete.cases(mydata2$MES))
table(na.vec)
na.vec <- which(!complete.cases(mydata2$PROVI))
table(na.vec)

# TAMPOC HI HA FALTANTS EN LA BASE DE DADES 2





##########################################################################
#
# Ara vull trobar i seleccionar les variables SELECCIONADES
# a partir dels questionaris:
#
##########################################################################



#"p4"
names(mydata1)
names(mydata1[,c(grep("^p4",names(mydata1)))])
head(mydata1$p4)
class(mydata1$p4)
#head(mydata1$p40)
grep("^p4",names(mydata1))
glimpse(mydata1[,56])
#View(mydata1[,56:59])
table(mydata1[,56])
na_p4a <- is.na(mydata1[,56])
table(na_p4a)#veig 6300 na's

#
names(mydata2)
names(mydata2[,c(grep("^P4",names(mydata2)))])
head(mydata2$P4)
class(mydata2$P4)
grep("P4",names(mydata2))
glimpse(mydata2[,212])
#View(mydata2[,212])
table(mydata2[,212])
na_p4b <- is.na(mydata2[,212])
table(na_p4b)#no te na's

#"p9"
names(mydata1)
names(mydata1[,c(grep("^p9",names(mydata1)))])
head(mydata1$p9)
class(mydata1$p9)
grep("^p9",names(mydata1))
glimpse(mydata1[,61])
#View(mydata1[,61])
table(mydata1$p9)
na_p9a <- is.na(mydata1[,61])
table(na_p9a)

#
names(mydata2)
names(mydata2[,c(grep("^P9",names(mydata2)))])
head(mydata2$P9)
class(mydata2$P9)
grep("P9",names(mydata2))
glimpse(mydata2[,217])
#View(mydata2[,217])
table(mydata2$P9)
na_p9b <- is.na(mydata2[,217])
table(na_p9b)

#"p18"

names(mydata1)
names(mydata1[,c(grep("^p18",names(mydata1)))])
head(mydata1$p18)
class(mydata1$p18)
grep("p18",names(mydata1))
glimpse(mydata1[,88])
#View(mydata1[,88])
#summary(mydata1$p18)
table(mydata1$p18)
#sum(table(mydata1$p18))
na_p18a <- is.na(mydata1[,88])
table(na_p18a)

#
names(mydata2)
names(mydata2[,c(grep("^P18",names(mydata2)))])
head(mydata2$P18)
class(mydata2$P18)
grep("P18",names(mydata2))
glimpse(mydata2[,271])
#View(mydata2[,271])
table(mydata2$P18)
na_p18b <- is.na(mydata2[,271])
table(na_p18b)

#"p29"

names(mydata1)
names(mydata1[,c(grep("^p29",names(mydata1)))])
names(mydata1[,c(grep("^p27",names(mydata1)))])
head(mydata1$p27)
class(mydata1$p27)
grep("p27",names(mydata1))
glimpse(mydata1[170])
#View(mydata1[,170])
#table(mydata1$p27)
na_p29a <- is.na(mydata1[,170])
table(na_p29a)


names(mydata2)
names(mydata2[,c(grep("^P29",names(mydata2)))])
head(mydata2$P29)
class(mydata2$P29)
grep("P29",names(mydata2))
glimpse(mydata2[,380])
#View(mydata2[,380])
#table(mydata2$P29)
na_p29b <- is.na(mydata2[,380])
table(na_p29b)


#p30

names(mydata1)
names(mydata1[,c(grep("^p28",names(mydata1)))])
head(mydata1$p28)
class(mydata1$p28)
grep("p28",names(mydata1))
glimpse(mydata1[171])
#View(mydata1[,171])
#table(mydata1$p27)
na_p30a <- is.na(mydata1[171])
table(na_p30a)


names(mydata2)
names(mydata2[,c(grep("^P30",names(mydata2)))])
head(mydata2$P30)
class(mydata2$P30)
grep("P30",names(mydata2))
glimpse(mydata2[,381])
#View(mydata2[,381])
#table(mydata2$P30)
na_p30b <- is.na(mydata2[,381])
table(na_p30b)


#p38 CENS

names(mydata1)
names(mydata1[,c(grep("^p3",names(mydata1)))])
head(mydata1$p30_cens)
class(mydata1$p30_cens)
grep("p30_cens",names(mydata1))
glimpse(mydata1[274])
#View(mydata1[,272:274])
#table(mydata1$p30_cens)
na_p38a <- is.na(mydata1[274])
table(na_p38a)


names(mydata2)
names(mydata2[,c(grep("^P38",names(mydata2)))])
head(mydata2$P38_CENS)
class(mydata2$P38_CENS)
grep("P38_CENS",names(mydata2))
glimpse(mydata2[,473:474])
#View(mydata2[,473:474])
table(mydata2$P38_CENS)
head(mydata2$P38_CENSR)
table(mydata2$P38_CENSR)
na_p38b <- is.na(mydata2$P38_CENS)
table(na_p38b)

#M'agradaria filtrar per l'any @@
#mydata2 %>% 
#filter(mydata2$ANY >= 2015)
#starwars %>% 
#filter(species == "Droid")
#


#C100 

names(mydata1)
names(mydata1[,c(grep("^c100",names(mydata1)))])
head(mydata1$c100)
class(mydata1$c100)
grep("c100",names(mydata1))
glimpse(mydata1[474])
#View(mydata1[,474])
#table(mydata1$c100)
na_p100a <- is.na(mydata1[,474])
table(na_p100a)


names(mydata2)
names(mydata2[,c(grep("^C100",names(mydata2)))])
head(mydata2$C100)
class(mydata2$C100)
grep("C100",names(mydata2))
glimpse(mydata2[,769])
#View(mydata2[,769])
table(mydata2$C100)
head(mydata2$C100)
na_p100b <- is.na(mydata2$C100)
table(na_p100b)


#C401

names(mydata1)
names(mydata1[,c(grep("^c4",names(mydata1)))])
head(mydata1$c400)
class(mydata1$c400)
head(mydata1$c410)
class(mydata1$c410)
grep("c400",names(mydata1))
grep("c410",names(mydata1))
glimpse(mydata1[480])
#View(mydata1[,480:481])
#table(mydata1$c400)
##head(mydata2$C401)
#table(mydata2$C401)
#table(mydata1$c410)
na_c400a <- is.na(mydata1$c400)
table(na_c400a)
na_c410a <- is.na(mydata1$c410)
table(na_c410a)

names(mydata2)
names(mydata2[,c(grep("^C4",names(mydata2)))])
head(mydata2$C401)
table(mydata2$C401)
#head(mydata2$C401A)
head(mydata2$C401B)
head(mydata2$C440)
grep("C401",names(mydata2))
glimpse(mydata2[,784])
#View(mydata2[,784])
table(mydata2$C401)
head(mydata2$C401)
class(mydata2$C401)
na_c401b <- is.na(mydata2$C401)
table(na_c401b)
#head(mydata2$C401B)#Població ocupada
#head(mydata2$C440)#Sectors treballadors

#C800

names(mydata1)
names(mydata1[,c(grep("^c8",names(mydata1)))])
#no apareix, aleshores abans de buscar per label, miro el llóc on estaven les
#anterior variables 
#View(mydata1[,490:533])
names(mydata1[,c(grep("^c320",names(mydata1)))])
head(mydata1$c320)
class(mydata1$c320)
grep("c320",names(mydata1))
glimpse(mydata1[529])
#View(mydata1[,529])
na_c800a <- is.na(mydata1$c320)
table(na_c800a)
#table(mydata1$c320)





names(mydata2)
names(mydata2[,c(grep("^C8",names(mydata2)))])
head(mydata2$C800)
class(mydata2$C800)
grep("C800",names(mydata2))
glimpse(mydata2[,796])
#View(mydata2[,790:799])
na_c800b <- is.na(mydata2$C800)
table(na_c800b)
#table(mydata2$C800)
#head(mydata2$C800)


#C600 

names(mydata1)
names(mydata1[,c(grep("^c6",names(mydata1)))])
head(mydata1$c600)
class(mydata1$c600)
#head(mydata1$c610)
grep("c600",names(mydata1))
glimpse(mydata1[510])
#View(mydata1[,510])
na_c600a <- is.na(mydata1$c600)
table(na_c600a)
#table(mydata1$c600)


names(mydata2)
names(mydata2[,c(grep("^C6",names(mydata2)))])
head(mydata2$C600)
class(mydata2$C600)
grep("C600",names(mydata2))
glimpse(mydata2[,790])
#View(mydata2[,790])
na_c600b <- is.na(mydata2$C600)
table(na_c600b)





#Si tenim na's:

#com tinc na's en les variables : p4 en mydata1
#                                 p9 en mydata1
#vaig a veure que pasa...

complete.cases(mydata1$p4)
complete.cases(mydata1$p9)
which(complete.cases(mydata1$p4))#retorna les files on tinc els casos complets
which(complete.cases(mydata1$p9))
which(!complete.cases(mydata1$p4))#retorna les files on NO tinc els casos complets
which(!complete.cases(mydata1$p9))
na.vec <- which(!complete.cases(mydata1$p4))
table(na.vec)#aqui veig el numero de fila on hi ha faltants
table(is.na(mydata1$p4))#aqui veig quants nhi ha de faltants, 6300
na.vec <- which(!complete.cases(mydata1$p9))
table(na.vec)
table(is.na(mydata1$p9))#6300 faltants
#names(mydata1)
#View(mydata1[2100:8401,c(5,56)])
#names(mydata2)
#View(mydata1[2100:8401,c(5,61)])
#podria eliminarlos,suposant ke trec els na de totes les diverses variables
#i no nomes de p4
#na.vec.g <-which(!complete.cases(mydata1))

###########3
#
# Resumint: la variable p4 i p9 de la base 2 tenen 6300 faltants 
#           la variable ORDRECINE te 1500  faltants i despres desordre a l'edicio 44 i 45
#           Tot aiço a la base 2         
#
######

##################################################################
#
# Fins aqui una 1ª visual de les dades i la busqueda de les variables
# dintre del laberint, ara passare a preprocessing
#
################################################################
