使用教程：

①
首先使用idea打开本项目，
配置运行环境维java17+tomcat9，（别的版本也可能可以运行）

②
添加依赖mysql-connector-j-9.1.0.jar
需要创建mysql数据库，具体的sql语句在shop.sql
数据库的配置在DBBean.java文件里，记得修改连接mysql的user和password
③
启动运行。默认配置写在WEB-INF/web.xml文件里。


//本项目实际上没有使用maven架构，java文件请写在src/main/java/org/路径下
