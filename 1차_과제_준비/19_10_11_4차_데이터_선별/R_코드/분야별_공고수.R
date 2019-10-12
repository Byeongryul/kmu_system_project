setwd("C:/Users/mapia/Desktop/kmu/system/과제 준비/1차_과제_준비/19_10_11_4차_데이터_선별/")

library(readxl)
df_exam = read_excel("분야별_기준_데이터/분야별 공고수.xlsx")

slices = c(df_exam$`로봇 공고수`, df_exam$`빅데이터 공고수`, df_exam$`인공지능 공고수`)
lbls = c('로봇', '빅데이터', '인공지능')

pct = round(slices/sum(slices)*100)
lbls = paste(lbls, pct)
lbls = paste(lbls, "%", sep='')

cols = c("lightblue", "mistyrose", "lightcyan",
         "lavender", "cornsilk")

pie(slices, labels=lbls, col = cols, main = "분야별 공고수")