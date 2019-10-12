setwd("C:/Users/mapia/Desktop/kmu/system/과제 준비/1차_과제_준비/19_10_11_4차_데이터_선별/")

library(readxl)
df_exam = read_excel("분야별_기준_데이터/분야별 각각의 임금(최저 평균 최고) + 최하단 평균값 기재.xlsx")

test = t(df_exam[df_exam$...1 == '평균',])[2:10,]

test = as.numeric(test)

test = list(robot = test[1:3], big = test[4:6], ai = test[7:9])

test = data.frame(test)

rownames(test) = c('low', 'mid', 'high')

test = data.frame(t(test))

test = as.matrix(test)

cols = c("lightblue", "mistyrose", "lightcyan")

barplot(test, c(1, 1, 1), beside = TRUE,
        col = cols, main = "분야별 임금", 
        legend = rownames(test), ylim = c(0, 69000000))

