# aapanel_chinese

#### 介绍
本项目为aapanel(宝塔海外版)的中文语言包。    
为了版本兼容性以及后续更新，本包只汉化了语言配置文件。    
宝塔有部分文本分散写在模板以及面板代码内，因此汉化并不完整。     
本次使用腾讯云机器翻译API汉化，汉化准确性提升，感觉腾讯的比谷歌百度都要好。  

#### aaPanel installation script

[View detailed installation tutorials](https://forum.aapanel.com/d/9-aapanel-linux-panel-673-installation-tutorial)

**Centos**

```
yum install -y wget && wget -O install.sh http://www.aapanel.com/script/install_6.0_en.sh && bash install.sh aapanel
```

**Ubuntu/Deepin**

```
wget -O install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh && sudo bash install.sh aapanel
```

**Debian**

```
wget -O install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh && bash install.sh aapanel
```

注意：确保是干净的操作系统，没有安装Apache/Nginx/php/MySQL等其他环境（现有环境可以不安装）

推荐使用Chrome、Firefox、edge浏览器访问面板登录地址

#### 演示图片    

 ![simplified_chinese.jpg](https://gitee.com/gacjie/aapanel_chinese/raw/master/simplified_chinese.jpg)   
  ![traditional_chinese.jpg](https://gitee.com/gacjie/aapanel_chinese/raw/master//traditional_chinese.jpg)   

#### 目录说明
/english   英文原版文件    
/simplified_chinese   中文简体汉化文件     
/traditional_chinese   中文繁体汉化文件      

#### 相关文章
[宝塔海外版aapanel升级(降级)指定版本](https://www.baota.me/post-264.html)     
[新蓝白配色清新宝塔面板模板美化主题](https://www.baota.me/post-233.html) 

#### 命令行安装   
以6.8.27中文简体版本为例，其他版本请复制[发行版](https://gitee.com/gacjie/aapanel_chinese/releases) 内支持版本的下载链接替换教程链接。 
下载资源包   
```shell-session
wget -O aapanel_chinese.zip https://gitee.com/gacjie/aapanel_chinese/releases/download/6.8.27/aapanel_simplified_chinese_6827.zip
```
解压到覆盖资源文件
```shell-session
unzip -o aapanel_chinese.zip -d /www/server/
```
重启面板
```shell-session
/etc/init.d/bt restart
```
最后还需要手动清理浏览器缓存


#### 技术交流      

技术教程：www.baota.me     
QQ交流群：699927761      
TG交流群：t.me/btfans    

