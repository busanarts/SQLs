SELECT �а���, NVL( SUM( CASE WHEN AGE < 20 THEN 1 END ), 0 ) "20���̸�"
, NVL( SUM( CASE WHEN AGE >= 20 AND AGE <= 25 THEN 1 END ), 0 ) "20���̻� 25������"
, NVL( SUM( CASE WHEN AGE >= 26 AND AGE <= 30 THEN 1 END ), 0 ) "26���̻� 30������"
, NVL( SUM( CASE WHEN AGE >= 31 AND AGE <= 40 THEN 1 END ), 0 ) "31���̻� 40������"
, NVL( SUM( CASE WHEN AGE >= 41 AND AGE <= 50 THEN 1 END ), 0 ) "41���̻� 50������"
, NVL( SUM( CASE WHEN AGE >= 51 THEN 1 END ), 0 ) "51���̻�"
FROM (
SELECT �а���, to_char(trunc(months_between(to_date(&NowYYYYMMDD,'YYMMDD'), to_date('19' || hj_jcode1,'YYMMDD'))/12)) age
FROM (SELECT �а���, hj_hakbun �й�, hj_kname ����, hj_jcode1, hj_jcode2
FROM AC12011, AC1121, tbl�а�,
(-- �������� 1�г�
SELECT hj_hakbun �й�, '' ����������, '' �������� FROM AC12011
WHERE hj_hakbun LIKE 'A' || SUBSTR(&NowYear,3,2) || '%'
AND hj_hakbun NOT IN (SELECT DISTINCT hc_hakbun FROM AC1202
WHERE hc_siymd <= &NowYear || '1001')
UNION
-- �������� 2�г�
SELECT hj_hakbun �й�, '' ����������, '' �������� FROM AC12011
WHERE hj_hakbun LIKE 'A' || SUBSTR(&NowYear-1,3,2) || '%'
AND hj_hakbun NOT IN (SELECT DISTINCT hc_hakbun FROM AC1202
WHERE hc_siymd <= &NowYear || '1001')
UNION
SELECT hj_hakbun �й�, hc_siymd ����������, hb_name �������� FROM
(SELECT ss.*, MAX(cc.hc_siymd) ���������� FROM
(
-- ���л�, ���Ի�, �����л�
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
SELECT hj_hakbun �й� FROM
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
AND ���������� = k.hc_siymd
AND hc_scode = hb_code
)
WHERE hj_hakbun = �й� AND hj_hgcode = hg_code AND hg_mcode = �а��ڵ�)
)
group by cube(�а���)