SELECT 학과명,
	MAX(DECODE(성별, '1', DECODE(학적구분, '군입대', 인원,0))) "군입대",
	MAX(DECODE(성별, '1', DECODE(학적구분, '일반휴학', 인원,0))) "일반휴학(남)",
	MAX(DECODE(성별, '2', DECODE(학적구분, '일반휴학', 인원,0))) "일반휴학(여)",
--	MAX(DECODE(성별, '1', DECODE(학적구분, '휴학', 인원,0))) "휴학계(남)",
--	MAX(DECODE(성별, '2', DECODE(학적구분, '휴학', 인원,0))) "휴학계(여)",
	MAX(DECODE(성별, '1', DECODE(학적구분, '복학', 인원,0))) "복학(남)",
	MAX(DECODE(성별, '2', DECODE(학적구분, '복학', 인원,0))) "복학(여)",
--	MAX(DECODE(성별, '1', DECODE(학적구분, '미등록', 인원,0))) "미등록(남)",
--	MAX(DECODE(성별, '2', DECODE(학적구분, '미등록', 인원,0))) "미등록(여)",
--	MAX(DECODE(성별, '1', DECODE(학적구분, '미복학', 인원,0))) "미복학(남)",
--	MAX(DECODE(성별, '2', DECODE(학적구분, '미복학', 인원,0))) "미복학(여)",
--	MAX(DECODE(성별, '1', DECODE(학적구분, '자퇴', 인원,0))) "자퇴(남)",
--	MAX(DECODE(성별, '2', DECODE(학적구분, '자퇴', 인원,0))) "자퇴(여)",
--	MAX(DECODE(성별, '1', DECODE(학적구분, '학사제적', 인원,0))) "학사제적(남)",
--	MAX(DECODE(성별, '2', DECODE(학적구분, '학사제적', 인원,0))) "학사제적(여)",
--	MAX(DECODE(성별, '1', DECODE(학적구분, '제적', 인원,0))) "제적(남)",
--	MAX(DECODE(성별, '2', DECODE(학적구분, '제적', 인원,0))) "제적(여)",
	MAX(DECODE(성별, '1', DECODE(학적구분, '재입학', 인원,0))) "재입학(남)",
	MAX(DECODE(성별, '2', DECODE(학적구분, '재입학', 인원,0))) "재입학(여)",
	MAX(DECODE(성별, '1', DECODE(학적구분, '편입', 인원,0))) "편입(남)",
	MAX(DECODE(성별, '2', DECODE(학적구분, '편입', 인원,0))) "편입(여)"
FROM
(
	SELECT 학과명, HJ_SEXGBN 성별,
		DECODE(SUBSTR(HC_SCODE,1,1), '1', '휴학', '2', '제적') 학적구분, COUNT(*) 인원
	FROM AC12011_&조사기준일, AC1121, TBL학과,
	(
		SELECT HC_HAKBUN, HC_SCODE FROM AC1202_&조사기준일 WHERE
		(HC_HAKBUN, HC_SIYMD) IN (SELECT HC_HAKBUN, MAX(HC_SIYMD) FROM AC1202_&조사기준일
		WHERE HC_SIYMD >= substr(&조사기준일,1,4) -1 || '0301' AND HC_SIYMD <= substr(&조사기준일,1,4) || '0229'
		GROUP BY HC_HAKBUN)
	) AA
	WHERE HJ_HAKBUN = HC_HAKBUN
	AND HJ_HGCODE = HG_CODE AND HG_MCODE = 학과코드
	GROUP BY 학과명, HJ_SEXGBN, SUBSTR(HC_SCODE,1,1)
	UNION
	SELECT 학과명, HJ_SEXGBN 성별,
		HB_NAME 학적구분, COUNT(*) 인원
	FROM AC12011_&조사기준일, AC1121, TBL학과,
	(
		SELECT HC_HAKBUN, HC_SCODE, HB_NAME FROM AC1202_&조사기준일, AC1104 WHERE
		(HC_HAKBUN, HC_SIYMD) IN (SELECT HC_HAKBUN, MAX(HC_SIYMD) FROM AC1202_&조사기준일
		WHERE HC_SIYMD >= substr(&조사기준일,1,4) -1 || '0301' AND HC_SIYMD <= substr(&조사기준일,1,4) || '0229'
		GROUP BY HC_HAKBUN)
		AND HC_SCODE = HB_CODE
	) AA
	WHERE HJ_HAKBUN = HC_HAKBUN
	AND SUBSTR(HC_SCODE,1,1) = '2'
	AND HJ_HGCODE = HG_CODE AND HG_MCODE = 학과코드
	GROUP BY 학과명, HJ_SEXGBN, HB_NAME
	UNION
	SELECT 학과명, HJ_SEXGBN 성별,
		DECODE(HC_SCODE, '51', '복학', '52', '재입학', '53', '편입') 학적구분, COUNT(*) 인원
	FROM AC12011_&조사기준일, AC1121, TBL학과,
	(
		SELECT HC_HAKBUN, HC_SCODE FROM AC1202_&조사기준일 WHERE
		(HC_HAKBUN, HC_SIYMD) IN (SELECT HC_HAKBUN, MAX(HC_SIYMD) FROM AC1202_&조사기준일
		WHERE HC_SIYMD >= substr(&조사기준일,1,4) -1 || '0301' AND HC_SIYMD <= substr(&조사기준일,1,4) || '0229'
		--AND HC_SCODE IN ( '51', '52' )
		GROUP BY HC_HAKBUN)
	) AA
	WHERE HJ_HAKBUN = HC_HAKBUN
	AND HJ_HGCODE = HG_CODE AND HG_MCODE = 학과코드
	GROUP BY 학과명, HJ_SEXGBN, HC_SCODE
	UNION
	SELECT 학과명, HJ_SEXGBN 성별,
		DECODE(HB_GCODE, '1', '일반휴학', '2', '군입대') 학적구분, COUNT(*) 인원
	FROM AC12011_&조사기준일, AC1121, TBL학과,
	(
		SELECT HC_HAKBUN, HB_GCODE FROM AC1202_&조사기준일, AC1104 WHERE
		(HC_HAKBUN, HC_SIYMD) IN (SELECT HC_HAKBUN, MAX(HC_SIYMD) FROM AC1202_&조사기준일
		WHERE HC_SIYMD >= substr(&조사기준일,1,4) -1 || '0301' AND HC_SIYMD <= substr(&조사기준일,1,4) || '0229'
		--AND HB_GCODE IN ( '1', '2' )
		GROUP BY HC_HAKBUN) AND HC_SCODE = HB_CODE
	) AA
	WHERE HJ_HAKBUN = HC_HAKBUN
	AND HJ_HGCODE = HG_CODE AND HG_MCODE = 학과코드
	GROUP BY 학과명, HJ_SEXGBN, HB_GCODE
)
GROUP BY 학과명
ORDER BY 학과명