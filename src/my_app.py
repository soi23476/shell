#!/usr/bin/env python3
import sys

print("==============================")
print("▶ Python 실행 파일이 시작되었습니다.")


arguments = sys.argv[1:] 
if len(arguments) < 2:
    print("오류: 입력 인자가 2개 미만입니다.")
    sys.exit(1)

print(f"️입력된 인자는 총 {len(arguments)}개 입니다.")
print(f"입력된 인자 목록: {arguments}")


print("▶ Python 실행 파일이 종료되었습니다.")
print("==============================")
