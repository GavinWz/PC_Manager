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

c = pymssql.connect("localhost", "gavin", "948587", "PC_Manager")
if c:
    print("Connected.")