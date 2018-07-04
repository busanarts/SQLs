SELECT 학과명, 학년, f정원내외(학번) 정원내외구분, f전형상세(학번) 전형상세, --USR_GETJHNAME(USR_GETJHCODE(HJ_HAKBUN)),
학번, 성 || 이름 성명, DECODE(SUBSTR(학적상태,1,1), '1', '휴학', '2', '제적', '8', '졸업', '재학') 학적상태,
AGE(SUBSTR(주민등록번호,1,6), SUBSTR(:조사기준일,1,4) || '0301') 연령, USR_TODATE(SUBSTR(주민등록번호,1,6)) 생년월일, 성별,
f_hakjuknm(f_LCSCODE(학번, :조사기준일)) 최종학적변동, USR_TODATE(f_LCDATE(학번, :조사기준일 )) 학적변동일
FROM tm학적_&조사기준일 학적, tm학과 학과
--FROM AC12011, AC1121
WHERE SUBSTR(학적상태,1,1) IN ( '0', '1')
AND 학적.학과코드 = 학과.학과코드

