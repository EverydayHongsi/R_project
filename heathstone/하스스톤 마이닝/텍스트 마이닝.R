
txt <- readLines("has.txt")

txt<- txt[grep("[[]",txt)]

txt <- strsplit(txt,"[ ]")



for(x in 1:71){txt[x] <- paste(txt[[x]][length(txt[[x]])-3],txt[[x]][length(txt[[x]])-2],txt[[x]][length(txt[[x]])-1])}

for(x in 1:71){txt[x]<-strsplit(txt[[x]],"[.]")}

for(x in 1:71) {txt[x]<- txt[[x]][length(txt[[x]])]}

for(x in 1:71){txt[x] <-strsplit(txt[[x]]," ")}

for(x in 1:71){txt[x] <-paste(txt[[x]][grep("[A-Z,°¡-ÆR]",txt[[x]])],collapse=" ")}




write.table(unlist(txt),"card.txt",row.names=FALSE,quote = FALSE)



txt <- readLines("has.txt")

txt<- txt[grep("[\t]",txt)]

txt <- strsplit(txt,"[ ]")


for(x in 1:71){txt[[x]]<-txt[[x]][grep("[\t]",txt[[x]])]}

for(x in 1: 71){txt[[x]]<-substr(txt[[x]],1,3)}


write.table(unlist(txt),"card.txt",row.names=FALSE,quote = FALSE)
