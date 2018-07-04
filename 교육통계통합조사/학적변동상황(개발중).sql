SELECT 학과명, 학년, --USR_GETJHNAME(USR_GETJHCODE(HJ_HAKBUN)),
학번, 성 || 이름 성명, f_hjstate(학번, :조사기준일) 당시학적상태,
--f_hakjuknm(f_LCSCODE(학번, :조사기준일)) 최종학적변동, USR_TODATE(f_LCDATE(학번, :조사기준일 )) 학적변동일
f_hakjuknm(f_LCSCODE(학번, :조사기준일)) 최종학적변동, f_LCDATE(학번, :조사기준일 ) 학적변동일
FROM tm학적 학적, tm학과 학과
WHERE SUBSTR(학적상태,1,1) <> '8'
--AND 학번 LIKE 'A10%'
AND f_hjstate(학번, :조사기준일) IN ('재학', '휴학')
AND 학적.학과코드 = 학과.학과코드

