INSERT INTO TDRESULT
SELECT sj_year, sj_hakgi, sj_haknyun, sj_hakbun, �а��ڵ�, sj_ggban, sj_gggmcode, sj_jumsu, sj_dunggub, sj_pjum, sj_injung, 'sahn', SYSDATE, '', '' FROM ac1401, ac1121, tbl�а�
WHERE sj_gghgcode = hg_code AND hg_mcode = �а��ڵ�
--AND sj_gghgcode IS null

--SELECT COUNT(*) FROM ac1401