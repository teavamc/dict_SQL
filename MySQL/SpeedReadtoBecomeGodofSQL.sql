
-- 增删改查基本语句

-- 查询
SELECT column_name(s) FROM table_name
-- 条件查询
SELECT [*] FROM [TableName] WHERE [condition1]
SELECT [*] FROM [TableName] WHERE [condition1] [AND [OR]] [condition2]...
-- 查询后按照字段升序或降序排序
SELECT column_name()
FROM table_name
ORDER BY column_name() ASC or DESC

-- 插入
INSERT INTO table_name (column, column1, column2, column3, ...)
VALUES (value, value1, value2, value3 ...)

-- 修改
UPDATE table_name
SET column=value, column1=value1,...
WHERE someColumn=someValue

-- 删除
DELETE FROM tableName
WHERE someColumn = someValue

-- DISTINCT 仅返回不同的值
SELECT DISTINCT column1, column2, ...
FROM table_name;

-- WHERE 条件字句判断示例
-- 搜索 empno 等于 7900 的数据
Select * from emp where empno=7900;

-- And:与 同时满足两个条件的值。
-- 查询 EMP 表中 SAL 列中大于 2000 小于 3000 的值。
Select * from emp where sal > 2000 and sal < 3000;

-- Or:或 满足其中一个条件的值
-- 查询 emp 表中 SAL 大于 2000 或 COMM 大于500的值。
Select * from emp where sal > 2000 or comm > 500;

-- Not:非 满足不包含该条件的值。
-- 查询EMP表中 sal 小于等于 1500 的值。
select * from emp where not sal > 1500;

-- 空值判断： is null
-- 查询 emp 表中 comm 列中的空值。
Select * from emp where comm is null;

-- between and (在 之间的值)
-- 查询 emp 表中 SAL 列中大于 1500 的小于 3000 的值。
Select * from emp where sal between 1500 and 3000;

-- In
-- 查询 EMP 表 SAL 列中等于 5000，3000，1500 的值。
Select * from emp where sal in (5000,3000,1500);

-- like
-- 查询 EMP 表中 Ename 列中有 M 的值，M 为要查询内容中的模糊信息。
--  %   ：表示多个字值，_ 下划线表示一个字符；
--  M%  : 为能配符，正则表达式，表示的意思为模糊查询信息为 M 开头的。
--  %M% : 表示查询包含M的所有内容。
--  %M_ : 表示查询以M在倒数第二位的所有内容。
Select * from emp where ename like 'M%';

-- AND 和 OR
-- AND 和 OR 结合起来（使用圆括号来组成复杂的表达式）
-- 如果第一个条件和第二个条件都成立，则 AND 运算符显示一条记录
-- 如果第一个条件和第二个条件中只要有一个成立，则 OR 运算符显示一条记录

-- 从 "Websites" 表中选取 alexa 排名大于 "15" 且国家为 "CN" 或 "USA" 的所有网站
SELECT * FROM Websites
WHERE alexa > 15
AND (country='CN' OR country='USA');

-- ORDER BY
-- 对结果集按照一个列或者多个列进行排序。
-- 默认按照升序对记录进行排序。如果需要按照降序对记录进行排序，您可以使用 DESC 关键字
SELECT column_name,column_name
FROM table_name
ORDER BY column_name,column_name ASC|DESC;

-- ORDER BY 多列
SELECT * FROM Websites
ORDER BY country,alexa;

-- ORDER BY 多列 先按照第一个column name排序
-- order by A,B        这个时候都是默认按升序排列
-- order by A desc,B   这个时候 A 降序，B 升序排列
-- order by A ,B desc  这个时候 A 升序，B 降序排列

-- INSERT INTO

-- 第一种形式无需指定要插入数据的列名，只需提供被插入的值
INSERT INTO table_name
VALUES (value1,value2,value3,...);

-- 第二种形式需要指定列名及被插入的值：
INSERT INTO table_name (column1,column2,column3,...)
VALUES (value1,value2,value3,...);


-- UPDATE

-- 请注意 SQL UPDATE 语句中的 WHERE 子句！
-- WHERE 子句规定哪条记录或者哪些记录需要更新。
-- 如果您省略了 WHERE 子句，所有的记录都将被更新！
UPDATE table_name
SET column1=value1,column2=value2,...
WHERE some_column=some_value;

