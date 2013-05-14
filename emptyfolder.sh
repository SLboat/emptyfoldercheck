#!/bin/bash
# this a small file to make the empty folder clean

# 注意：
## 仅仅支持BASH，因为使用了(())运算符

# todo: 需要指定参数，如果没有参数提示参数列表
# 支持参数为：
## check - 检查空目录
## fill - 填充空目录，使用.slboat文件，或许可以更改它，或许呢
## delete - 删除所有填充使用的空文件，这里是.slboat

# Ust this to make the file name for the small file
FILL_FILE=".slbot" 

# this is the file content info
File_Message="it's a file use for slboat by once time:)"

if [ $# -eq 0 ]
then
	echo "you need chooice a comand"
	echo "like: check,fill,help"
	echo
	exit 1;
fi
if [ $1 = "fill" ]
then
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
	exit 0
elif [ $1 = "check" ]
then
	#初始化统计
	empty_folders_count=0
	# 检查空目录
	# 约定首行不要太多空格
	echo "start check empty folder..."
	echo
	list=`find . -empty -type d`
	for empty_folder in $list
	do
		#只能支持bash看起来
		((empty_folders_count++))
		echo -e "$(readlink -f $empty_folder)"
	done
	# shell 的类型太怪异了，仅仅当做字符来匹配好了
	if [ $empty_folders_count -eq 0 ]
	then
		# 没有空文件夹
		echo
		echo -e "\tI Can't Found Any Empty Folder:)"
		echo
	else
		echo $empty_folders_count
		echo -e "So there are $empty_folders_count Empty Folder"
		echo -e "Maybe you like not let them happen,you can use me with the fill comman"
		echo
	fi
	exit 0
elif [ $1 = "clean" ]
then
	# in case you wana delete them all 
	# plz use this command for this job
	echo "start clean all the .slboat file in: $(pwd)"
	echo 
	find . -name ".slboat" -exec rm -fv {} \;
	echo
	echo -e "clean finish"
fi



