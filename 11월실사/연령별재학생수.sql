SELECT 학과명, NVL( SUM( CASE WHEN AGE < 20 THEN 1 END ), 0 ) "20세미만"
, NVL( SUM( CASE WHEN AGE >= 20 AND AGE <= 25 THEN 1 END ), 0 ) "20세이상 25세이하"
, NVL( SUM( CASE WHEN AGE >= 26 AND AGE <= 30 THEN 1 END ), 0 ) "26세이상 30세이하"
, NVL( SUM( CASE WHEN AGE >= 31 AND AGE <= 40 THEN 1 END ), 0 ) "31세이상 40세이하"
, NVL( SUM( CASE WHEN AGE >= 41 AND AGE <= 50 THEN 1 END ), 0 ) "41세이상 50세이하"
, NVL( SUM( CASE WHEN AGE >= 51 THEN 1 END ), 0 ) "51세이상"
FROM (
SELECT 학과명, to_char(trunc(months_between(to_date(&NowYYYYMMDD,'YYMMDD'), to_date('19' || hj_jcode1,'YYMMDD'))/12)) age
FROM (SELECT 학과명, hj_hakbun 학번, hj_kname 성명, hj_jcode1, hj_jcode2
FROM AC12011, AC1121, tbl학과,
(-- 당초입학 1학년
SELECT hj_hakbun 학번, '' 학적변동일, '' 학적변동 FROM AC12011
WHERE hj_hakbun LIKE 'A' || SUBSTR(&NowYear,3,2) || '%'
AND hj_hakbun NOT IN (SELECT DISTINCT hc_hakbun FROM AC1202
WHERE hc_siymd <= &NowYear || '1001')
UNION
-- 당초입학 2학년
SELECT hj_hakbun 학번, '' 학적변동일, '' 학적변동 FROM AC12011
WHERE hj_hakbun LIKE 'A' || SUBSTR(&NowYear-1,3,2) || '%'
AND hj_hakbun NOT IN (SELECT DISTINCT hc_hakbun FROM AC1202
WHERE hc_siymd <= &NowYear || '1001')
UNION
SELECT hj_hakbun 학번, hc_siymd 학적변동일, hb_name 학적변동 FROM
(SELECT ss.*, MAX(cc.hc_siymd) 학적변동일 FROM
(
-- 복학생, 편입생, 재입학생
SELECT hj_hakbun FROM
(SELECT hj_hakbun, hj_state, siymd, hj_jymd
FROM AC12011, (SELECT hc_hakbun, MAX(hc_siymd) siymd FROM AC1202
WHERE  hc_scode <> '31' AND hc_siymd >= &NowYear - 5 || '1001' AND hc_siymd <= &NowYear || '1001' GROUP BY hc_hakbun)
WHERE hj_hakbun = hc_hakbun) a, AC1202 b
WHERE hj_hakbun = hc_hakbun AND siymd = hc_siymd
AND SUBSTR(hc_scode,1,1) in ('5')
AND NVL(hj_jymd,&NowYear || '1001') >= &NowYear || '1001'
UNION
SELECT hj_hakbun  FROM
(SELECT hj_hakbun, hj_state, siymd, hj_jymd
FROM AC12011, (SELECT hc_hakbun, MAX(hc_siymd) siymd FROM AC1202
WHERE  hc_siymd >= &NowYear - 2 || '0801' AND hc_siymd <= &NowYear || '1001' GROUP BY hc_hakbun)
WHERE hj_hakbun = hc_hakbun) a, AC1202 b
WHERE hj_hakbun = hc_hakbun AND siymd = hc_siymd
AND SUBSTR(hc_scode,1,1) in ('6')
minus
SELECT hj_hakbun 학번 FROM
(SELECT hj_hakbun, hj_state, siymd
FROM AC12011, (SELECT hc_hakbun, MAX(hc_siymd) siymd FROM AC1202
WHERE  hc_siymd >= &NowYear - 2 || '1001' AND hc_siymd <= &NowYear || '1001' GROUP BY hc_hakbun)
WHERE hj_hakbun = hc_hakbun) a, AC1202 b
WHERE hj_hakbun = hc_hakbun AND siymd = hc_siymd
AND SUBSTR(hc_scode,1,1) in ('2', '8')) ss, AC1202 cc
WHERE hj_hakbun = hc_hakbun
AND hc_siymd <= &NowYear || '1001'
GROUP BY hj_hakbun), AC1202 k, AC1104
WHERE hj_hakbun = k.hc_hakbun
AND 학적변동일 = k.hc_siymd
AND hc_scode = hb_code
)
WHERE hj_hakbun = 학번 AND hj_hgcode = hg_code AND hg_mcode = 학과코드)
)
group by cube(학과명)