rm(list=ls())
getwd()
source("../../parsing_POO_substances.R")
test <- new(Class="Substances","../TXT/index_substances122012.txt")
length(test$substances)
test$retirer_premieres_lignes()
test$substances[1:10]
test$substances <- test$substances[6:length(test$substances)]
test$substances[1]

test$substances_to_df()
df <- test$df
test$retirer_lignes_inutiles()
test$retirer_balises()

test$ajout_famille_propre()
test$explose_famille()
test$ajout_parenthese_fermante()
test$pb_gel()

##
index_substances122012 <- test$df_decompose
write.table (index_substances122012, "../CSV/index_substances122012.csv",sep="\t",col.names=T, row.names=F, quote=T)
molecules_seules <- subset (index_substances122012, famille =="Interactions en propre seulement")
molecules_seules$famille <- NULL
mol_famille_thesaurus122012 <- subset (index_substances122012, famille !="Interactions en propre seulement")
write.table (molecules_seules, "../CSV/mol_thesaurus_seules122012.csv",sep="\t",col.names=T, row.names=F, quote=T)
write.table (mol_famille_thesaurus122012, "../CSV/mol_famille_thesaurus122012.csv",sep="\t",col.names=T, row.names=F, quote=T)