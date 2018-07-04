SELECT 학과명, sj_hakbun 학번, hj_kname 성명, hj_craddr1 || ' ' || hj_craddr2 주소, hj_hshptel 휴대전화,
COUNT(DISTINCT sj_year || sj_hakgi) 수업학기,
SUM(sj_hjum) 신청학점, SUM(DECODE(sj_dunggub, 'F', 0, sj_hjum)) 취득학점,
DECODE(SIGN(SUM(DECODE(sj_dunggub, 'F', 0, sj_hjum)) - 80), 1, '졸업가능', 0, '졸업가능') 졸업가능여부,
ju_jno 증서번호, ju_hno 학위번호
FROM AC1401, AC12011, AC1611, AC1121, tbl학과
WHERE sj_hakbun = hj_hakbun
--AND hj_haknyun = '2'
AND hj_state = '01'
AND hj_hakbun = ju_hakbun
--AND sj_dunggub <> 'F'
AND ju_jcheck = '0'
AND hj_hgcode = hg_code AND hg_mcode = 학과코드
GROUP BY 학과명, sj_hakbun, hj_kname, hj_craddr1, hj_craddr2, hj_hshptel, ju_jno, ju_hno
--HAVING COUNT(DISTINCT sj_year || sj_hakgi) >= 4