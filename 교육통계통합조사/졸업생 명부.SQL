SELECT 학과명, DECODE(SUBSTR(HJ_JHGBN,1,1), '5', '정원외', '9', '위탁', '정원내') 전형구분,
		DECODE(HJ_SEXGBN, '1', '남', '2', '여', HJ_SEXGBN) 성별, HJ_HAKBUN 학번, HJ_KNAME 성명,
    AGE(HJ_JCODE1, substr(&조사기준일,1,4) || '0401') 연령, USR_TODATE('19' || HJ_JCODE1) 생년월일, USR_TODATE(HJ_JYMD) 졸업일자
	FROM AC12011, AC1121, TBL학과
	WHERE HJ_STATE IN ('81', '82', '83') AND HJ_JYMD >= substr(&조사기준일,1,4) - 1 || '08'
		AND HJ_HGCODE = HG_CODE AND HG_MCODE = 학과코드