-- DELETE 

-- 请注意 SQL DELETE 语句中的 WHERE 子句！
-- WHERE 子句规定哪条记录或者哪些记录需要删除。
-- 如果您省略了 WHERE 子句，所有的记录都将被删除！
DELETE FROM table_name
WHERE some_column=some_value;

-- 不删除表的情况下，删除表中所有的行。
DELETE FROM table_name;

-- LIKE 
-- 在 WHERE 子句中搜索列中的指定模式

-- '%a'   ：以a结尾的数据
-- 'a%'   ：以a开头的数据
-- '%a%'  ：含有a的数据
-- ‘_a_’  ：三位且中间字母是a的
-- '_a'   ：两位且结尾字母是a的
-- 'a_'   ：两位且开头字母是a的

SELECT column_name(s)
FROM table_name
WHERE column_name LIKE pattern;


-- IN
-- 允许您在 WHERE 子句中规定多个值

SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1,value2,...);

-- 选取 name 为 "Google" 或 "菜鸟教程" 的所有网站
SELECT * FROM Websites
WHERE name IN ('Google','菜鸟教程');

-- IN 与 = 的异同
-- 相同点：均在WHERE中使用作为筛选条件之一、均是等于的含义
-- 不同点：IN可以规定多个值，等于规定一个值

SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1,value2,...);

SELECT column_name(s)
FROM table_name
WHERE column_name=value1;

-- in 与 = 的转换

SELECT * FROM Websites WHERE name IN ('Google','菜鸟教程');
SELECT * FROM Websites WHERE name='Google' OR name='菜鸟教程';

-- BETWEEN 
-- 选取介于两个值之间的数据范围内的值

SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;

-- 选取 alexa 介于 1 和 20 之间的所有网站
SELECT * FROM Websites
WHERE alexa BETWEEN 1 AND 20;

-- NOT BETWEEN
-- 显示不在上面实例范围内的网站
SELECT * FROM Websites
WHERE alexa NOT BETWEEN 1 AND 20;

-- 带有 IN 的 BETWEEN 操作符实例
-- 选取 alexa 介于 1 和 20 之间
-- 但 country 不为 USA 和 IND 的所有网站
SELECT * FROM Websites
WHERE (alexa BETWEEN 1 AND 20)
AND country NOT IN ('USA', 'IND');


-- 带有文本值的 BETWEEN 操作符
-- 选取 name 以介于 'A' 和 'H' 之间字母开始的所有网站
SELECT * FROM Websites
WHERE name BETWEEN 'A' AND 'H';

-- 别名
-- 通过使用 SQL，可以为表名称或列名称指定别名。
-- 基本上，创建别名是为了让列名称的可读性更强。

-- 列
SELECT column_name AS alias_name
FROM table_name;
-- 表
SELECT column_name(s)
FROM table_name AS alias_name;

-- JOIN
-- JOIN 子句用于把来自两个或多个表的行结合起来
-- 基于这些表之间的共同字段。

-- INNER JOIN
-- INNER JOIN 从多个表中返回满足 JOIN 条件的所有行
-- 例：
SELECT Websites.id, Websites.name, access_log.count, access_log.date
FROM Websites
INNER JOIN access_log
ON Websites.id=access_log.site_id;

-- 其他 JOIN
-- INNER JOIN：如果表中有至少一个匹配，则返回行
-- LEFT JOIN：即使右表中没有匹配，也从左表返回所有的行
-- RIGHT JOIN：即使左表中没有匹配，也从右表返回所有的行
-- FULL JOIN：只要其中一个表中存在匹配，则返回行

-- JOIN 详细介绍

-- INNER JOIN
-- 在表中存在至少一个匹配时返回行
SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;
-- 或者
SELECT column_name(s) 
FROM table1
JOIN table2
ON table1.column_name = table2.column_name;

-- 在使用 join 时，on 和 where 条件的区别
-- 1、 on 条件是在生成临时表时使用的条件，
-- 它不管 on 中的条件是否为真，都会返回左边表中的记录。
-- 2、where 条件是在临时表生成好后，再对临时表进行过滤的条件。
-- 这时已经没有 left join 的含义
-- （必须返回左边表的记录）了，条件不为真的就全部过滤掉。

