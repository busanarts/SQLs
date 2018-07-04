SELECT 학과, 학년,
MAX(DECODE(학적변동, '2', 인원)) 제적,
MAX(DECODE(학적변동, '5', 인원)) 재편입학
FROM
(SELECT hg_kname 학과, hc_haknyun 학년, SUBSTR(hc_scode,1,1) 학적변동, COUNT(*) 인원
FROM psutis.AC1202, psutis.AC1121, psutis.AC1104, psutis.AC12011
WHERE hc_siymd >= :시작연월일 AND hc_siymd <= :종료연월일
AND hc_scode IN ('21','22', '23', '24', '52', '53')
AND hc_scode = hb_code
AND hc_hakbun = hj_hakbun
AND hj_hgcode = hg_code
GROUP BY hg_kname, hc_haknyun, SUBSTR(hc_scode,1,1))
GROUP BY 학과, 학년
ORDER BY 학과, 학년