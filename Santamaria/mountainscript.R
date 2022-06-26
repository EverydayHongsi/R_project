
setwd('/Users/hongsi/Desktop/Rprogramming/mountain')

Sys.setlocale("LC_ALL","ko_KR.UTF-8")
# source("./mountainscript.R")

#폴더리스트 확보
dirslist <- list.dirs(getwd())
dirslist <- dirslist[-1]

# 빈프레임
#result <- data.frame()


for(i in dirslist){

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




	serchkey <- unique(a[,4])
	diff <- names(table(a[,7]))[which.max(table(a[,7]))]
	tojil <- names(table(a[,10]))[which.max(table(a[,10]))]


	pas <- ""
	serchkey <- na.omit(serchkey)
	attr(serchkey,"na.action") <- NULL


	for(i in serchkey){
	  if (nchar(pas)==0){
		 pas <- i 
		}
	  else {
		pas<- paste(pas,i,sep=",")

		}
	}


	first <- a[1,]

	ifelse(length(tojil),first[1,4] <- pas,'pas NA')
	ifelse(length(tojil),first[1,7] <- diff,'난이도 NA')
	ifelse(length(tojil),first[1,10] <- tojil,'토질 NA')

	cut <- a[,6:9]
	cut <- cut[-2]


	cut$PMNTN_UPPL <- as.numeric(cut$PMNTN_UPPL)
	cut$PMNTN_GODN <- as.numeric(cut$PMNTN_GODN)

	
	cutsum <- colSums(cut)

	first[1,6] <- cutsum[1]
	first[1,8] <- cutsum[2]
	first[1,9] <- cutsum[3]


	# 구코드 없는것 추가
	if(length(grep("MNTN_ID",names(first)))== 0){
			first[,"MNTN_ID"] <- 0
	}

	# 올라가는 속도 = 내려가는 속도 => 평지
	first[,"plat"] = sum(cut[cut$PMNTN_UPPL == cut$PMNTN_GODN,]$PMNTN_LT)

	first$PMNTN_UPPL <- as.numeric(first$PMNTN_UPPL)
	first$PMNTN_GODN <- as.numeric(first$PMNTN_GODN)
	first$PMNTN_LT <- as.numeric(first$PMNTN_LT)

	first[,"plat_ratio"] = first$plat[1] / first$PMNTN_LT[1]


	first[,"altitude_ratio"] = first$PMNTN_GODN[1] /first$PMNTN_UPPL[1]




	if (nrow(result) == 0 ){
		result <- first
	} else {

		result <- rbind(result,first)
	}

	print("하나 끝")
	
}

setwd('/Users/hongsi/Desktop/Rprogramming/mountain')
#print(result)
write.csv(result, file="result.csv", row.names=FALSE, fileEncoding = 'cp949' )