-- LEFT JOIN
-- 从左表（table1）返回所有的行，即使右表（table2）中没有匹配
-- 如果右表中没有匹配，则结果为 NULL
SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name=table2.column_name;
-- 或者
SELECT column_name(s)
FROM table1
LEFT OUTER JOIN table2
ON table1.column_name=table2.column_name;

-- RIGHT JOIN
-- 从右表（table2）返回所有的行，即使左表（table1）中没有匹配
-- 如果左表中没有匹配，则结果为 NULL
SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name=table2.column_name;
-- 或者
SELECT column_name(s)
FROM table1
RIGHT OUTER JOIN table2
ON table1.column_name=table2.column_name;

-- FULL OUTER JOIN
-- 只要左表（table1）和右表（table2）其中一个表中存在匹配，则返回行.
-- FULL OUTER JOIN 关键字结合了 LEFT JOIN 和 RIGHT JOIN 的结果。
SELECT column_name(s)
FROM table1
FULL OUTER JOIN table2
ON table1.column_name=table2.column_name;

-- UNION 操作
-- UNION 操作符用于合并两个或多个 SELECT 语句的结果集
-- UNION 内部的每个 SELECT 语句必须拥有相同数量的列。
-- 列也必须拥有相似的数据类型。
-- 同时，每个 SELECT 语句中的列的顺序必须相同。

-- 默认地，UNION 操作符选取不同的值。
-- 如果允许重复的值，请使用 UNION ALL。
-- UNION 结果集中的列名总是等于 UNION 中第一个 SELECT 语句中的列名。

SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;
-- 或者
SELECT column_name(s) FROM table1
UNION ALL
SELECT column_name(s) FROM table2;

-- INSERT INTO SELECT
-- 从一个表复制数据，然后把数据插入到另一个新表中
-- 目标表中任何已存在的行都不会受影响

-- 一个表中复制所有的列插入到另一个已存在的表中
INSERT INTO table2
SELECT * FROM table1;
-- 只复制希望的列插入到另一个已存在的表中
INSERT INTO table2
(column_name(s))
SELECT column_name(s)
FROM table1;

-- 实例1
INSERT INTO Websites (name, country)
SELECT app_name, country FROM apps;
-- 实例2
INSERT INTO Websites (name, country)
SELECT app_name, country FROM apps
WHERE id=1;

-- CREATE DATABASE 用于创建数据库
CREATE DATABASE dbname;

-- CREATE TABLE 
-- column_name 参数规定表中列的名称。
-- data_type 参数规定列的数据类型
-- （例如 varchar、integer、decimal、date 等等）。
-- size 参数规定表中列的最大长度。
CREATE TABLE table_name
(
column_name1 data_type(size),
column_name2 data_type(size),
column_name3 data_type(size),
....
);

-- CREATE TABLE 实例
-- 创建一个名为 "Persons" 的表
-- 包含五列：PersonID、LastName、FirstName、Address 和 City
CREATE TABLE Persons
(
PersonID int,
LastName varchar(255),
FirstName varchar(255),
Address varchar(255),
City varchar(255)
);

-- 约束（Constraints）
-- SQL 约束用于规定表中的数据规则。
-- 如果存在违反约束的数据行为，行为会被约束终止。
-- 约束可以在创建表时规定（通过 CREATE TABLE 语句）
-- 或者在表创建之后规定（通过 ALTER TABLE 语句）
-- 在 SQL 中，我们有如下约束

-- NOT NULL - 指示某列不能存储 NULL 值。
-- UNIQUE - 保证某列的每行必须有唯一的值。
-- PRIMARY KEY - NOT NULL 和 UNIQUE 的结合。
-- 	  确保某列（或两个列多个列的结合）有唯一标识，
-- 	  有助于更容易更快速地找到表中的一个特定的记录。
-- FOREIGN KEY - 保证一个表中的数据匹配另一个表中的值的参照完整性。
-- CHECK - 保证列中的值符合指定的条件。
-- DEFAULT - 规定没有给列赋值时的默认值。


-- CREATE TABLE + CONSTRAINT 语法
CREATE TABLE table_name
(
column_name1 data_type(size) constraint_name,
column_name2 data_type(size) constraint_name,
column_name3 data_type(size) constraint_name,
....
);

