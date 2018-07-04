SELECT ROWNUM 연번, 성 || 이름 성명, 주민등록번호,
DECODE(SUBSTR(학적상태,1,1), '0', '재학', '1', '휴학') 변동사유, hc_siYMD 최종학적변동일
FROM tm학적, (SELECT hakbun, MAX(changedt) hc_siymd
FROM tdschoolchg
GROUP BY hakbun) cc
WHERE SUBSTR(주민등록번호,7,1) IN ('1', '3') AND SUBSTR(학적상태,1,1) in ('0', '1')
AND 학번 = hakbun(+)
AND 학번 NOT IN (SELECT hakbun FROM TDSCHOOLCHG WHERE changecd = '61')