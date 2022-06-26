
counter <- 1

for (i in data01$도로명주소){
	do <- strsplit(i, " ")[[1]][1]
	#서울특별시

	sigungu <- strsplit(i, " ")[[1]][2]
	#해운대구 기장군 제주도시


	switch (do,

	  '서울특별시' = data01[counter, "doExpend"] <- "소울 서우",

	  '전라남도' = data01[counter, "doExpend"] <- "전남 전라도",

	  '전라북도' = data01[counter, "doExpend"] <- "전북 전라도",

	  '경상남도' = data01[counter, "doExpend"] <- "경남 경상도",

	  '경상북도' = data01[counter, "doExpend"] <- "경북 경상도",

	  '충청북도' = data01[counter, "doExpend"] <- "충북 충청도 충부",

	  '충청남도' = data01[counter, "doExpend"] <- "충남 충청도 충나",

		'강원도' = data01[counter, "doExpend"] <- "강워 강언",
		'경기도' = data01[counter, "doExpend"] <- "경ㄱ 경귀",
		
		'제주특별자치도' = data01[counter, "doExpend"] <- "제주도 제주시",
		'세종특별자치시' = data01[counter, "doExpend"] <- "세종시",
		'부산광역시' = data01[counter, "doExpend"] <- "부산시",
		'인천광역시' = data01[counter, "doExpend"] <- "인천시",
		'대구광역시' = data01[counter, "doExpend"] <- "대구시",	
		'대전광역시' = data01[counter, "doExpend"] <- "대전시",
		'광주광역시' = data01[counter, "doExpend"] <- "광주시",
	  	'울산광역시' = data01[counter, "doExpend"] <- "울산시",

	  	print(do)	

	  	)



	data01[counter, "do2doro"] <- substr(do,1,2)

	data01[counter, "sigunguDoro"] <- substr(sigungu,1,nchar(sigungu)-1)

	counter <- counter + 1


}

counter <- 1


for (i in data01$지번주소){
	do <- strsplit(i, " ")[[1]][1]
	#서울특별시

	sigungu <- strsplit(i, " ")[[1]][2]
	#해운대구 기장군 제주도시

	switch (do,

	  '서울특별시' = data01[counter, "doExpendJ"] <- "소울 서우",

	  '전라남도' = data01[counter, "doExpendJ"] <- "전남 전라도",

	  '전라북도' = data01[counter, "doExpendJ"] <- "전북 전라도",

	  '경상남도' = data01[counter, "doExpendJ"] <- "경남 경상도",

	  '경상북도' = data01[counter, "doExpendJ"] <- "경북 경상도",

	  '충청북도' = data01[counter, "doExpendJ"] <- "충북 충청도 충부",

	  '충청남도' = data01[counter, "doExpendJ"] <- "충남 충청도 충나",

		'강원도' = data01[counter, "doExpendJ"] <- "강워 강언",
		'경기도' = data01[counter, "doExpendJ"] <- "경ㄱ 경귀",
		
		'제주특별자치도' = data01[counter, "doExpendJ"] <- "제주도 제주시",
		'세종특별자치시' = data01[counter, "doExpendJ"] <- "세종시",
		'부산광역시' = data01[counter, "doExpendJ"] <- "부산시",
		'인천광역시' = data01[counter, "doExpendJ"] <- "인천시",
		'대구광역시' = data01[counter, "doExpendJ"] <- "대구시",	
		'대전광역시' = data01[counter, "doExpendJ"] <- "대전시",
		'광주광역시' = data01[counter, "doExpendJ"] <- "광주시",
	  	'울산광역시' = data01[counter, "doExpendJ"] <- "울산시",
	  	print(do)	
	  	)

	data01[counter, "do2jibun"] <- substr(do,1,2)
	data01[counter, "sigunguJibun"] <- substr(sigungu,1,nchar(sigungu)-1)

	counter <- counter + 1

}


