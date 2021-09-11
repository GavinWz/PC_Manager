#-*- coding = utf-8 -*-
from typing import ContextManager
from bs4 import BeautifulSoup  #网页解析，获取数据
import re   #正则表达式
import urllib.request, urllib.error #获取网页数据
import xlwt #进行Excel操作
import sqlite3 #进行SQLite数据库操作
import pymssql
import os
import requests

def main():
    # baseurl = "https://detail.zol.com.cn/memory"   # 内存
    # baseurl = "https://detail.zol.com.cn/mice/"  #鼠标
    # baseurl = "https://detail.zol.com.cn/keyboard/shandong/"  # 键盘
    # baseurl = "https://detail.zol.com.cn/hard_drives/" # 硬盘
    # baseurl = "https://detail.zol.com.cn/case/"  #机箱
    # baseurl = "https://detail.zol.com.cn/lcd/"  #显示器
    baseurl = "https://detail.zol.com.cn/power/"
    # datalist = getData(baseurl)
    # insert_list("电源", datalist)
    hardware = {
        # "CPU":"https://detail.zol.com.cn/cpu/",
        # "显卡":"https://detail.zol.com.cn/vga/",
        # "内存":"https://detail.zol.com.cn/memory/",
        # "鼠标":"https://detail.zol.com.cn/mice/",
        # "键盘":"https://detail.zol.com.cn/keyboard/",
        # "硬盘":"https://detail.zol.com.cn/hard_drives/",
        # "机箱":"https://detail.zol.com.cn/case/",
        # "显示器":"https://detail.zol.com.cn/lcd/",
        # "电源":"https://detail.zol.com.cn/power/"，
        "散热":"https://detail.zol.com.cn/cooling_product/"
        # "主板":"https://detail.zol.com.cn/motherboard/"
    }
    
    for item in hardware:
        run(item, hardware[item])

def run(hardware_type, baseurl):
    path = "D://IMG/"
    datalist = getData(baseurl, path, hardware_type)
    insert_list(hardware_type, datalist)
    


# 爬取网页
def getData(baseurl, path, hardware_type):
    datalist = []
    img_list = []
    for i in range(2, 10):
        url = baseurl + "" + str(i) + ".html"
        html = askUrl(url)
    
        #逐一解析数据
        bs = BeautifulSoup(html, "html.parser")
        all_div = bs.find_all("div")    #拿到所有div
        for div in all_div:     
            div_attr = div.attrs    #attrs获取所有属性
            if "class" in div_attr.keys():  #判断标签内是否有class属性
                if div_attr["class"] == ['pic-mode-box']:  #定位包含ul的div
                    file = open("D://text.txt", 'wb')
                    file.write(div.encode(encoding="utf-8"))

                    div_ul = div.ul
                    all = div_ul.find_all("li")  #每个li即为一条硬件信息
                    
                    for single in all:
                        h3 = single.h3     #每个h3中包含硬件名、详情、价格
                        img_a = single.find_all("a")
                        for a in img_a:  #找出硬件图片链接
                            if "class" in a.attrs.keys():
                                if a.attrs["class"] == ['pic']:
                                    img_url = a.img.get(".src")
                            else:
                                continue
                        print(img_url)
                        if type(h3) == type(None):
                            continue
                        span = single.div.find_all("span")  #span中包含价格
                        if len(span) < 2 or span[1].find_all("b")[1].string == "[<span class=\"price price-neg\"><b class=\"price-type\">价格面议</b></span>]":
                            continue    #不保存“价格面议”的硬件
                        info = []
                        price = span[1].find_all("b")[1].string
                        device = h3.find_all("a")
                        device = device[0]    #获取包含硬件名称的a标签
                        name = name_short(device['title'])  #字符串截取，获取硬件名称
                        detail=device.span.string  #获取CPU描述
                        detail = detail_short(detail)

                        img_name = name.replace(" ", "")+".jpg"
                        if(len(name) == 0 or len(price) == 0):
                            continue
                        print(img_name)
                        print(name)
                        print(detail)
                        print(price)
                        info.append(name)
                        info.append(detail)
                        info.append(price)
                        datalist.append(info)
                        img_list.append(img_url)
                        # 保存图片到本地
                        local_path = path+hardware_type+"/"
                        if not os.path.exists(local_path):
                            os.mkdir(local_path)
                        save_img(local_path, img_url, img_name)

                        print("\n")
    return datalist


def save_img(path, img_url, img_name):
    try:
        file_name = path.replace(" ", "") + img_name.replace(" ", "").replace("/", "").replace("\\", "").replace("?", "").replace("*", "").replace("<", "").replace(">", "")
        print(file_name)
        print (img_url)
        header = {"user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36"} # 设置http header，视情况加需要的条目，这里的token是用来鉴权的一种方式
        r = requests.get(img_url, headers=header, stream=True)
        print(r.status_code) # 返回状态码
        if r.status_code == 200:
            open(file_name, 'wb').write(r.content) # 将内容写入图片
            print("done")
        del r
    finally:
        print("OK")

    


#处理CPU过长的描述
def name_short(name):
    # print(name)
    if name == None:
        return ""
    if len(name) > 50:
        if name.count(" ") >= 3:
            name = name.split(" ")[1:4]
            name = name[0]+" "+name[1]+" "+name[2]
        elif name.count("；") >= 2:
            name = name.split("；")[1:3]
            name = name[0]+" "+name[1]
        
        if len(name) > 50: 
            name = name[0:49]  
    return name

#处理过长的硬件描述
def detail_short(detail):
    # print(detail)
    if detail == None:
        return ""
    if len(detail) > 50:
        if detail.count(" ") >= 2:
            detail = detail.split(" ")[1:3]
            detail = detail[0]+" "+detail[1]
        elif detail.count("；") >= 2:
            detail = detail.split("；")[1:3]
            detail = detail[0]+" "+detail[1]
        if len(detail) > 50: 
            detail = detail[0:49]  
    return detail



#得到一个指定url的网页内容
def askUrl(url):
    #设置用户代理信息
    head = {
        "user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36"
    }
    request = urllib.request.Request(url, headers=head)
    html = ""
    try:
        response = urllib.request.urlopen(request)
        html = response.read().decode("gbk")
    except urllib.error.URLError as e:
        if hasattr(e, "code"):
            print(e.code)
        if hasattr(e, "reason"):
            print(e.reason)
    return html

def conn():
    c = pymssql.connect("localhost", "gavin", "948587", "PC_Manager")
    return c

def insert_list(datatype, datalist):
    for data in datalist:
        insert_item(datatype, data[0], data[1], data[2])



def insert_item(type_, name, detail, price):
    price = price.replace("万", "0000")
    c = conn()
    if c:
        print("Connected.")
    if len(detail) >= 45:
        detail = detail[:45]

    # 已存在该硬件则跳过添加
    sql = "if not exists (select id from store where name like '%"+ name + "%') insert into store (type, name, detail, price) values ('" +type_+"', '"+ name +"','"+ detail+"', " +price+")"
    print(sql)
    a = c.cursor()
    a.execute(sql)
    c.commit()
    

if __name__ == "__main__":
    main()
    