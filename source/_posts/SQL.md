---
title: SQL
date: 2016-08-15 00:06:15
tags:
categories: Database

---

```
SQL 测验
结果：17/20
您的回答：
1.SQL 指的是？
您的回答：Structured Query Language
2.哪个 SQL 语句用于从数据库中提取数据？
您的回答：SELECT
3.哪条 SQL 语句用于更新数据库中的数据？
您的回答：UPDATE
4.哪条 SQL 语句用于删除数据库中的数据？
您的回答：DELETE
5.哪条 SQL 语句用于在数据库中插入新的数据？
您的回答：INSERT INTO
6.通过 SQL，您如何从 "Persons" 表中选取 "FirstName" 列？
您的回答：SELECT FirstName FROM Persons
7.通过 SQL，您如何从 "Persons" 表中选取所有的列？
您的回答：SELECT * FROM Persons
8.通过 SQL，您如何从 "Persons" 表中选取 "FirstName" 列的值等于"Peter" 的所有记录？
您的回答：SELECT * FROM Persons WHERE FirstName='Peter'
9.通过 SQL，您如何从 "Persons" 表中选取 "FirstName" 列的值以 "a" 开头的所有记录？
您的回答：SELECT * FROM Persons WHERE FirstName LIKE '%a'
正确答案：SELECT * FROM Persons WHERE FirstName LIKE 'a%'
10.请判断下列说法是否正确：当所列出的某个条件为 true 时，OR 运算符会显示记录。当列出的所有条件为 true 时，AND 运算符会显示记录。
您的回答：正确
11.通过 SQL，您如何在表 Persons 中选择 FirstName 等于 Thomas 而 LastName 等于 Carter 的所有记录？
您的回答：SELECT * FROM Persons WHERE FirstName='Thomas' AND LastName='Carter'
12.通过 SQL，您如何按字母顺序选取 Persons 表中 LastName 介于 Adams 和 Carter 的所有记录？
您的回答：SELECT * FROM Persons WHERE LastName BETWEEN 'Adams' AND 'Carter'
13.哪条 SQL 语句可返回唯一不同的值？
您的回答：SELECT UNIQUE
正确答案：SELECT DISTINCT
14.哪个 SQL 关键词用于对结果集进行排序？
您的回答：ORDER BY
15.通过 SQL，您如何根据 "FirstName" 列降序地从 "Persons" 表返回所有记录？
您的回答：SELECT * FROM Persons ORDER BY FirstName DESC
16.通过 SQL，您如何向 "Persons" 表插入新的记录？
您的回答：INSERT VALUES ('Jimmy', 'Jackson') INTO Persons
正确答案：INSERT INTO Persons VALUES ('Jimmy', 'Jackson')
17.通过 SQL，您如何向 "Persons" 表中的 "LastName" 列插入 "Wilson" ？
您的回答：INSERT INTO Persons (LastName) VALUES ('Wilson')
18.您如何把 "Persons" 表中 "LastName" 列的 "Gates" 改为 "Wilson" ？
您的回答：UPDATE Persons SET LastName='Wilson' WHERE LastName='Gates'
19.通过 SQL，您如何在 "Persons" 表中删除 "FirstName" 等于 "Fred" 的纪录？
您的回答：DELETE FROM Persons WHERE FirstName = 'Fred'
20.通过 SQL，您如何返回 "Persons" 表中记录的数目？
您的回答：SELECT COUNT(*) FROM Persons
```


------
注意SELECT UPDATE INSERT DELET 要大写

SELECT DISTINCT
INSERT INTO Persons VALUES ('Jimmy', 'Jackson')
INSERT INTO Persons (LastName) VALUES ('Wilson')
UPDATE Persons SET LastName='Wilson' WHERE LastName='Gates'
