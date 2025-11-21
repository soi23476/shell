#!/bin/bash

echo "--- y = 1/2 * x^2 계산기 (실수 범위) ---"

read -p "첫 번째 x 값을 입력하세요: " x1

read -p "두 번째 x 값을 입력하세요: " x2

calculate_y() {
    local x=$1
    result=$(echo "scale=3; (1/2) * $x * $x" | bc)
    echo "x = $x 일 때, y = $result"
}


echo " 계산 결과"
calculate_y "$x1"
calculate_y "$x2"
