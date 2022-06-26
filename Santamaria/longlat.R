setwd('/Users/hongsi/Desktop/Rprogramming/mountain')

Sys.setlocale("LC_ALL","ko_KR.UTF-8")

library(sp)
library(rgdal)
library(dplyr)
library(ggplot2)

dirslist <- list.dirs(getwd())
dirslist <- dirslist[-1]

to_crs <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs")
from_crs <- CRS("+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=600000 +ellps=GRS80 +units=m")

longlat <- data.frame()


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

	#shp_t <- spTransform(shp,to_crs)
	shp_result <- fortify(shp)

	longlat <- rbind(longlat,shp_result[1:2][1,])

}


setwd('/Users/hongsi/Desktop/Rprogramming/mountain')
#print(result)
write.csv(longlat, file="longlat.csv", row.names=FALSE, fileEncoding = 'cp949' )



