#!/bin/sh

# w 画像の横幅
# h 分割する縦幅=横幅×1.4　A4比率
# ph 分割済み縦幅
# ah 画像の縦幅
# subcount ループカウンタ

w=`convert $1.png -format "%w" info:`
h=`expr ${w} \* 14 \/ 10`
ph=0
ah=`convert $1.png -format "%h" info:`
subcount=1

while [[ ${ph} -lt ${ah} ]]; do
	echo ${subcount}
	convert -crop ${w}x${h}+0+${ph} $1.png $1-${subcount}.jpg

	ph=`expr ${h} \* ${subcount}`
	subcount=$((subcount+1))
done