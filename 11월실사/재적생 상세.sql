SELECT hg_kname ����, hj_hakbun �й�, hj_kname ����, DECODE(SUBSTR(hj_jhgbn,1,1), '5', '������', '������') ��������,
dd_nidate ��������,  ��û����, siyy ��������, ((hc_year - substr(siyy, 1,4)) * 2 + (hc_hakgi - simm)) * 6 ���а���, hb_name ��������, dd_haknyun �г�
FROM ac12011, AC1121,
(SELECT * FROM AC2711 WHERE dd_year = '2008'and dd_hakgi = '1'),
(SELECT sj_hakbun, sum(sj_hjum) ��û���� FROM AC1401
WHERE sj_year = '2008' and sj_hakgi = '1' GROUP BY sj_hakbun), AC1104,
(SELECT hc_hakbun, max(hc_siymd) siyy,
DECODE(SIGN(to_number(SUBSTR(hc_siymd,5,2)) - 8), 1, 2, 0, 1, -1, 1) simm, hc_year, hc_hakgi
FROM AC1202
WHERE SUBSTR(hc_scode,1,1) = '1' and hc_year >= '2008' AND SUBSTR(hc_siymd,1,4) <= '2008'
group by hc_hakbun, DECODE(SIGN(to_number(SUBSTR(hc_siymd,5,2)) - 8), 1, 2, 0, 1, -1, 1), hc_year, hc_hakgi )
WHERE hj_hakbun = dd_hakbun
and dd_hakbun = sj_hakbun(+)
AND hj_hgcode = hg_code
AND hj_hakbun = hc_hakbun(+)
AND hj_state = hb_code
ORDER BY dd_haknyun, hg_kname, hj_kname
--ORDER BY hj_kname