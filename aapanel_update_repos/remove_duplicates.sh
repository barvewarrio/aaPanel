#!/bin/bash

# 定义要搜索的目录
REPO_DIR="/etc/yum.repos.d"

# 定义要查找的重复部分
SECTION="[extras]"

# 查找所有包含指定部分的文件
FILES=$(grep -rl "^\[${SECTION}\]" ${REPO_DIR})

# 遍历找到的文件
for FILE in ${FILES}; do
    # 检查文件是否真的包含多个指定部分
    COUNT=$(grep -c "^\[${SECTION}\]" ${FILE})
    if [ ${COUNT} -gt 1 ]; then
        # 创建文件备份
        cp ${FILE}${FILE}.bak
        # 删除重复的部分，只保留第一个
        awk -v section="${SECTION}" '
        BEGIN { keep=1 }
        /^\['section']/ { if (keep) { keep=0; next } else { print "## DELETED DUPLICATE SECTION ##"; next } }
        { print }
        ' ${FILE}.bak >${FILE}
        echo "Duplicates removed from ${FILE}. Original file backed up as${FILE}.bak"
    fi
done
