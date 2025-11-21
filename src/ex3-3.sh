#!/bin/bash
scores=()
total_score=0
count=0
echo "A/B 등급 변환 및 평균 계산기"
while true; do
    read -p "점수를 입력하세요 : " input
    if [[ "$input" == "done" ]]; then
        break
    fi
    scores+=("$input")
    total_score=$((total_score + input))
    count=$((count + 1))
done
if [[ $count -lt 2 ]]; then
    echo "오류: 2개 이상의 과목 점수를 입력해야 합니다."
    exit 1
fi
echo -e "\n1) 개별 등급 출력"
for score in "${scores[@]}"; do
    if [[ $score -ge 90 ]]; then
        grade="A"
    else
        grade="B"
    fi
    echo "점수: $score점, 등급: $grade"
done
echo -e "\n2) 평균 등급 출력"
average_score=$((total_score / count))
if [[ $average_score -ge 90 ]]; then
    average_grade="A"
else
    average_grade="B"
fi

echo "총점: $total_score, 과목 수: $count"
echo "평균 점수: $average_score점"
echo "평균 등급: $average_grade"
