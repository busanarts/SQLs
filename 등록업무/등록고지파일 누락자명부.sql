SELECT 학번, 성 || 이름 성명, 학년, f_statenm(학적상태) 학적상태,
USR_LCDATE(학번) 최종학적변동일, F_STATENM(USR_LCSCODE(학번)) 최종학적변동명
FROM ciss.tm학적
WHERE --hj_hakbun IN ('A1225202', 'A1225201', 'A1075040', 'A0875020', 'A1225203', 'A1127020')
학적상태 = '01'
AND 학번 NOT IN (SELECT hakbun FROM TDFEEGOJI
WHERE schoolyear = :학년도 AND semester = :학기)
