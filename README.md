A Small Script for check clean fill empty folder


i use it for s3cmd

usage:
 emptyfoldercheck ls: check the empty folder and list it  
 emptyfoldercheck fill: fill the empty folder with .slboat  
 emptyfoldercheck clean: clean all the fill file .slboat  
 
for easy to use it,you may can use alias for it:  
alias emptyfolder=$PWD/emptyfolder.sh

example:
# list empty folder
[root@SLboat testfolder]# emptyfloder ls
start ls empty folder...

/root/testfolder/iempty3
/root/testfolder/iempty2
/root/testfolder/iempty1

So there are 3 empty folders
Maybe you like not let them happen,you can use me with the fill comman

# fill empty folder
[root@SLboat testfolder]# emptyfloder fill
start fill empty folder...

put .slboat to /root/testfolder/iempty3/.slboat
put .slboat to /root/testfolder/iempty2/.slboat
put .slboat to /root/testfolder/iempty1/.slboat

So there are 3 empty folders
Maybe you like not let them happen,you can use me with the fill comman

# clean fill file
[root@SLboat testfolder]# emptyfloder clean
start clean all the .slboat file in: /root/testfolder

removed `./iempty3/.slboat'
removed `./iempty2/.slboat'
removed `./iempty1/.slboat'

clean finish
