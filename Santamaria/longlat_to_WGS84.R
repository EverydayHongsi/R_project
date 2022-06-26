

longlat <- data.frame()

to_crs <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs")
from_crs <- CRS("+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=600000 +ellps=GRS80 +units=m")


convertCRS <- function(long, lat, from.crs, to.crs){
	xy <- data.frame(long=long, lat = lat)
	coordinates(xy) <- ~long+lat

	from.coordinate <- SpatialPoints(xy,proj4string=from.crs)

	changed <- as.data.frame(SpatialPoints(spTransform(from.coordinate,to_crs)))
	names(changed) <- c("long","lat")

	return(changed)
}

data01 <- read_csv("./longlat.csv",locale=locale('ko',encoding='cp949'))

coord <- data.frame(grs.long=data01[,1],grs.lat=data01[,2])
str(coord)
head(coord)

longlatT <- convertCRS(coord$long, coord$lat, from_crs, to_crs)

head(longlatT)