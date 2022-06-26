
for (i in 1:dim(result514)[1]){

	if (is.na(result514$do2doro[i])){
		result514[i,'onejuso'] <- result514$do2jibun[i]
	}
	else{
		result514[i,'onejuso'] <- result514$do2doro[i]
	}

	sub1 <- gsub('구간',' ',result514$PMNTN_NM[i])
	sub2 <- gsub(',',' ',sub1)
	sub3 <- gsub('-',' ',sub2)
	sub4 <- gsub('입구',' ',sub3)

	result514[i,4] <- sub4

}