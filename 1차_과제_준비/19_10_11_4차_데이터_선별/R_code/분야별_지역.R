setwd("C:/Users/mapia/Desktop/kmu/system/과제 준비/1차_과제_준비/19_10_11_4차_데이터_선별/")

library(readxl)
df_exam = read_excel("분야별_기준_데이터/분야별 근무예정지 인원수.xlsx")

df_exam = df_exam[2:5]




























library(ggmap)
#키 가져오기
register_google(key = 'AIzaSyBWNs1CFU_ZFVAxpxbQS1Jkk4OoyeK3hFY ')

map <- get_map(location='south korea', zoom=7, maptype='roadmap', color='bw')

ggmap(map)

library(raster)
#결과값 == SIG_CD 값을 넣음 == 코드로 존재함
result = read.csv("R_code/result.csv", header = T, as.is= T)

korea = shapefile("R_code/data/TL_SCCO_SIG.shp")
ggplot() + geom_polygon(data=korea, aes(x=long, y=lat, group=group), fill='white', color='black')

head(korea)

korea <- fortify(korea, region = 'SIG_CD')
korea = merge(korea, result, by ='id')

p <- ggplot() + geom_polygon(data=korea, aes(x=long, y=lat, group=group, fill=moon))

p + scale_fill_gradient(low='white', high = "#004ea2") + theme_void() + guides(fill=F)

