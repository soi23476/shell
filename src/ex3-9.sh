#!/bin/bash

DB_FILE="DB.txt"

if [ ! -f "$DB_FILE" ]; then
    echo "## Team Database Initialized ##" > "$DB_FILE"
fi
add_member_info() {
    read -p "팀원 이름 입력: " name
    read -p "생일 또는 전화번호 입력: " contact
    
    echo "[MEMBER] $name | $contact" >> "$DB_FILE"
    echo "팀원 정보가 $DB_FILE에 기록되었습니다."
}

record_activity() {
    read -p "활동 날짜 입력 (YYYY-MM-DD 형식 권장): " date_val
    read -p "토의 내용 요약 입력: " activity
    echo "[ACTIVITY] $date_val | $activity" >> "$DB_FILE"
    echo "활동 내용이 $DB_FILE에 기록되었습니다."
}

search_member() {
    read -p "검색할 팀원 이름 입력: " search_name
    echo -e "\n--- [$search_name] 팀원 정보 검색 결과 ---"
    grep "[MEMBER].*$search_name" "$DB_FILE"
}

search_activity() {
    read -p "검색할 날짜 입력 (YYYY-MM-DD): " search_date
    echo -e "\n--- [$search_date] 활동 내용 검색 결과 ---"
    grep "[ACTIVITY].*$search_date" "$DB_FILE"
}


while true; do
    echo -e "\n=============================="
    echo " 팀원/활동 DB 관리 메뉴"
    echo "=============================="
    echo "1) 팀원 정보 추가" 
    echo "2) 팀원과 한 일 기록" 
    echo "3) 팀원 검색 (이름)" 
    echo "4) 수행 내용 검색 (날짜)" 
    echo "5) 종료" 
    echo "------------------------------"
    read -p "메뉴 번호를 선택하세요 (1-5): " choice

    case $choice in
        1) add_member_info ;;
        2) record_activity ;;
        3) search_member ;;
        4) search_activity ;;
        5) 
            echo "프로그램을 종료합니다."
            exit 0 
            ;;
        *)
            echo " 잘못된 입력입니다. 1에서 5 사이의 숫자를 입력해주세요."
            ;;
    esac
done 
