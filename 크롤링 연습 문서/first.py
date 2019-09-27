#http://cafe.daum.net/bigdataKMU/Ht01/352 정보 관련 커뮤니티
#클롤링 -> 웹페이지에서 데이터 추출행위 // 테그로 구분하여 가져옴
#판다스? 뷰티플소프? bs4
#개인키 + 회사 + 
import pandas as pd#판다스
import requests as re#리퀘스트
from bs4 import BeautifulSoup as bs#뷰티플 소프

import os
text = open(os.getcwd() + "/title.html", 'r', encoding = 'cp949')
text = text.read()
print(text)

soup = bs(text, 'xml')
colums = ['ID', 'COMPANY', 'JOB_TITLE']

job_list = soup.select('wanted')
for jobs in job_list:
    print(jobs)

d = []
for jobs in job_list:
    print(jobs.wantedAuthNo.text, jobs.company.text, jobs.title.text)
    d.append([jobs.wantedAuthNo.text, jobs.company.text, jobs.title.text])

export = pd.DataFrame(d, colums = colums)
print(export)

export.to_excel(os.getcwd().text + "/data.xlsx")