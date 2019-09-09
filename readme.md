# 这是一个简易的ROM刷机包下载网站

## 网站在线预览
[前台在线预览](http://106.13.218.180:8080/ROMMS) <br>

[后台在线预览](http://106.13.218.180:8080/ROMMS/admin/adminLogin.jsp)
- 后台帐号:admin123456 <br>
- 密码:admin123456


## 其他项目在线预览（以下项目均基于人人商城二次开发）
+ 机种送检系统（独立开发）
	+ [在线预览](http://106.13.218.180/machine)
	+ 管理员帐号：adminer	密码：admin123456
	+ 操作员帐号：check		密码：check123456
+ 趣客任务发放系统（负责后台素材库和任务批量发放）
	+ [在线预览](http://106.13.218.180/quke)
	+ 管理员帐号：adminer	密码：qukeadmin
+ 员工报餐系统(后台+小程序，这里只放了后台，负责后台开发以及部分小程序页面)
	+ [在线预览](http://106.13.218.180/lunch)
	+ 管理员帐号：adminer	密码：admin123456
	
## 运行环境

```html
jdk>=1.7
tomcat>=8.0
mysql>=5.5
```

## 项目部署

```html
1.  安装JDK并添加环境变量 <br>
2.  下载对应版本[tomcat](https://tomcat.apache.org/)并解压至任意目录，最好不要中文目录 <br>
3.  通过git clone克隆或者下载解压项目至tomcat站点目录，默认是weapps目录 <br>
4.  创建romms数据库并导入sql <br>
5.  打开WEB-INF\classes\applicationContext.xml，配置数据库的相关信息 <br>
6.  开启tomcat，浏览器访问localhost:8080/ROMMS <br>
7.  OVER!!!!!
```

## 网站效果图<br>
**前台：**<br>![1](./preview/front.png)
**后台：**<br>![2](./preview/backend.png)<br>

