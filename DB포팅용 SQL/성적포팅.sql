INSERT INTO TDRESULT
SELECT sj_year, sj_hakgi, sj_haknyun, sj_hakbun, 학과코드, sj_ggban, sj_gggmcode, sj_jumsu, sj_dunggub, sj_pjum, sj_injung, 'sahn', SYSDATE, '', '' FROM ac1401, ac1121, tbl학과
WHERE sj_gghgcode = hg_code AND hg_mcode = 학과코드
--AND sj_gghgcode IS null

--SELECT COUNT(*) FROM ac1401