-- NOT NULL 约束
-- 约束强制列不接受 NULL 值
-- 约束强制字段始终包含值。
-- 如果不向字段添加值，就无法插入新记录或者更新记录。

-- 强制 "P_Id" 列和 "LastName" 列不接受 NULL 值
CREATE TABLE Persons
(
P_Id int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255)
)

-- UNIQUE 约束唯一标识数据库表中的每条记录
-- UNIQUE 和 PRIMARY KEY 约束均为列或列集合提供了唯一性的保证
-- PRIMARY KEY 约束拥有自动定义的 UNIQUE 约束
-- 每个表可以有多个 UNIQUE 约束，但是每个表只能有一个 PRIMARY KEY 约束

-- CREATE TABLE 时的 SQL UNIQUE 约束
-- 在 "Persons" 表创建时在 "P_Id" 列上创建 UNIQUE 约束
CREATE TABLE Persons
(
P_Id int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255),
UNIQUE (P_Id)
)

-- 命名 UNIQUE 约束，并定义多个列的 UNIQUE 约束
CREATE TABLE Persons
(
P_Id int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255),
CONSTRAINT uc_PersonID UNIQUE (P_Id,LastName)
)

-- ALTER TABLE 时的 SQL UNIQUE 约束
-- 表已被创建，在 "P_Id" 列创建 UNIQUE 约束
ALTER TABLE Persons
ADD UNIQUE (P_Id)

-- 如需命名 UNIQUE 约束，并定义多个列的 UNIQUE 约束
ALTER TABLE Persons
ADD CONSTRAINT uc_PersonID UNIQUE (P_Id,LastName)

-- 撤销 UNIQUE 约束
ALTER TABLE Persons
DROP INDEX uc_PersonID

-- PRIMARY KEY 约束
-- PRIMARY KEY 约束唯一标识数据库表中的每条记录
-- 主键必须包含唯一的值
-- 主键列不能包含 NULL 值
-- 每个表都应该有一个主键，并且每个表只能有一个主键

-- CREATE TABLE 时的 SQL PRIMARY KEY 约束
CREATE TABLE Persons
(
P_Id int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255),
PRIMARY KEY (P_Id)
)

-- 如需命名 PRIMARY KEY 约束，并定义多个列的 PRIMARY KEY 约束
-- 注意！！！
-- 实例中，只有一个主键 PRIMARY KEY（pk_PersonID）。
-- 然而，pk_PersonID 的值是由两个列（P_Id 和 LastName）组成的
CREATE TABLE Persons
(
P_Id int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255),
CONSTRAINT pk_PersonID PRIMARY KEY (P_Id,LastName)
)

-- ALTER TABLE 时的 SQL PRIMARY KEY 约束
-- 当表已被创建时，如需在 "P_Id" 列创建 PRIMARY KEY 约束
ALTER TABLE Persons
ADD PRIMARY KEY (P_Id)
-- 如需命名 PRIMARY KEY 约束，并定义多个列的 PRIMARY KEY 约束
ALTER TABLE Persons
ADD CONSTRAINT pk_PersonID PRIMARY KEY (P_Id,LastName)

-- 撤销 PRIMARY KEY 约束
ALTER TABLE Persons
DROP PRIMARY KEY

-- FOREIGN KEY 约束
-- 一个表中的 FOREIGN KEY 指向另一个表中的 UNIQUE KEY(唯一约束的键)
-- FOREIGN KEY 约束用于预防破坏表之间连接的行为。
-- FOREIGN KEY 约束也能防止非法数据插入外键列，因为它必须是它指向的那个表中的值之一。

-- CREATE TABLE 时的 SQL FOREIGN KEY 约束
CREATE TABLE Orders
(
O_Id int NOT NULL,
OrderNo int NOT NULL,
P_Id int,
PRIMARY KEY (O_Id),
FOREIGN KEY (P_Id) REFERENCES Persons(P_Id)
)

-- 如需命名 FOREIGN KEY 约束，并定义多个列的 FOREIGN KEY 约束
CREATE TABLE Orders
(
O_Id int NOT NULL,
OrderNo int NOT NULL,
P_Id int,
PRIMARY KEY (O_Id),
CONSTRAINT fk_PerOrders FOREIGN KEY (P_Id)
REFERENCES Persons(P_Id)
)

