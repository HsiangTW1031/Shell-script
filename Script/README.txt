/ ********************************************************************** /
/ 								                                                       /
/ 			              Shell Script Information                           /
/								                                                         /
/    Editor : Levi Wu 	Date : 2023.9.25                                 /
/    Git Version : git version 2.42.0.windows.2	                         /
/    Bash Version : GNU bash, version 5.2.15(1)-release (x86_64-pc-msys) /
/ ********************************************************************** /

// -----------------------------概述------------------------------------ //
Shell 是一个用 C 語言編寫的程序，它是用户使用 Linux 的橋梁。Shell 既是一種命令語言，又是一種程序設計語言。
Shell 是指一種應用程序，這個應用程序提供了一個界面，用户通過這個界面訪問操作系统内核的服務。
Ken Thompson 的 sh 是第一種 Unix Shell，Windows Explorer 是一个典型的圖形界面 Shell。

Shell 腳本（shell script），是一種為 shell 編寫的腳本程序。
業界所说的 shell 通常都是指 shell 腳本，但要知道，shell 和 shell script 是兩個不同的概念。
由於習慣的原因，簡潔起見，以下出現的 "shell Coding" 都是指 shell 腳本編程，不是指開發 shell 自身。

// ----------------------------Shell 環境------------------------------- //
Shell Coding跟 JavaScript、php Coding跟一樣，只要有一个能编寫代碼的editor和一个能解释執行的腳本編譯器就可以了。

Linux 的 Shell 種類眾多，常見的有：

/ ************************************************************************************************************************************************* /
/ 序號 /       shell 名稱          /         執行檔名         /       原始開發者       /      有無開放原始碼的版本或衍生版本       /        授權協議      /
/  1   / Bourne Shell             / （/usr/bin/sh或/bin/sh） / Stephenn Bourne       / 有(4.4BSD-Lite以後)，Charles Forsyth版本 / BSD & Public Domain /
/  2   / Bourne Again Shell       / （/bin/bash）            / Brian Fox, Chet Ramey / 有                                      / GPL                 /
/  3   / C Shell                  / （/usr/bin/csh）         / Bill Joy              / 有                                      / GPL                 /
/  4   / Korn Shell 93            / （/usr/bin/ksh93）       / David Korn            / 有                                      / Public Domain       /
/  5   / Public Domain Korn shell / （/bin/pdksh）           / Eric Gisin            / 有                                      / BSD                 /
/  6   / Tenex C shell            / （/bin/tcsh）            / Ken Greer             / 有                                      / BSD                 /
/  7   / Z-shell shell            / （/usr/bin/zcsh）        / Paul Falstad          / 有                                      / MIT-like            /
....

內容主要以 Bash 為主，也就是 Bourne Again Shell，由於使用性佳和免費，且 Bash 在日常工作中被廣泛使用。同时，Bash 也是大多數Linux 系统默認的 Shell。
在一般情况下，人們並不區分 Bourne Shell 和 Bourne Again Shell，所以，像 #!/bin/sh，它同樣也可以改為 #!/bin/bash。

#! 告訴系統其後路徑所指定的程序即是編譯此腳本文件的 Shell 程序，在計算領域中，Shebang（也稱為Hashbang）是一個由井號和驚嘆號構成的字元序列#!，
這是一個既定的形式，會出現在文字檔案的第一行的前兩個字元。 在檔案中存在Shebang的情況下，Unix-like 作業系統的程式載入器會分析Shebang後的內容，
將這些內容作為直譯器指令，並呼叫該指令，並將載有Shebang的檔案路徑作為該直譯器的參數。

// ----------------------------Shell 是甚麼?----------------------------- //
Linux/BSD 系統可分成三個重要的部分 : 

1. 核心 (kernel)
2. shell
3. 工具程式

               ##########
             ##   Shell  ##         
           ##              ##          解譯命令傳入核心     + * * * * * * * * * * * * * +
         ##      ######      ##   <---------------------  *                            *
       ##       ##    ##       ##                         *      Login : 系統操作者     *
       ##      ## Core ##      ## --------------------->  *                            *
         ##     ##    ##     ##        執行命令傳回結果     + * * * * * * * * * * * * * +
           ##    ######    ##
             ##          ##
               ##########

