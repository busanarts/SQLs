--select COUNT(*) FROM TM학적
--where 학적상태 = '01'
--SELECT COUNT(*) FROM psutis.AC12011
--WHERE hj_state = '01'
SELECT hakbun, hj_kname, hg_kname, hj_haknyun , hj_hgcode
FROM TDFEEGOJI, psutis.AC12011 a, psutis.ac1121 c
WHERE state = '11' AND hj_state = '01'
AND hj_hakbun = hakbun AND a.hj_hgcode = c.hg_code(+)
AND hakbun NOT in (SELECT hakbun FROM TDFEERECEIVE WHERE schoolyear = '2012' AND semester = '2')
ORDER BY hg_kname, hj_haknyun, hakbun