-- ALTER TABLE 时的 SQL FOREIGN KEY 约束
ALTER TABLE Orders
ADD FOREIGN KEY (P_Id)
REFERENCES Persons(P_Id)

-- 如需命名 FOREIGN KEY 约束，并定义多个列的 FOREIGN KEY 约束
ALTER TABLE Orders
ADD CONSTRAINT fk_PerOrders
FOREIGN KEY (P_Id)
REFERENCES Persons(P_Id)

-- 撤销 FOREIGN KEY 约束
ALTER TABLE Orders
DROP FOREIGN KEY fk_PerOrders

-- SQL CHECK 约束
-- CHECK 约束用于限制列中的值的范围。
-- 如果对单个列定义 CHECK 约束，那么该列只允许特定的值。
-- 如果对一个表定义 CHECK 约束，那么此约束会基于行中其他列的值在特定的列中对值进行限制。

-- CREATE TABLE 时的 SQL CHECK 约束
-- 在 "Persons" 表创建时在 "P_Id" 列上创建 CHECK 约束
-- CHECK 约束规定 "P_Id" 列必须只包含大于 0 的整数
CREATE TABLE Persons
(
P_Id int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255),
CHECK (P_Id>0)
)

-- 如需命名 CHECK 约束，并定义多个列的 CHECK 约束
CREATE TABLE Persons
(
P_Id int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255),
CONSTRAINT chk_Person CHECK (P_Id>0 AND City='Sandnes')
)

-- ALTER TABLE 时的 SQL CHECK 约束
-- 当表已被创建时，如需在 "P_Id" 列创建 CHECK 约束
ALTER TABLE Persons
ADD CHECK (P_Id>0)
-- 如需命名 CHECK 约束，并定义多个列的 CHECK 约束
ALTER TABLE Persons
ADD CONSTRAINT chk_Person CHECK (P_Id>0 AND City='Sandnes')

-- 撤销 CHECK 约束
ALTER TABLE Persons
DROP CHECK chk_Person

-- SQL DEFAULT 约束
-- DEFAULT 约束用于向列中插入默认值。
-- 如果没有规定其他的值，那么会将默认值添加到所有的新记录。

-- CREATE TABLE 时的 SQL DEFAULT 约束
CREATE TABLE Persons
(
    P_Id int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255) DEFAULT 'Sandnes'
)

-- 使用类似 GETDATE() 这样的函数，DEFAULT 约束也可以用于插入系统值
CREATE TABLE Orders
(
    O_Id int NOT NULL,
    OrderNo int NOT NULL,
    P_Id int,
    OrderDate date DEFAULT GETDATE()
)

-- ALTER TABLE 时的 SQL DEFAULT 约束
-- 表已被创建时，如需在 "City" 列创建 DEFAULT 约束
ALTER TABLE Persons
ALTER City SET DEFAULT 'SANDNES'

-- 撤销 DEFAULT 约束
ALTER TABLE Persons
ALTER City DROP DEFAULT

-- SQL CREATE INDEX
-- CREATE INDEX 语句用于在表中创建索引

-- 在不读取整个表的情况下，索引使数据库应用程序可以更快地查找数据
-- 在表中创建索引，以便更加快速高效地查询数据。
-- 用户无法看到索引，它们只能被用来加速搜索/查询

-- 更新一个包含索引的表需要比更新一个没有索引的表花费更多的时间，这是由于索引本身也需要更新。
-- 因此，理想的做法是仅仅在常常被搜索的列（以及表）上面创建索引

-- SQL CREATE INDEX 语法
CREATE INDEX index_name
ON table_name (column_name)

-- SQL CREATE UNIQUE INDEX 语法
-- 在表上创建一个唯一的索引。
-- 不允许使用重复的值：唯一的索引意味着两个行不能拥有相同的索引值。
CREATE UNIQUE INDEX index_name
ON table_name (column_name)

-- CREATE INDEX 实例
-- 在 "Persons" 表的 "LastName" 列上创建一个名为 "PIndex" 的索引
CREATE INDEX PIndex
ON Persons (LastName)
-- 索引不止一个列，在括号中列出这些列的名称，用逗号隔开
CREATE INDEX PIndex
ON Persons (LastName, FirstName)

