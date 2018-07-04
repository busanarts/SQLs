SELECT 학과명, 성별, 학번, 학년, f정원내외(학번) 정원내외, f전형구분(학번) 전형구분, f전형상세(학번) 전형상세, 성 || 이름 성명, f_hakjuknm(학적상태) 학적상태,
usr_todate(SUBSTR(주민등록번호,1,6)) 생년월일, --age(substr(주민등록번호,1,6), SUBSTR(:조사기준일,1,4) || '0301') 연령,
		f_statenm(changecd) 학적변동, changedt 변동일자
	FROM tm학적_&조사기준일 학적, tm학과 학과,
	(
		SELECT hakbun, changecd, changedt FROM TDSCHOOLCHG --WHERE
		--(hakbun, changedt) IN (SELECT hakbun, MAX(changedt) FROM tdschoolchg
		WHERE changedt >= substr(:조사기준일,1,4) -1 || '0301' AND changedt <= substr(:조사기준일,1,4) || '0229'
    AND substr(changecd,1,1) NOT IN ('8', '6')
		--GROUP BY hakbun)
	) 학적변동
	WHERE 학적.학번 = 학적변동.hakbun
	AND 학적.학과코드 = 학과.학과코드

