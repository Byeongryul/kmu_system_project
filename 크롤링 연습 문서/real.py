import pandas as pd
import requests as re
from bs4 import BeautifulSoup as bs
import os

pd.set_option('display.max_columns', 100) # 넣을 분량

df = pd.read_excel(os.getcwd() + "/data.xlsx", encoding = 'utf-8', index_col = 0)

d = []
#위치에 있는 정보를 가져와라
for url in df.ID:
    url = "http://cranberrygame.com/opi/opi/opia/wantedApi.php?callTp=D&wantedAuthNo=" + url
    res = re.get(url)
    text = res.content
    #깔끔하게 정리해라
    soup = bs(text, 'xml')
    #print(soup)
    #특정 정보를 출력하라
    wantedDtl = soup.select_one('wantedDtl')
    if(wantedDtl):
        d.append([wantedDtl.wantedAuthNo.text, wantedDtl.text])

#특정 행 출력?

pd.set_option('display.max_columns', 100) # 넣을 분량

df = pd.read_excel(os.getcwd() + "/data.xlsx", encoding = 'utf-8', index_col = 0)
#print(df) # 옆 값은 index