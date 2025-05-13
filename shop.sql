
-- 创建并选择数据库
CREATE DATABASE IF NOT EXISTS shop;
USE shop;

-- 建表并插入数据
CREATE TABLE good (
  sid INT,
  sname VARCHAR(40),
  sprice FLOAT
);
INSERT INTO good (sid, sname, sprice) VALUES
(1, '龙族2', 22.5),
(2, '龙族3', 32.4),
(3, '贖罪', 25.9),
(4, '英雄无敌', 26.9),
(5, 'Robinson Crusoe', 42.5);
INSERT INTO good (sid, sname, sprice) VALUES
(6, '三体', 38.0),
(7, '哈利·波特', 45.5),
(8, '偷影子的人', 29.9),
(9, '追风筝的人', 34.5),
(10, '活着', 23.8),
(11, '百年孤独', 39.9),
(12, '解忧杂货店', 27.5),
(13, '白夜行', 31.6),
(14, '嫌疑人X的献身', 28.4),
(15, '小王子', 19.9),
(16, '围城', 22.2),
(17, '悲惨世界', 36.6),
(18, '月亮与六便士', 33.3),
(19, '人类简史', 44.0),
(20, '时间简史', 40.2);
