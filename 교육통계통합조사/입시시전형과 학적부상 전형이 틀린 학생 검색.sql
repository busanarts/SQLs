SELECT hg_kname, hj_hakbun, hj_kname, hj_sexgbn, hj_state, hj_shno 수험번호,
DECODE(SUBSTR(iw_jhgubun,1,1), '5', '정원외', '정원내') 전형구분
FROM AC12011, AC1121, (SELECT * FROM ipsi.ipsi401, ipsi.ipsi201 WHERE si_year = '2012' AND si_year = iw_year AND si_shno = iw_shno)
WHERE hj_hakbun like 'A12%'
and hj_hgcode = hg_code
AND hj_hakbun = si_hakbun
AND hj_jhgbn <> iw_jhgubun
ORDER BY hg_kname