核心的部分相當低階，操作者不易和它直接溝通，因此必須要有一個友善的介面(interface)，
讓使用者可以在與核心溝通時更為方便，而這個介面便是 shell。

不只 Linux/BSD 有這一層 shell ，其他作業系統也有，例如: DOS 的 COMMAND.COM、Windows 和 Mac OS 的 GUI 圖形介面、
KDE、GNOME、Unity 的環境桌面等等，都可以說是 shell 的一種。

相較於 Windows 平台這種圖形式(Graphic base)，介面十分友善的命令編譯器 --- GUI，Unix-like 家族的作業系統(Linux/BSD)對 shell 的處理，
為文字導向(Text basic)，需一段時間學習方可上手，但採取獨立、自由開放的政策，因此shell的種類相當地多，可以讓人自由切換，靈活性較高，是系統維護管理時的重要工具。 

// -----------------------------Shell 變數------------------------------- //
※ 定義類型
# 運行shell時，會同時存在三種變數：
1. 局域變數: 局部變數在腳本或命令中定義，僅在當前shell實例中有效，其他shell啟動的程序不能訪問局域變數。
2. 環境變數: 所有的程序，包括shell啟動的程序，都能訪問環境變數，有些程序需要環境變數来保證其正常運行。
   必要的時候shell脚本也可以定義環境變數。
3. shell變數: shell變數是由shell程序設置的特殊變數。shell變數中有一部分是環境變數，有一部分是局域變數，
   這些變數保證了shell的正常運行。

※ 定義變數與規則 
# 可使用英文字母、數字及底線組成，但開頭不能使用數字。
# 變數名稱的長度沒有限制，但英文字母大小寫則有分別。
# 變數名稱=值，但比較好的習慣是，把字串用雙引號或單引號括起來。
ex: my_name="Levi"
(注意:變量名和等號之間不能有空格!!)

# 變數值指的是，變數名稱所代表的記憶體空間所儲存的內容，取得變數值的方法就是在變數名稱前面加上「$」。
ex: echo $my_name 或是 echo ${my_name}
執行結果 : Levi

# bash陣列變數宣告，但只能支援一維，每個變數用空白隔開即可。
ex: array_name=(value0 value1 value2 value3) 或是
array_name=(    或是單獨定義array的各個分量： array_name[0]=value0
value0                                      array_name[1]=value1
value1                                              .
value2                                              .
value3                                              .
)                                           array_name[n]=valuen