-- SQL 撤销索引、撤销表以及撤销数据库
-- 使用 DROP 语句，可以轻松地删除索引、表和数据库

-- DROP INDEX 语句
ALTER TABLE table_name 
DROP INDEX index_name

-- DROP TABLE 语句
DROP TABLE table_name

-- DROP DATABASE 语句
DROP DATABASE database_name

-- TRUNCATE TABLE 语句
-- 仅需要删除表内的数据，但并不删除表本身
TRUNCATE TABLE table_name

-- SQL ALTER TABLE 语句
-- ALTER TABLE 语句用于在已有的表中添加、删除或修改列

-- 在表中添加列
ALTER TABLE table_name
ADD column_name datatype

-- 删除表中的列
ALTER TABLE table_name
DROP COLUMN column_name

-- 改变表中列的数据类型
ALTER TABLE table_name
MODIFY COLUMN column_name datatype

-- SQL AUTO INCREMENT 字段
-- Auto-increment 会在新记录插入表中时生成一个唯一的数字
-- 下面的 SQL 语句把 "Persons" 表中的 "ID" 列定义为 auto-increment 主键字段
CREATE TABLE Persons
(
ID int NOT NULL AUTO_INCREMENT,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255),
PRIMARY KEY (ID)
)

-- MySQL 使用 AUTO_INCREMENT 关键字来执行 auto-increment 任务。
-- 默认地，AUTO_INCREMENT 的开始值是 1，每条新记录递增 1。
-- 要让 AUTO_INCREMENT 序列以其他的值起始，请使用下面的 SQL 语法：
ALTER TABLE Persons AUTO_INCREMENT=100

-- 要在 "Persons" 表中插入新记录，我们不必为 "ID" 列规定值（会自动添加一个唯一的值）：
INSERT INTO Persons (FirstName,LastName)
VALUES ('Lars','Monsen')

-- SQL 视图（Views）
-- SQL CREATE VIEW 语句

-- 在 SQL 中，视图是基于 SQL 语句的结果集的可视化的表。
-- 视图包含行和列，就像一个真实的表。
-- 视图中的字段就是来自一个或多个数据库中的真实的表中的字段。
-- 您可以向视图添加 SQL 函数、WHERE 以及 JOIN 语句，也可以呈现数据，就像这些数据来自于某个单一的表一样。

-- 视图总是显示最新的数据！
-- 每当用户查询视图时，数据库引擎通过使用视图的 SQL 语句重建数据。

-- SQL CREATE VIEW 语法
CREATE VIEW view_name AS
SELECT column_name(s)
FROM table_name
WHERE condition

-- SQL CREATE VIEW 实例
-- 视图 "Current Product List" 会从 "Products" 表列出所有正在使用的产品（未停产的产品）
CREATE VIEW [Current Product List] AS
SELECT ProductID,ProductName
FROM Products
WHERE Discontinued=No

-- 查询上面这个视图
SELECT * FROM [Current Product List]


-- SQL 更新视图
-- SQL CREATE OR REPLACE VIEW 语法
CREATE OR REPLACE VIEW view_name AS
SELECT column_name(s)
FROM table_name
WHERE condition

-- SQL 撤销视图
DROP VIEW view_name

-- SQL Date 函数
-- MySQL 最重要的内建日期函数

-- NOW()	返回当前的日期和时间
-- CURDATE()	返回当前的日期
-- CURTIME()	返回当前的时间
-- DATE()	提取日期或日期/时间表达式的日期部分
-- EXTRACT()	返回日期/时间的单独部分
-- DATE_ADD()	向日期添加指定的时间间隔
-- DATE_SUB()	从日期减去指定的时间间隔
-- DATEDIFF()	返回两个日期之间的天数
-- DATE_FORMAT()	用不同的格式显示日期/时间 

-- SQL Date 数据类型

-- MySQL 使用下列数据类型在数据库中存储日期或日期/时间值：

-- DATE - 格式：YYYY-MM-DD
-- DATETIME - 格式：YYYY-MM-DD HH:MM:SS
-- TIMESTAMP - 格式：YYYY-MM-DD HH:MM:SS
-- YEAR - 格式：YYYY 或 YY

-- SQL 常用函数

