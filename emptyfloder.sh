#!/bin/bash

# this a small file to make the empty folder clean

# todo: 需要指定参数，如果没有参数提示参数列表
# 支持参数为：
## check - 检查空目录
## fill - 填充空目录，使用.slboat文件，或许可以更改它，或许呢
## delete - 删除所有填充使用的空文件，这里是.slboat

# Ust this to make the file name for the small file
FILL_FILE=".slbot" 

# this is the file content info
File_Message="it's a file use for slboat by once time:)"

#if [$1 = "fill"] then
#开始找空目录，检查运行目录
find . -empty -type d | while read empty_folder
do
  echo
	echo -e "I found a empty folder: \n\t"$(readlink -f $empty_folder)
	echo
	echo -e "now i will put a small file to it,which is:\n\t"$(readlink -f ${empty_folder}/.slboat)
	# 建立一个文件
	touch ${empty_folder}/.slboat
	# 可选写入一些日期？
	echo $File_Message > ${empty_folder}/.slboat
	# 完成了工作
	echo
	echo "ok!i made it done,check file info for it:"
	file ${empty_folder}/.slboat
	# 完成任务，清空
	echo 
done
#fi

# in case you wana delete them all 
# plz use this command for this job
#find . -name ".slboat" -exec rm -fv {} \;

