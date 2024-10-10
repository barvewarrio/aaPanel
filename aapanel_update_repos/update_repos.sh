#!/bin/bash

# 定义变量
releasever=7
basearch=x86_64
stream=stream
backup_dir="/etc/yum.repos.d/backup_$(date +%Y%m%d_%H%M%S)"

# 创建备份目录并备份现有的 repo 文件
mkdir -p "$backup_dir"
cp /etc/yum.repos.d/*.repo "$backup_dir"

# 禁用所有现有的仓库
sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/*.repo

# 替换为阿里云镜像源
cat <<EOF > /etc/yum.repos.d/CentOS-Stream-AppStream.repo
[AppStream]
name=CentOS Stream \$releasever - AppStream
baseurl=http://mirrors.aliyun.com/centos/\$stream/AppStream/\$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF

cat <<EOF > /etc/yum.repos.d/CentOS-Stream-BaseOS.repo
[BaseOS]
name=CentOS Stream \$releasever - BaseOS
baseurl=http://mirrors.aliyun.com/centos/\$stream/BaseOS/\$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF

cat <<EOF > /etc/yum.repos.d/CentOS-Stream-Extras.repo
[extras]
name=CentOS Stream \$releasever - Extras
baseurl=http://mirrors.aliyun.com/centos/\$stream/extras/\$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF

cat <<EOF > /etc/yum.repos.d/CentOS-Stream-PowerTools.repo
[PowerTools]
name=CentOS Stream \$releasever - PowerTools
baseurl=http://mirrors.aliyun.com/centos/\$stream/PowerTools/\$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF

# 清除yum缓存并生成新的缓存
yum clean all
yum makecache

# 重新尝试安装 aaPanel
URL=https://www.aapanel.com/script/install_7.0_en.sh
if [ -f /usr/bin/curl ]; then
    curl -ksSO "$URL" && bash install_7.0_en.sh aapanel
else
    wget --no-check-certificate -O install_7.0_en.sh "$URL" && bash install_7.0_en.sh aapanel
fi

echo "镜像源已成功更换为阿里云镜像源。"
