
for (i in 1:dim(newresult514)[1]){

	newresult514[i,'realJumsu'] <- round(newresult514[i,'jumsu'] - newresult514[i,'PMNTN_LT'],4)

}