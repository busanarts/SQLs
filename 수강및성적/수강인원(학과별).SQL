SELECT A.학과명, A.학년, 재학인원, COUNT(*) 신청학생수, (재학인원 - COUNT(*)) 미수강학생수
FROM
(SELECT 학과명, HJ_HAKNYUN 학년, COUNT(*) 재학인원
	FROM AC1121, TBL학과, AC12011
    WHERE HJ_WTHGCODE = HG_CODE AND HG_MCODE  = 학과코드
	AND HJ_STATE = '01'
    GROUP BY 학과명, HJ_HAKNYUN
) A,
(SELECT DISTINCT 학과명, sj_haknyun 학년, SJ_HAKBUN 학번
	FROM AC1401, AC12011, AC1121, TBL학과
    WHERE SJ_YEAR = &학년도 AND SJ_HAKGI = &학기
    AND SJ_HAKBUN = HJ_HAKBUN
	AND HJ_WTHGCODE = HG_CODE AND HG_MCODE = 학과코드
) B
WHERE A.학과명 = B.학과명(+) AND a.학년 = b.학년(+)
GROUP BY A.학과명, A.학년, 재학인원
ORDER BY A.학과명, A.학년
