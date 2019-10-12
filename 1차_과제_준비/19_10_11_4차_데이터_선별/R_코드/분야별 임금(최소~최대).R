setwd("C:/Users/mapia!/Desktop/kmu/system/과제 준비/1차_과제_준비/19_10_11_4차_데이터_선별/")

df_exam = read_excel("분야별_기준_데이터/분야별 각각의 임금(최저 평균 최고) + 최하단 평균값 기재.xlsx")

df_exam = df_exam[df_exam$...1=="평균",]

df_exam = subset(df_exam, select = -...1)

z = matrix(df_exam, nrow =3, dimnames = list(c('로봇', '빅데이터', '인공지능'), c('최저', '평균','최고')))

barplot(col = c("green", "yellow", "pink"))
