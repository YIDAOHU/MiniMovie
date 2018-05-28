# Django实现微电影网站<br>
## 主要实现功能: 注册，登陆，播放视频，评论视频，xadmin实现后台提供视频管理，权限管理等等<br>

### 首页(搜索，筛选）<br>
![图片](https://images2018.cnblogs.com/blog/1242176/201805/1242176-20180528165151191-114852409.png)<br>
### 搜索页面<br>
![图片](https://images2018.cnblogs.com/blog/1242176/201805/1242176-20180528165337123-1679524156.png)<br>
### 播放页面<br>
![图片](https://images2018.cnblogs.com/blog/1242176/201805/1242176-20180528165418937-589612978.png)<br>
### 个人中心<br>
![图片](https://images2018.cnblogs.com/blog/1242176/201805/1242176-20180528165507402-1228378097.png)<br>
### 后台<br>
![图片]https://images2018.cnblogs.com/blog/1242176/201805/1242176-20180528165610991-617319902.png)<br>
### 环境配置：python2.7  pip install -r requirements.txt<br>

### 创建数据库将movie.sql文件导入<br>

### 进入项目目录执行如下命令：<br>

python manage.py collectstatic(关闭了debug需要收集静态文件)<br>

python manage.py runserver 0.0.0.0：8000<br>

### 打开浏览器输入：http://127.0.0.1:8000<br>

### 说明：<br>
视频文件可以使用七牛云的外链，也可以本地上传，可以在play.html文件中修改(文件这有注释说明）<br>
后台：http://127.0.0.1:8000/admin  用户名：sky  密码：1234mdzz
