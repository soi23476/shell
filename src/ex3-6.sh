#!/bin/bash

if [ $# -lt 2 ]; then
    echo " 셸 스크립트 오류: 최소 2개의 인자를 입력해야 합니다."
    exit 1
fi

echo "[셸 스크립트 시작]"
echo "Python 실행 파일에 인자 $# 개를 전달합니다."
./my_app.py "$@"

echo "[셸 스크립트 종료]"