# 讀取陣列
# 讀取陣列元素值的一般格式是：${陣列名[下標]}
ex: valuen=${array_name[n]}
# 使用 @ 符號可以獲取陣列中的所有元素
ex: echo ${array_name[@]}
# 使用 # 符號可以獲取陣列中的個數或是陣列中單個元素的長度
ex: count=${#array_name[@]}
ex: length=${#array_name[n]}

# 註解
# 使用 # 符號代表該行為註解，多行註解則是要用
:<<EOF          // ":" 是一个空命令，用於執行後面的 Here 文檔，<<EOF 表示開啟 Here 文檔
註釋内容...
註釋内容...
註釋内容...
EOF
# EOF也可以換成COMMENT或是直接使用空格加上符號
: '
這是註解的部分。
可以有多行内容。
'
// ----------------------------Shell 傳遞參數---------------------------- //
# 我们可以在執行 Shell 腳本時，向腳本傳遞參數，腳本内獲取參數的格式為：$n。
# n 代表一個數字，1 為執行腳本的第一個参數，2 為執行腳本的第二個参數，以此類推……
腳本內:
echo "Shell 傳遞參數！";
echo "執行的文件名：$0";                // 其中 $0 為執行的文件名（包含文件路徑)
echo "第一個參數為：$1";
echo "第二個參數為：$2";
echo "第三個參數為：$3";

Terminal中:
chmod +x test.sh                       // 為腳本設置可執行權限
./test.sh 1 2 3                        // 執行腳本並在後面輸入要傳入腳本內的參數

執行結果 :
Shell 傳遞參數！
執行的文件名：./test.sh
第一個參數為：1
第二個參數為：2
第三個參數為：3

// ------------------------Shell 基本指令整理----------------------------- //
※ Shell echo 命令
# Shell 的 echo 指令與 PHP 的 echo 指令類似，都是用於字符串的輸出。
ex: echo "It is a test"    執行結果 : It is a test  // 與省略雙引號的結果效果一致。

# 想要顯示雙引號可以使用轉義符號"\"。
ex: echo "\"It is a test\""   執行結果 : "It is a test"

# 顯示換行
ex: echo -e "OK! \n"      // -e 開啟轉義
    echo "It is a test"
執行結果 :
OK!

It is a test

# 顯示不換行
ex: echo -e "OK! \c"      // -c 不換行
    echo "It is a test"
執行結果 :
OK! It is a test

# 顯示結果導向文件
ex: echo "It is a test" > myfile

# 原樣輸出字符串，不進行轉義或取變量(用單引號)
ex: echo '$name\"'
執行結果 : $name\"

# 原樣輸出字符串，不進行轉義或取變量(用單引號)
ex: echo `date`   // 執行結果將顯示當前日期
(注意： 這裡使用的是反引號 `, 而不是單引號 '!!)


※ Shell printf 命令
# printf 命令模仿 C 資料庫（library）裡的 printf() 程序。
ex: printf "Hello, Shell\n"
# printf 一樣有格式替代符(%d, %s, %f...)可以使用。
ex: printf "%s %s %s\n" a b c d e f g h i j
執行結果 :
a b c
d e f
g h i
j

※ Shell test 命令
# Shell中的 test 命令用於檢查某個條件是否成立，它可以進行數值、字符和文件三個方面的測試。
數值測試 ex:
num1=100
num2=100
if test $[num1] -eq $[num2]
then
    echo '兩個數相等！'
else
    echo '兩個數不相等！'
fi
執行結果 : 兩個數相等！

字符測試 ex:
num1="Lucky"
num2="Lucy"
if test $num1 = $num2
then
    echo '兩個字符串相等!'
else
    echo '兩個字符串不相等!'
fi
執行結果 : 兩個字符串不相等！

文件測試 ex:
cd /bin
if test -e ./bash              // -e 文件名，代表如果文件存在則為真。
then
    echo '文件已存在!'
else
    echo '文件不存在!'
fi
執行結果 : 文件已存在！

# 另外，Shell 還提供了與( -a )、或( -o )、非( ! )三個邏輯操作符用於將測試條件連接起来，
其優先級為： ! 最高， -a 次之， -o 最低。例如:
cd /bin                                 // 進入bin
if test -e ./File -o -e ./bash          // 文件 File 或 bash 是否存在
then
    echo '至少有一個文件存在!'
else
    echo '兩個文件都不存在'
fi
執行結果 : 至少有一個文件存在!

// ------------------------Linux 常用指令整理----------------------------- //
※Linux cmp 命令
# Linux cmp 命令用於比較兩個文件是否有差異。
# 當相互比較的兩個文件完全一樣時，則該指令不會顯示任何信息。若發現有所差異，
# 預設會標示出第一個不同之處的字符和列數編號。
# 若不指定任何文件名稱或是所给予的文件名为"-"，則cmp指令會從標準輸入設備讀取數據。
ex: cmp prog1.txt prog2.txt 
文件內容相同時，執行結果 :                                              // 不會顯示任何信息
文件內容不同時，執行結果 : prog1.txt prog2.txt differ: char 4, line 1   // 標示出第一個不同之處
(若想顯示是否相同的訊息，可以搭配if else流程控制，並在比對後用 echo 顯示字樣來得知比對後的結果!!)

※Linux grep 命令
# Linux 的 grep 是一個很好用的指令，可以從串流資料或檔案中，
# 使用關鍵字或正規表示法（regular expression）篩選出想要尋找的資料，並且顯示出來。
ex: grep 關鍵字 file1 file2 ...

# 預設會區分字母的大小寫，如果希望以不分大小寫的方式搜尋，可以加上 -i 參數。
# 若要標示匹配文字的行號，可以加上 -n 參數。
# 可以使用顏色標示的方式，將成功匹配的部分文字標示出來，方便使用者閱讀。顏色標示功能可以透過
# --color=never、--color=always、--color=auto 這幾種參數來關閉、開啟或設為自動。
# 如果只想要精準篩選出某這個單字，可以這樣寫 grep "<單字>"

// ----------------------------Shell 流程控制---------------------------- //
※if else

# if 語句語法格式：
# 末尾的 fi 就是 if 倒過来拼寫。
if condition
then
    command1 
    command2
    ...
    commandN 
fi

# if-else 語句語法格式：
# 也可以將then跟if寫在同一行，但必須加上分號 ";"。
if condition ; then
    command1 
    command2
    ...
    commandN
else
    command 
fi

# if else-if else 語句語法格式：
if condition1 ; then
    command1
elif condition2 ; then 
    command2
else
    commandN
fi

# 錯誤寫法 :
# 如果 else 分支沒有語句執行，就不要寫這個 else
if condition ; then
    command1 
    command2
    ...
    commandN 
else {
    // 不做任何事情
}
fi

※for loop

# for loop 一般格式為：
for var in item1 item2 ... itemN
do
    command1
    command2
    ...
    commandN
done

# 也可以寫成一行。
for var in item1 item2 ... itemN; do command1; command2… done;

# 當變量值在列表里，for loop 即執行一次所有命令，使用變量名(var)獲取列表中的當前值(itemN)。
# 命令可為任何有效的 shell 命令和語句。in 列表可以包含替换、字符串和文件名。

※while loop

# while loop 語法格式為：
# while loop 用於不段執行一系列命令，也用於從輸入文件中讀取數據。
while condition
do
    command
done

※until loop

# until loop 語法格式為：
# until loop 執行一系列命令直至條件為 true 時停止。
# until loop 與 while loop 在處理方式上剛好相反。
# 一般 while loop 優於 until loop，但在某些时候，也只是極少數情况下，until loop更加有用。
until condition
do
    command
done

※case

# case 語法格式為：
# 為多选择语句，与其他语言中的 switch ... case 語句類似，是一種多分支選擇結構，
# 每个 case 分支用右圓括號開始，用兩個分號 ;; 表示 break，即執行结束，跳出整个 case ... esac 語句，
# esac（就是 case 反過来）作為结束標記，可以用 case 語句搭配一個值與一個模式，如果匹配成功，執行相匹配的命令。
case var in
mode 1)
    command1
    command2
    ...
    commandN
    ;;
mode 2)
    command1
    command2
    ...
    commandN
    ;;
esac

※ 跳出循環

# 在 loop 過程中，有時候需要在未達到loop结束條件時強制跳出loop，Shell 使用兩個命令来實現該功能 : break 和 continue。

# break 命令
# break 命令允許跳出所有loop（终止執行後面的所有loop）

# continue 命令
# continue 命令與 break 命令類似，只有一點差别，它不會跳出所有loop，僅僅跳出當前loop。

// ------------------------------Shell 函數------------------------------ //
※ 函數定義
# Linux Shell 可以用戶定義函数，然後在shell脚本中可以随時調用。
shell中函数的定義格式如下:
[ function ] funname [()]      // 可以带function fun() 定義，也可以直接fun() 定義,不带任何参數。
{
    action;

    [return int;]              // 参數返回，可以加 return 返回，如果不加，
                               // 將以最後一条條命令運行结果，作為返回值。 return後跟數值n(0-255)。
}

※ 函數參數
# 在Shell中，調用函數時可以向其傳遞参數。在函數内部，通過 $n 的形式来獲取参數的值，
# 例如，$1表示第一個参數，$2表示第二個参數...
例子可詳見Function Example。

// --------------------------------references---------------------------- //
RUNOOB.COM :
 https://www.runoob.com/linux/linux-shell-variable.html

Linux Shell 程式設計與管理實務 : 
https://www.books.com.tw/products/E050038435

鳥哥 :
https://linux.vbird.org/linux_basic/centos7/0320bash.php#bash
