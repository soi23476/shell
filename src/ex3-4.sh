#!/bin/bash


scores=()
total_score=0
count=0

add_score() {
    read -p "추가할 과목의 점수(0~100)를 입력하세요: " new_score

    if [[ "$new_score" =~ ^[0-9]+$ ]] && [[ $new_score -ge 0 ]] && [[ $new_score -le 100 ]]; then
        scores+=("$new_score")
        total_score=$((total_score + new_score))
        count=$((count + 1))
        echo "$new_score점이 추가되었습니다."
    else
        echo "유효하지 않은 입력입니다."
    fi
}


view_scores() {
    if [[ $count -eq 0 ]]; then
        echo "현재 입력된 점수가 없습니다."
    else
        echo "입력된 모든 점수: ${scores[@]}"
    fi
}


calculate_average() {
    if [[ $count -eq 0 ]]; then
        echo "점수가 없어 평균을 계산할 수 없습니다."
    else
        average=$((total_score / count))
        echo "평균 점수: $average 점 ($count 과목, 총점: $total_score)"
    fi
}
convert_gpa() {
    if [[ $count -eq 0 ]]; then
        echo "점수가 없어 등급을 계산할 수 없습니다."
        return
    fi
    

    average=$((total_score / count))
    

    if [[ $average -ge 90 ]]; then
        gpa="A"
    else
        gpa="B"
    fi
    echo "계산된 평균 점수($average점)의 등급은 **$gpa** 입니다."
}




while true; do
    echo -e "\n---------------------------------"
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급 (GPA) 변환"
    echo "5) 종료"
    echo "---------------------------------"
    read -p "메뉴 번호를 선택하세요 (1-5): " choice

    case $choice in
        1)
            add_score
            ;;
        2)
            view_scores
            ;;
        3)
            calculate_average
            ;;
        4)
            convert_gpa
            ;;
        5)
            echo "프로그램을 종료합니다. 감사합니다."
            exit 0 
            ;;
        *)
            echo "잘못된 입력입니다. 1에서 5 사이의 숫자를 입력해주세요."
            ;;
    esac
done
