# dockerfile-for-yaze

YAZEはCP/Mのエミュレーターです。\
[YAZE-AG - Yet Another Z80 Emulator by AG (V 2.40.5 / V 2.30.3)](http://www.mathematik.uni-ulm.de/users/ag/yaze/)


プログラミング学習の中でアセンブラ言語と機械語に触れてみたいと思い8bitコンピューターのエミュレーター環境を構築しました。
dockerfileでまとめたので必要な方はどうぞ


エミュレートする環境は \
CPU: Z80 / OS: CP/M 2.2


## LOAD, PIPコマンドの導入

```
docker run -it <ID>
```

```
yaze
```

でエミュレーターを起動
```
A> PIP A:LOAD.COM=C:LOAD.COM

A> PIP A:PIP.COM=C:PIP.COM
DESTINATION IS R/O, DELETE (Y/N)? Y
```
## モニタープログラムの導入

[MON80](http://www.amy.hi-ho.ne.jp/officetetsu/sbc/sbc/devel/man-mon80.html)

CP/M2.2環境でYAZEを起動

デフォルトだとCP/M3.1で起動する
(3.1と2.2の違いが分からなかった
、、、)

```
$ yaze -l -1 -b yaze.boot
```

モニタープログラムをインストール

```
A>PIP A:MON80.ASM=C:MON80.ASM

A>B:MAC MON80
CP/M MACRO ASSEM 2.0
2946
01BH USE FACTOR
END OF ASSEMBLY

A>LOAD MON80

FIRST ADDRESS 0100
LAST  ADDRESS 2945
BYTES READ    2846
RECORDS WRITTEN 51
```

## CP/M2.2でメモリ操作

```
$ yaze -l -1 -b yaze.boot
```

```
A>MON80

MON80 Version 2.1 CP/M Edition
Intel8080 Monitor Program
(C)1996-2006 Office TETSU

[8000]
```

モニタープログラムが起動できました。