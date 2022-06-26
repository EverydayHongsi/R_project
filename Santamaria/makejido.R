setwd('/Users/hongsi/Desktop/Rprogramming/mountain')


Sys.setlocale("LC_ALL","ko_KR.UTF-8")



dirslist <- list.dirs(getwd())
dirslist <- dirslist[-1]


for(i in dirslist[seq(2,5864,2)]){

	print(i)
	print("시작")
	# 위치로 이동
	setwd(i)
	print(paste(i,"시작합니다."))

	filec <- list.files(getwd())
	filenum <- grep('PMNTN_[^A-Z]*[가-힣]*\\.gpx$',filec)
	gpxfile <- filec[filenum]



	st1 <- strsplit(filec[filenum],split="_")
	stnum <- grep('[0-9]*\\.gpx$',st1[[1]])
	st2 <- st1[[1]][stnum]

	mntn_code <- strsplit(st2,split="\\.")[[1]][1]


	gpx_data <- st_read(gpxfile, layer = "tracks")

	m = mapview(gpx_data, color="blue", lwd =4, alpha=0.7, label = FALSE, popup = FALSE)

	mapshot(m, url = paste0("/Users/hongsi/Desktop/Rprogramming/jidoList/", mntn_code, ".html"))


}