-- AVG() 函数
-- AVG() 函数返回数值列的平均值
SELECT AVG(column_name) FROM table_name

-- COUNT() 函数
-- COUNT() 函数返回匹配指定条件的行数

-- COUNT(column_name) 函数返回指定列的值的数目（NULL 不计入）
SELECT COUNT(column_name) FROM table_name

-- COUNT(*) 函数返回表中的记录数
SELECT COUNT(*) FROM table_name

-- COUNT(DISTINCT column_name) 函数返回指定列的不同值的数目
SELECT COUNT(DISTINCT column_name) FROM table_name

-- MAX() 函数
-- MAX() 函数返回指定列的最大值
SELECT MAX(column_name) FROM table_name

-- MIN() 函数
-- MIN() 函数返回指定列的最小值
SELECT MIN(column_name) FROM table_name

-- SUM() 函数
-- SUM() 函数返回数值列的总数
SELECT SUM(column_name) FROM table_name

-- GROUP BY 语句
-- GROUP BY 语句用于结合聚合函数，根据一个或多个列对结果集进行分组
SELECT column_name, aggregate_function(column_name)
FROM table_name
WHERE column_name operator value
GROUP BY column_name;

-- GROUP BY 简单应用
SELECT site_id, SUM(access_log.count) AS nums
FROM access_log GROUP BY site_id;

-- GROUP BY 多表连接
SELECT Websites.name,COUNT(access_log.aid) AS nums FROM access_log
LEFT JOIN Websites
ON access_log.site_id=Websites.id
GROUP BY Websites.name;

-- HAVING 子句
-- 在 SQL 中增加 HAVING 子句原因是，WHERE 关键字无法与聚合函数一起使用。
-- HAVING 子句可以让我们筛选分组后的各组数据

-- SQL HAVING 语法
SELECT column_name, aggregate_function(column_name)
FROM table_name
WHERE column_name operator value
GROUP BY column_name
HAVING aggregate_function(column_name) operator value;

-- SQL HAVING 实例
-- 查找总访问量大于 200 的网站
SELECT Websites.name, Websites.url, SUM(access_log.count) AS nums FROM (access_log
INNER JOIN Websites
ON access_log.site_id=Websites.id)
GROUP BY Websites.name
HAVING SUM(access_log.count) > 200;

-- 查找总访问量大于 200 的网站
-- 并且 alexa 排名小于 200
SELECT Websites.name, SUM(access_log.count) AS nums FROM Websites
INNER JOIN access_log
ON Websites.id=access_log.site_id
WHERE Websites.alexa < 200 
GROUP BY Websites.name
HAVING SUM(access_log.count) > 200;

-- UCASE() 函数
-- UCASE() 函数把字段的值转换为大写
SELECT UCASE(column_name) FROM table_name

-- LCASE() 函数
-- LCASE() 函数把字段的值转换为小写
SELECT LCASE(column_name) FROM table_name

-- MID() 函数
-- MID() 函数用于从文本字段中提取字符
SELECT MID(column_name,start[,length]) FROM table_name

-- column_name	必需。要提取字符的字段。
-- start	必需。规定开始位置（起始值是 1）。
-- length	可选。要返回的字符数。如果省略，则 MID() 函数返回剩余文本。

-- SQL MID() 实例
-- 从 "Websites" 表的 "name" 列中提取前 4 个字符
SELECT MID(name,1,4) AS ShortTitle
FROM Websites

-- LEN() 函数
-- LEN() 函数返回文本字段中值的长度
SELECT LENGTH(column_name) FROM table_name

-- SQL LEN() 实例
-- 从 "Websites" 表中选取 "name" 和 "url" 列中值的长度
SELECT name, LENGTH(url) as LengthOfURL
FROM Websites;

-- ROUND() 函数
-- ROUND() 函数用于把数值字段舍入为指定的小数位数
SELECT ROUND(column_name,decimals) FROM table_name;

-- column_name	必需。要舍入的字段
-- decimals	必需。规定要返回的小数位数

-- SQL ROUND() 实例
-- ROUND(X)： 返回参数X的四舍五入的一个整数。

-- ROUND(X,D)： 返回参数X的四舍五入的有 D 位小数的一个数字。
-- 如果D为0，结果将没有小数点或小数部分。

