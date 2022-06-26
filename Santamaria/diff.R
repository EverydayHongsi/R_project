setwd('/Users/hongsi/Desktop/Rprogramming/mountain')

Sys.setlocale("LC_ALL","ko_KR.UTF-8")
# source("./mountainscript.R")

#폴더리스트 확보
dirslist <- list.dirs(getwd())
dirslist <- dirslist[-1]

# 빈프레임
result <- data.frame()

for(i in dirslist[seq(1,5864,2)]){

	print("시작")
	# 위치로 이동
	setwd(i)
	print(paste(i,"시작합니다."))
	# 처리할 파일 확보
	filec <- list.files(getwd())
	filenum <- grep('PMNTN_[^A-Z]*[가-힣]*\\.shp$',filec)
	shpfile <- filec[filenum]

	print(shpfile)
	#읽기
	shp <- rgdal::readOGR(paste('./',shpfile,sep=""))
	
	#안에 들어있는 데이터 확보
	a <- shp@data

	# 난이도 다시계산
	jumsu <- 0
	diff <- 0

	for(j in 1:length(a[,7])){
	switch (a[j,7],
		'쉬움' = diff <- 1,
		'중간' = diff <- 2,
		'어려움' = diff <- 3,
		diff <- 0)
		jumsu <- jumsu + (a[j,6] * diff)
	}

	result[i,'jumsu'] <- jumsu



	#내리막비율

	first <- a[1,]

	cut <- a[,6:9]
	cut <- cut[-2]

	cut$PMNTN_UPPL <- as.numeric(cut$PMNTN_UPPL)
	cut$PMNTN_GODN <- as.numeric(cut$PMNTN_GODN)

	cutsum <- colSums(cut)

	first[1,6] <- cutsum[1]
	first[1,8] <- cutsum[2]
	first[1,9] <- cutsum[3]

	first$PMNTN_UPPL <- as.numeric(first$PMNTN_UPPL)
	first$PMNTN_GODN <- as.numeric(first$PMNTN_GODN)
	first$PMNTN_LT <- as.numeric(first$PMNTN_LT)

	first[,"plat"] = sum(cut[cut$PMNTN_UPPL == cut$PMNTN_GODN,]$PMNTN_LT)
	first[,"down"] = sum(cut[cut$PMNTN_UPPL < cut$PMNTN_GODN,]$PMNTN_LT)

	first[,"upper_ratio"] = (first$PMNTN_LT[1] - (first$plat[1] + first$down[1]))  / first$PMNTN_LT[1]
	first[,"plat_ratio"] = first$plat[1] / first$PMNTN_LT[1]


	result[i,'down'] <- first$down[1]
	result[i,'upper_ratio'] <- first$upper_ratio[1]


	print("하나 끝")

}



setwd('/Users/hongsi/Desktop/Rprogramming/mountain')
#print(result)
write.csv(result, file="result_diff_upper.csv", row.names=FALSE, fileEncoding = 'utf-8' )






