SELECT hj_hakbun 학번, hj_kname 성명, hj_state, DECODE(iw_dungrok, '0', '미등록', '4', '환불') 등록여부,
dd_nipgum 납입금, dd_nidate 납입일자, dd_hbdate 환불일자, dr_drniymd 입시등록금납입일
FROM AC12011, ipsi.ipsi201, ipsi.ipsi401, AC2711, ipsi.ipsi203
WHERE hj_hakbun LIKE 'A11%'
AND hj_hakbun = si_hakbun
AND si_year = iw_year AND si_shno = iw_shno
AND iw_dungrok <> '1'
AND hj_hakbun = dd_hakbun
AND iw_year = dr_year AND iw_shno = dr_shno

