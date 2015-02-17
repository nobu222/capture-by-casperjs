#!/bin/sh
# 依存コマンド
# node.js
# casperjs
# phantomjs
# imgmagick

# 手順
# キャプチャしたいページをクリップボードに	
# その状態でcasper.commandをクリックで実行
# デスクトップにcapture.pdfが出力されます

cd `dirname $0`

pbpaste > ./host.txt

count=1
cat './host.txt' | grep '^[https?]' | while read line
do
	casperjs cap.js --hostname=${line} --count=${count}
	sh crop.sh ${count}
	count=$((count+1))
done

convert *.jpg capture.pdf
mv ./capture.pdf ${HOME}/Desktop/

rm ./*png
rm ./*jpg
