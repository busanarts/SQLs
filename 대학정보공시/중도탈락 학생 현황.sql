SELECT a.학과명, 재적인원, MAX(DECODE(중도탈락사유, '미등록', 인원)) 미등록,
	   MAX(DECODE(중도탈락사유, '미복학', 인원)) 미복학,
       MAX(DECODE(중도탈락사유, '자퇴', 인원)) 자퇴,
       MAX(DECODE(중도탈락사유, '학사제적', 인원)) 기타
FROM
(SELECT 학과명, hb_name 중도탈락사유, COUNT(*) 인원
FROM AC1202, AC12011, AC1121, TBL학과, AC1104
WHERE hc_siymd >= '20120301' AND hc_siymd <= '20130228'
AND SUBSTR(hc_scode,1,1) = '2'
AND hc_hakbun = hj_hakbun
AND hj_hgcode = hg_code AND hg_mcode = 학과코드
AND hc_scode = hb_code
GROUP BY 학과명, hb_name) a,
(SELECT 학과명, COUNT(*) 재적인원 FROM AC12011_2012_04_01, AC1121, tbl학과
WHERE SUBSTR(hj_state,1,1) IN ('0', '1')
AND hj_hgcode = hg_code AND hg_mcode = 학과코드
GROUP BY 학과명) b
WHERE a.학과명 = b.학과명
GROUP BY a.학과명, 재적인원