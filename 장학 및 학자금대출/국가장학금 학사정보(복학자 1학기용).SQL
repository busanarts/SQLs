SELECT 학자금융자학과코드 학과코드, '19' 학적코드, HJ_JCODE1 || HJ_JCODE2 주민등록번호, HJ_HAKBUN 학번, HJ_KNAME 학생성명,
       SUBSTR(HJ_IYMD, 1, 4) 입학년도, '16' 학적상태코드, DG_HAKNYUN 학년, '1' 등록대상여부,
       DG_SURYO 등록금액, &SYEAR || '0330' 등록마감일,
       '17' 성적유형, '4.5' 학생만점기준, 직전학기취득학점, 직전학기평점평균, 총취득학점, 총평점평균, 직전학기백분위점수, 총백분위점수,
       '' 성적유형통과여부, SUBSTR(최종학년학기, 1, 4) 최종성적취득년도, SUBSTR(최종학년학기, 5, 1) 최종성적취득학기,
       hj_iymd 입학일자, 'Y' 입학당시신입생여부
	FROM AC12011, AC1121, TBL학과, AC2701,
	(
	SELECT hc_hakbun, hc_scode, hc_siymd, HC_HAKNYUN
		FROM AC1202 AA, AC12011
		WHERE HJ_STATE = '01'
		AND HC_HAKBUN = HJ_HAKBUN
		AND HC_YEAR = &SYEAR AND HC_HAKGI = '1'
		AND (HC_HAKBUN, HC_SIYMD) IN
		(SELECT HC_HAKBUN, MAX(HC_SIYMD) FROM AC1202
		WHERE HC_HAKBUN = AA.HC_HAKBUN AND SUBSTR(HC_SCODE,1,1) = '5'
        AND HC_SIYMD > &sYear || '01'
		GROUP BY HC_HAKBUN)
	) bb, -- 복학자료 가져오기
	(
	SELECT SJ_HAKBUN, 최종학년학기, SUM(DECODE(SJ_DUNGGUB, 'F', 0, SJ_HJUM)) 직전학기취득학점,
				   DECODE(SUM(SJ_HJUM), 0, 0, ROUND(SUM(SJ_PJUM * SJ_HJUM) / SUM(SJ_HJUM), 2)) 직전학기평점평균,
              	DECODE(SUM(SJ_HJUM), 0, 0, ROUND(SUM(SJ_JUMSU * SJ_HJUM) / SUM(SJ_HJUM), 0)) 직전학기백분위점수
		FROM AC1401 A,
		(
		SELECT SJ_HAKBUN 학번,
 		 	MAX(SJ_YEAR||SJ_HAKGI) 최종학년학기
  			FROM AC1401, AC12011
  			WHERE HJ_STATE = '01' AND SJ_HAKBUN = HJ_HAKBUN AND SJ_INJUNG = 'Y'
  			GROUP BY SJ_HAKBUN
		) B
        WHERE SJ_HAKBUN = 학번 AND SJ_YEAR = SUBSTR(최종학년학기, 1, 4) AND SJ_HAKGI = SUBSTR(최종학년학기, 5, 1)
        GROUP BY SJ_HAKBUN, 최종학년학기
       ) C,
       (
       SELECT SJ_HAKBUN,
              SUM(DECODE(SJ_DUNGGUB, 'F', 0, SJ_HJUM)) 총취득학점,
              DECODE(SUM(SJ_HJUM), 0, 0, ROUND(SUM(SJ_PJUM * SJ_HJUM) / SUM(SJ_HJUM), 2)) 총평점평균,
              DECODE(SUM(SJ_HJUM), 0, 0, ROUND(SUM(SJ_JUMSU * SJ_HJUM) / SUM(SJ_HJUM), 0)) 총백분위점수
       		FROM AC1401, AC12011
        	WHERE HJ_STATE = '01' AND SJ_HAKBUN = HJ_HAKBUN AND SJ_INJUNG = 'Y'
        	GROUP BY SJ_HAKBUN
       ) D
 WHERE HJ_STATE = '01'
 AND HJ_HGCODE = HG_CODE AND HG_MCODE = 학과코드
 AND HJ_HAKBUN = C.SJ_HAKBUN(+)
 AND HJ_HAKBUN = D.SJ_HAKBUN(+)
 AND HJ_HAKBUN = bb.HC_HAKBUN
 AND DG_YEAR(+) = &SYEAR AND DG_HAKGI(+) = '1'
 AND DG_HAKNYUN(+) = HJ_HAKNYUN AND DG_HGCODE(+) = HJ_HGCODE
 ORDER BY hj_kname