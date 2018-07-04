SELECT 재학.학과, hg_kname 학과명, 재학생수, 탈락생수, 재입학생수,
trunc((재학생수 - NVL(탈락생수,0) + NVL(재입학생수,0)) / 재학생수 * 100,2) 재학생유지율
FROM
(SELECT hj_hgcode 학과, COUNT(*) 재학생수
FROM psutis.AC12011
WHERE hj_state = '01'
GROUP BY hj_hgcode) 재학,
(SELECT hj_hgcode 학과, COUNT(*) 탈락생수
FROM psutis.AC1202, psutis.AC12011
WHERE SUBSTR(hc_scode,1,1) = '2' AND hc_siymd >= :시작연월일 AND hc_siymd <= :종료연월일
AND hc_hakbun = hj_hakbun
GROUP BY hj_hgcode) 제적,
(SELECT hj_hgcode 학과, COUNT(*) 재입학생수
FROM psutis.AC1202, psutis.AC12011
WHERE hc_scode = '52' AND hc_siymd >= :시작연월일 AND hc_siymd <= :종료연월일
AND hc_hakbun = hj_hakbun
GROUP BY hj_hgcode) 재입학, psutis.AC1121
WHERE 재학.학과 = 제적.학과(+) AND 재학.학과 = 재입학.학과(+)
AND 재학.학과 = hg_code