-- NOW() 函数
-- NOW() 函数返回当前系统的日期和时间
SELECT NOW() FROM table_name

-- SQL NOW() 实例
SELECT name, url, Now() AS date
FROM Websites;

-- FORMAT() 函数
-- FORMAT() 函数用于对字段的显示进行格式化
SELECT FORMAT(column_name,format) FROM table_name

-- SQL FORMAT() 实例
-- 下面的 SQL 语句从 "Websites" 表中选取 name, url 以及格式化为 YYYY-MM-DD 的日期
SELECT name, url, DATE_FORMAT(Now(),'%Y-%m-%d') AS date
FROM Websites

-- 快速参考
-- AND / OR
SELECT column_name(s)
FROM table_name
WHERE condition
AND|OR condition

-- ALTER TABLE
ALTER TABLE table_name 
ADD column_name datatype
or

ALTER TABLE table_name 
DROP COLUMN column_name

-- AS (alias)
SELECT column_name AS column_alias
FROM table_name
or

SELECT column_name
FROM table_name AS table_alias

-- BETWEEN
SELECT column_name(s)
FROM table_name
WHERE column_name
BETWEEN value1 AND value2

-- CREATE DATABASE
CREATE DATABASE database_name

-- CREATE TABLE
CREATE TABLE table_name
(
column_name1 data_type,
column_name2 data_type,
column_name2 data_type,
...
)

-- CREATE INDEX
CREATE INDEX index_name
ON table_name (column_name)
or

CREATE UNIQUE INDEX index_name
ON table_name (column_name)


-- CREATE VIEW
CREATE VIEW view_name AS
SELECT column_name(s)
FROM table_name
WHERE condition

-- DELETE
DELETE FROM table_name
WHERE some_column=some_value
or

DELETE FROM table_name 
(Note: Deletes the entire table!!)

DELETE * FROM table_name 
(Note: Deletes the entire table!!)

-- DROP DATABASE
DROP DATABASE database_name

-- DROP INDEX
DROP INDEX index_name (MySQL)

-- DROP TABLE
DROP TABLE table_name

-- GROUP BY
SELECT column_name, aggregate_function(column_name)
FROM table_name
WHERE column_name operator value
GROUP BY column_name

-- HAVING
SELECT column_name, aggregate_function(column_name)
FROM table_name
WHERE column_name operator value
GROUP BY column_name
HAVING aggregate_function(column_name) operator value

-- IN
SELECT column_name(s)
FROM table_name
WHERE column_name
IN (value1,value2,..)

-- INNER JOIN
SELECT column_name(s)
FROM table_name1
INNER JOIN table_name2 
ON table_name1.column_name=table_name2.column_name

-- LEFT JOIN
SELECT column_name(s)
FROM table_name1
LEFT JOIN table_name2 
ON table_name1.column_name=table_name2.column_name

-- RIGHT JOIN
SELECT column_name(s)
FROM table_name1
RIGHT JOIN table_name2 
ON table_name1.column_name=table_name2.column_name

-- FULL JOIN
SELECT column_name(s)
FROM table_name1
FULL JOIN table_name2 
ON table_name1.column_name=table_name2.column_name

-- LIKE
SELECT column_name(s)
FROM table_name
WHERE column_name LIKE pattern

-- ORDER BY
SELECT column_name(s)
FROM table_name
ORDER BY column_name [ASC|DESC]

-- SELECT
SELECT column_name(s)
FROM table_name

-- SELECT *
SELECT *
FROM table_name

-- SELECT DISTINCT
SELECT DISTINCT column_name(s)
FROM table_name

-- SELECT INTO
SELECT *
INTO new_table_name [IN externaldatabase]
FROM old_table_name
or

SELECT column_name(s)
INTO new_table_name [IN externaldatabase]
FROM old_table_name

-- UNION
SELECT column_name(s) FROM table_name1
UNION
SELECT column_name(s) FROM table_name2

-- UNION ALL
SELECT column_name(s) FROM table_name1
UNION ALL
SELECT column_name(s) FROM table_name2

-- UPDATE
UPDATE table_name
SET column1=value, column2=value,...
WHERE some_column=some_value

-- WHERE
SELECT column_name(s)
FROM table_name
WHERE column_name operator value