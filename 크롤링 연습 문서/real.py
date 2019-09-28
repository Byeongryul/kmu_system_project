import pandas as pd
import requests as re
from bs4 import BeautifulSoup as bs
import os

pd.set_option('display.max_columns', 100) # ���� �з�

df = pd.read_excel(os.getcwd() + "/data.xlsx", encoding = 'utf-8', index_col = 0)

d = []
#��ġ�� �ִ� ������ �����Ͷ�
for url in df.ID:
    url = "http://cranberrygame.com/opi/opi/opia/wantedApi.php?callTp=D&wantedAuthNo=" + url
    res = re.get(url)
    text = res.content
    #����ϰ� �����ض�
    soup = bs(text, 'xml')
    #print(soup)
    #Ư�� ������ ����϶�
    wantedDtl = soup.select_one('wantedDtl')
    if(wantedDtl):
        d.append([wantedDtl.wantedAuthNo.text, wantedDtl.text])

#Ư�� �� ���?

pd.set_option('display.max_columns', 100) # ���� �з�

df = pd.read_excel(os.getcwd() + "/data.xlsx", encoding = 'utf-8', index_col = 0)
#print(df) # �� ���� index