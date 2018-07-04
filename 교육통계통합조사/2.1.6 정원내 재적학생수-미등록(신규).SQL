SELECT hg_kname 학과, hj_haknyun 학년, DECODE(hj_sexgbn, '1', '남', '2', '여') 성별, COUNT(*) 미등록인원
FROM PSUTIS.AC12011_2013_04_01, TDFEEGOJI, psutis.ac1121
WHERE schoolyear = '2013' AND state IN('11', '22', '33')
AND hakbun = hj_hakbun AND hj_hgcode = hg_code
AND hj_state = '01'
AND hj_jhgbn < '50'
GROUP BY hg_kname, hj_haknyun, hj_sexgbn