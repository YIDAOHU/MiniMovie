# -*- coding: UTF-8 –*-

from random import Random

from users.models import EmailVerifyRecord
# 导入Django自带的邮件模块
from django.core.mail import send_mail
# 导入setting中发送邮件的配置
from website.settings import EMAIL_FROM


# 生成随机字符串
def random_str(random_length=8):
    first_str = ''
    # 生成字符串的可选字符串
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789'
    length = len(chars) - 1
    random = Random()
    for i in range(random_length):
        first_str += chars[random.randint(0, length)]
    return first_str


# 发送注册邮件
def send_register_email(email, send_type="register"):
    # 发送之前先保存到数据库，到时候查询链接是否存在
    # 实例化一个EmailVerifyRecord对象
    email_record = EmailVerifyRecord()
    # 生成随机的code放入链接
    if send_type == "update_email":
        code = random_str(4)
    else:
        code = random_str(16)
    email_record.code = code
    email_record.email = email
    email_record.send_type = send_type

    email_record.save()

    if send_type == "register":
        email_title = "慕学在线注册激活链接"
        email_body = "请点击下面的链接激活你的账号: http://127.0.0.1:8000/active/{0}".format(code)
        # 使用Django内置函数完成邮件发送。四个参数：主题，邮件内容，从哪里发，接受者list
        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass
    elif send_type == "forget":
        email_title = "慕课在线找回密码链接"
        email_body = "请点击下面的链接重置密码: http://127.0.0.1:8000/reset/{0}".format(code)
        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass
    elif send_type == "update_email":
        email_title = "慕学在线修改邮箱验证码"
        email_body = "您的邮箱验证码为：{0}".format(code)
        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass




