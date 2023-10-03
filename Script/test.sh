#! /bin/bash
:<<EOF
Execute the file using bash, the Bourne again shell, or a compatible shell,
This is a by default shell in Linux
EOF

echo "---------------------------------------------------"
echo "-----------------function example------------------"
echo "---------------------------------------------------"
#functions
:<<EOF
date->外部程式
today=$(date +%Y-%m-%d), 可以自行加入想要先顯示的時間格式, 不然就以default形式顯示。
EOF
function show_name(){
    echo -e "Date: $1, I'm $2, IP: $3. \n"
}
name="$1"
ip="10.10.10.33:5"
today=$(date)
show_name "$today" "$name" "$ip"

funWithReturn(){
    echo "這個函數會對輸入的兩個數字進行相加運算..."
    echo "輸入第一個數字: "
    read -r FirstNum
    echo "輸入第二個數字: "
    read -r SecondNum
    echo "兩個數字分别為 $FirstNum 和 $SecondNum !"
    return $((FirstNum + SecondNum))
}
funWithReturn
echo -e "輸入的兩個數字之和為 $? ! \n"

funWithParam(){
    echo "第一個參數為 $1 !"
    echo "第二個參數為 $2 !"
    echo "第十個參數為 $10 !"      # 注意，$10 不能獲取第十個參數，獲取第十個參數需要 ${10}。
                                  # 當 n >= 10 時，需要使用 ${n} 來獲取參數。
    echo "第十個參數為 ${10} !"    # 可以過這個範例看一下 echo $10 跟 ${10} 結果以及它的區別
    echo "第十一個參數為 ${11} !"
    echo "參數總數有 $# 個!"
    echo "作為一個字符串輸出所有參數 $* !"
}
funWithParam 1 2 3 4 5 6 7 8 9 34 73
echo

echo "---------------------------------------------------"
echo "---------------------sleep test--------------------"
echo "---------------------------------------------------"
sleep 3 #sleep for seconds

echo
echo -e "Good night! \n"

echo "---------------------------------------------------"
echo "----------example of comparing variables-----------"
echo "---------------------------------------------------"
# comparsion of variables
:<<EOF
以下情況也可以用if ((a > b )); then
EOF
a=3
b=2
if [ $a -gt $b ] ; then         # greater than --- 大於
  echo -e "3>2 \n"
fi

echo "---------------------------------------------------"
echo "-----------example of comparing files--------------"
echo "---------------------------------------------------"
#　comparsion of files
diff -u <(sort data3.txt) <(sort data2.txt) >/dev/null
comp_value=$?

if [ $comp_value -eq 1 ]
then
    echo "data3 and data2 are different"
else
    echo "data3 and data2 are identical"
fi

#　comparsion of files, 管線應用，也就是命令組合
cat data3.txt | sort > sort1.txt

if cmp -b "sort1.txt" "data2.txt"
then
   echo -e "The files match. \n"
   rm sort1.txt
else
   echo -e "The files are different. \n"
   cat sort1.txt data3.txt
fi

echo "---------------------------------------------------"
echo "-------------------format example------------------"
echo "---------------------------------------------------"
# 檢查檔案是否存在
:<<EOF
也可以用if[-e "hello_world.cpp"]
或是用if test -e ./hello_world.cpp
EOF
if [ ! -f "hello_world.cpp" ]; then
    echo " file isn't exist "
else
    echo " file exist "
fi

# 檢查檔案是否可執行
if [ -x test.sh ]
then
   echo -e " file is excutable. \n "
else
   echo -e " file isn't excutable. \n"
fi

echo "---------------------------------------------------"
echo "------------------for loop example-----------------"
echo "---------------------------------------------------"
#for loop, for "variables" in "scpoe"
for char in {A..G}; do
    echo "$char"
done
echo

:<<EOF
loop也可以用來列出特定目錄下的想搜尋的檔案
如果要搜尋所有/特定目錄含有特定﹝關鍵字﹞的路徑,可以用find或locate
ex:locate txt, 會列出有關鍵字"txt"的檔案，包括路徑
locate 與 find 不同: find 是去硬盤找, locate 只在 /var/lib/slocate 資料庫中找，
有可能會找不到最近新增的檔案，但相對搜尋速度會比較快。
EOF
DIR='/c/Users/levi/Script'
for FILE in "$DIR"/*.txt
do
    echo -e "$FILE"
done
echo

find /c/Users/levi/Script/*.txt
echo

echo "---------------------------------------------------"
echo "-----------------while loop example----------------"
echo "---------------------------------------------------"
#　while loop, for "variables" in "scpoe"
int=1
while(( $int <= 5 ))
do
    echo int=$int
    int=$(($int+1))      # ((int++)) || true
done
echo

:<<EOF
ＮＯＴＥ！！
最常見的, 在shell script中也是最重要的讀檔案資料方式。
EOF
while IFS=- read -r line; do
    echo -e "$line"
done < data1.txt
echo

echo "---------------------------------------------------"
echo "--------------------grep example-------------------"
echo "---------------------------------------------------"
cat /dev/null > keywords.txt
cat setup.txt > keywords.txt
echo "請輸入你想搜尋的字符串:"
read -r vocab
grep -e "$vocab" poem.txt >> keywords.txt
if cmp -s "setup.txt" "keywords.txt"
then
   echo -e "Don't find \"$vocab\"."
else
   echo -e "Find out \"$vocab\" in the file."
fi
sleep 3
vi keywords.txt
echo -e " grep \"$vocab\" comfirm accomplishments! \n\n\n"


echo "~~~~~~~~~~~~~EXAMPLE END~~~~~~~~~~~~~~~~"
exit 0
