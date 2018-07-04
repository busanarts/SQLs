SELECT * FROM
(SELECT '' 순위대상여부, K.* FROM
(SELECT AA.*, RANK() OVER(PARTITION BY 학과명, 학년 ORDER BY 평점평균 DESC, 백분율점수 DESC) 순위
FROM (
	SELECT 학과명, SJ_HAKNYUN 학년, HJ_HAKBUN 학번, HJ_KNAME 성명,  HJ_JCODE1 || '-' || HJ_JCODE2 주민번호, HB_NAME 학적구분,
	SUM (SJ_HJUM) 신청학점, SUM(DECODE(SJ_DUNGGUB, 'F', 0, SJ_HJUM)) 취득학점,
    SUM(DECODE(sj_dunggub, 'F', 0, DECODE(sj_isugbm, '21', sj_hjum, 0))) 전필취득,
    SUM(DECODE(sj_dunggub, 'F', 0, DECODE(sj_isugbm, '22', sj_hjum, 0))) 전선취득,
    SUM(DECODE(sj_dunggub, 'F', 0, DECODE(sj_isugbm, '11', sj_hjum, 0))) 교필취득,
    SUM(DECODE(sj_dunggub, 'F', 0, DECODE(sj_isugbm, '12', sj_hjum, 0))) 교선취득,
    SUM(DECODE(sj_dunggub, 'F', 0, DECODE(sj_isugbm, '41', sj_hjum, 0))) 자선취득,
	ROUND(SUM(DECODE(SJ_ISUGBM, '13', 0, SJ_HJUM * SJ_PJUM)) /
	SUM(DECODE(SJ_ISUGBM, '13', 0, SJ_HJUM)),2)  평점평균,
	ROUND(SUM(DECODE(SJ_ISUGBM, '13', 0, SJ_HJUM * SJ_JUMSU)) /
	SUM(DECODE(SJ_ISUGBM, '13', 0, SJ_HJUM)),2)  백분율점수
	FROM AC1401, AC12011, AC1121, TBL학과, AC1104
	WHERE SJ_YEAR = :학년도 AND SJ_HAKGI = :학기 --AND Sj_injung = 'Y'
	AND SJ_HAKBUN = HJ_HAKBUN AND HJ_WTHGCODE = HG_CODE
	AND HG_MCODE = 학과코드 AND HJ_STATE = HB_CODE
	AND SJ_GGHGCODE <> '99' --AND HJ_STATE = '01'
	GROUP BY 학과명, SJ_HAKNYUN, HJ_HAKBUN, HJ_KNAME, HJ_JCODE1, HJ_JCODE2, HB_NAME
	HAVING SUM(DECODE(SJ_DUNGGUB, 'F', 0, SJ_HJUM)) >= 15
) AA ) K
UNION
SELECT '순위비대상' 순위대상여부, K.* FROM
(SELECT AA.*, 0
FROM (
	SELECT 학과명, SJ_HAKNYUN 학년, HJ_HAKBUN 학번, HJ_KNAME 성명,  HJ_JCODE1 || '-' || HJ_JCODE2 주민번호, HB_NAME 학적구분,
	SUM (SJ_HJUM) 신청학점, SUM(DECODE(SJ_DUNGGUB, 'F', 0, SJ_HJUM)) 취득학점,
    SUM(DECODE(sj_dunggub, 'F', 0, DECODE(sj_isugbm, '21', sj_hjum, 0))) 전필취득,
    SUM(DECODE(sj_dunggub, 'F', 0, DECODE(sj_isugbm, '22', sj_hjum, 0))) 전선취득,
    SUM(DECODE(sj_dunggub, 'F', 0, DECODE(sj_isugbm, '11', sj_hjum, 0))) 교필취득,
    SUM(DECODE(sj_dunggub, 'F', 0, DECODE(sj_isugbm, '12', sj_hjum, 0))) 교선취득,
    SUM(DECODE(sj_dunggub, 'F', 0, DECODE(sj_isugbm, '41', sj_hjum, 0))) 자선취득,
	ROUND(SUM(DECODE(SJ_ISUGBM, '13', 0, SJ_HJUM * SJ_PJUM)) /
	SUM(DECODE(SJ_ISUGBM, '13', 0, SJ_HJUM)), 2)  평점평균,
	ROUND(SUM(DECODE(SJ_ISUGBM, '13', 0, SJ_HJUM * SJ_JUMSU)) /
	SUM(DECODE(SJ_ISUGBM, '13', 0, SJ_HJUM)), 2) 백분율점수
	FROM AC1401, AC12011, AC1121, TBL학과, AC1104
	WHERE SJ_YEAR = :학년도 AND SJ_HAKGI = :학기 --AND Sj_injung = 'Y'
	AND SJ_HAKBUN = HJ_HAKBUN AND HJ_WTHGCODE = HG_CODE
	AND HG_MCODE = 학과코드 AND HJ_STATE = HB_CODE
	AND SJ_GGHGCODE <> '99' --AND HJ_STATE = '01'
	GROUP BY 학과명, SJ_HAKNYUN, HJ_HAKBUN, HJ_KNAME, HJ_JCODE1, HJ_JCODE2, HB_NAME
	HAVING SUM(DECODE(SJ_DUNGGUB, 'F', 0, SJ_HJUM)) < 15
) AA ) K
)
ORDER BY 순위대상여부 DESC, 학과명, 학년, 순위