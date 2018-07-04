INSERT into AC1402
SELECT 학번, 학년도, 학기, 학과코드, 학년, 신청학점, 취득학점, 평점총점, 평점평균, 백분율점수, 0, 0,
전공필수취득학점, 전공선택취득학점, 교양필수취득학점, 교양선택취득학점, 자유선택취득학점, 순위, 0
FROM
(SELECT AA.*, RANK() OVER(PARTITION BY 학과명, 학년 ORDER BY 평점평균 DESC, 백분율점수 DESC) 순위
FROM (
	SELECT sj_year 학년도, sj_hakgi 학기, hg_code 학과코드, hg_kname 학과명, SJ_HAKNYUN 학년, HJ_HAKBUN 학번, HJ_KNAME 성명,  HJ_JCODE1 || '-' || HJ_JCODE2 주민번호, HB_NAME 학적구분,
	SUM (SJ_HJUM) 신청학점, SUM(DECODE(SJ_DUNGGUB, 'F', 0, SJ_HJUM)) 취득학점,
    SUM(DECODE(sj_dunggub, 'F', 0, DECODE(sj_isugbm, '21', sj_hjum, 0))) 전공필수취득학점,
    SUM(DECODE(sj_dunggub, 'F', 0, DECODE(sj_isugbm, '22', sj_hjum, 0))) 전공선택취득학점,
    SUM(DECODE(sj_dunggub, 'F', 0, DECODE(sj_isugbm, '11', sj_hjum, 0))) 교양필수취득학점,
    SUM(DECODE(sj_dunggub, 'F', 0, DECODE(sj_isugbm, '12', sj_hjum, 0))) 교양선택취득학점,
    SUM(DECODE(sj_dunggub, 'F', 0, DECODE(sj_isugbm, '41', sj_hjum, 0))) 자유선택취득학점,
    SUM(DECODE(SJ_ISUGBM, '13', 0, SJ_HJUM * SJ_PJUM)) 평점총점,
	TO_CHAR(ROUND(SUM(DECODE(SJ_ISUGBM, '13', 0, SJ_HJUM * SJ_PJUM)) /
	SUM(DECODE(SJ_ISUGBM, '13', 0, SJ_HJUM)),2), '0.99')  평점평균,
	TO_CHAR(ROUND(SUM(DECODE(SJ_ISUGBM, '13', 0, SJ_HJUM * SJ_JUMSU)) /
	SUM(DECODE(SJ_ISUGBM, '13', 0, SJ_HJUM)),5), '999.99')  백분율점수
	FROM AC1401, AC12011, AC1121, AC1104
	WHERE SJ_YEAR = :학년도 AND SJ_HAKGI = :학기 AND sj_injung = 'Y'
	AND SJ_HAKBUN = HJ_HAKBUN AND HJ_WTHGCODE = HG_CODE
	AND HJ_STATE = HB_CODE
    --AND HJ_HAKNYUN = '1'
	AND SJ_GGHGCODE <> '99' --AND HJ_STATE = '01'
	GROUP BY sj_year, sj_hakgi, hg_code, hg_kname, SJ_HAKNYUN, HJ_HAKBUN, HJ_KNAME, HJ_JCODE1, HJ_JCODE2, HB_NAME
	HAVING SUM(DECODE(SJ_DUNGGUB, 'F', 0, SJ_HJUM)) >= 15
) AA )
--WHERE 순위 <= 50