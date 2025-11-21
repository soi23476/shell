#!/bin/bash

DB_DIR="DB"
TRAIN_DIR="train"
ARCHIVE_NAME="db_files.tar.gz"

echo "Ex 3-8.sh: 디렉토리/파일 관리 스크립트"

if [ -d "$DB_DIR" ]; then
    echo "'$DB_DIR' 폴더가 이미 존재합니다."
else
    mkdir "$DB_DIR"
    echo "'$DB_DIR' 폴더를 새로 생성했습니다."
fi
cd "$DB_DIR" || exit
for i in {1..5}; do
    echo "데이터 내용 $i" > "data_$i.txt"
done

tar -czvf "$ARCHIVE_NAME" data_*.txt
echo "파일 5개를 '$ARCHIVE_NAME'으로 압축 완료."

cd ..
mkdir -p "$TRAIN_DIR"
echo " '$TRAIN_DIR' 폴더 생성 완료."

for i in {1..5}; do
    SOURCE_FILE="$DB_DIR/data_$i.txt"
    LINK_NAME="$TRAIN_DIR/link_to_data_$i.txt"
    ln -s "$SOURCE_FILE" "$LINK_NAME"
done

echo " DB 폴더의 파일 5개에 대한 심볼릭 링크를 '$TRAIN_DIR' 폴더에 생성 완료."


echo "DB 폴더 내용 확인: $(ls -l DB)"
echo "train 폴더 내용 확인: $(ls -l train)"
