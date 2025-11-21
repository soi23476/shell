#!/bin/bash


# 1. 사용자 정보
show_user_info() {
    echo -e "\n--- 1) 사용자 정보 ---"
    echo "현재 로그인된 사용자: $(whoami)"
    echo "시스템에 접속 중인 사용자 (w):"
    w
}

# 2. CPU 사용률 확인 (top 명령어의 첫 줄만 출력)
show_cpu_usage() {
    echo -e "\n--- 2) CPU 사용률 확인 ---"
    top -bn1 | head -n 5 
}

# 3. 메모리 사용량 확인
show_memory_usage() {
    echo -e "\n--- 3) 메모리 사용량 확인 ---"
    free -h
}

# 4. 디스크 사용량 확인
show_disk_usage() {
    echo -e "\n--- 4) 디스크 사용량 확인 ---"
    df -h
}



while true; do
    echo -e "\n=============================="
    echo "리눅스 시스템 상태 확인 메뉴"
    echo "=============================="
    echo "1) 사용자 정보"
    echo "2) GPU 또는 CPU 사용률 확인"
    echo "3) 메모리 사용량 확인"
    echo "4) 디스크 사용량 확인"
    echo "5) 종료"
    echo "------------------------------"
    read -p "메뉴 번호를 선택하세요 (1-5): " choice

    case $choice in
        1)
            show_user_info
            ;;
        2)
            show_cpu_usage
            ;;
        3)
            show_memory_usage
            ;;
        4)
            show_disk_usage
            ;;
        5)
            echo "시스템 진단 프로그램을 종료합니다."
            exit 0 
            ;;
        *)
            echo " 잘못된 입력입니다. 1에서 5 사이의 숫자를 입력해주세요."
            ;;
    esac
done
