#!/bin/bash
# this a small file to make the empty folder clean
# 01:02 2013-05-15 

# 注意：
## 仅仅支持BASH，因为使用了(())运算符

# todo: 
## 需要指定参数，如果没有参数提示参数列表
## 可以检查写入了标记文件，但是已经不是空文件夹的地方
## 排除目录，一个排除数组？在结果里过滤啥子的

# 支持参数为：
## check - 检查空目录
## fill - 填充空目录，使用.slboat文件，或许可以更改它，或许呢
## delete - 删除所有填充使用的空文件，这里是.slboat

# Ust this to make the file name for the small file
FILL_NAME=".slboat" 

# this is the file content info
File_Message="it's a file use for slboat by once time:)"

if [ $# -eq 0 ]
then
	echo "you need chooice a comand"
	echo "like: ls,fill,clean"
	echo
	exit 1;
fi
if [ $1 = "fill" ]
then
	# 开始找空目录，检查运行目录
	empty_folders_count=0
	# 检查空目录
	# 约定首行不要太多空格
	echo "start fill empty folder..."
	echo
	# 这里的符号是非常有趣的怪异
	list=`find . -empty -type d`
	for empty_folder in $list
	do
		# log a file
		((empty_folders_count++))
		echo -e "put $FILL_NAME to "$(readlink -f ${empty_folder}/$FILL_NAME)
		# 建立一个文件
		touch ${empty_folder}/$FILL_NAME
		# 可选写入一些日期？
		echo $File_Message > ${empty_folder}/$FILL_NAME
		# 完成了工作
		#file ${empty_folder}/$FILL_NAME
		# 完成任务，清空
	done
	if [ $empty_folders_count -eq 0 ]
	then
		# 没有空文件夹
		echo
		echo -e "I can't found any empty folder to fill:)"
		echo
	else
		echo
		echo -e "So there are $empty_folders_count empty folders"
		echo -e "Maybe you like not let them happen,you can use me with the fill comman"
		echo
	fi
	exit 0
elif [ $1 = "ls" ]
then
	#初始化统计
	empty_folders_count=0
	# 检查空目录
	# 约定首行不要太多空格
	echo "start ls empty folder..."
	echo
	list=`find . -empty -type d`
	for empty_folder in $list
	do
		#只能支持bash看起来
		((empty_folders_count++))
		echo -e "$(readlink -f $empty_folder)"
	done
	# 是的数字也工作
	if [ $empty_folders_count -eq 0 ]
	then
		# 没有空文件夹
		echo
		echo -e "I can't found any empty folder:)"
		echo
	else
		echo
		echo -e "Finish fill $empty_folders_count empty folders"
		echo -e "Now them are not empty anymore:)"
		echo
	fi
	exit 0
elif [ $1 = "clean" ]
then
	# in case you wana delete them all 
	# plz use this command for this job
	clean_folders_count=0
	echo "start clean all the $FILL_NAME file in: $(pwd)"
	echo 
	list=`find . -name $FILL_NAME`
	for fill_folder in $list
	do
		# 严格注意不要发生意外
		((clean_folders_count++))
		rm -fv $fill_folder
	done
	echo
	if [ $clean_folders_count -eq 0 ]
	then
		echo "can't find any $FILL_NAME file"
	else
		echo "just clecn $clean_folders_count folder which have $FILL_NAME"
	fi
	echo -e "clean finish"
	exit 0
else
	echo "you need chooice a comand"
	echo "like: ls,fill,clean"
	exit 1
fi
