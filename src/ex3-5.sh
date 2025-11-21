#!/bin/bash

echo "--- Ex 3-5.sh: eval을 활용한 동적 명령어 실행 ---"

my_linux_command() {
    local options="$@" 

    echo -e "\n[함수 실행] 명령어: ls $options"
    eval ls "$options"
}

echo "스크립트에 전달된 모든 인자: $@"

my_linux_command "$@"

echo -e "\n--- 실행 완료 ---"
