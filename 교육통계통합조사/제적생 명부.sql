SELECT 학과명, HJ_HAKNYUN 학년, hj_hakbun 학번, hj_kname 성명,
DECODE(hj_sexgbn, '1', '남', '여') 성별, DECODE(substr(hj_jhgbn,1,1), '5', '정원외', '정원내') 전형구분, HB_NAME 학적변동, USR_TODATE(USR_LCDATE(hj_hakbun, '20140401')) 학적변동일
FROM AC12011_&조사기준일, AC1104, ac1202_&조사기준일, AC1121, TBL학과
WHERE HJ_HAKBUN = HC_HAKBUN
AND hc_scode = hb_code
AND hj_hakbun NOT LIKE 'T%'
AND SUBSTR(HC_SCODE,1,1) = '2'
AND HC_SIYMD >= SUBSTR(&조사기준일,1,4)-1 || '0401'
AND HC_SIYMD <= SUBSTR(&조사기준일,1,4) || '0331'
AND HJ_HGCODE = HG_CODE AND HG_MCODE = 학과코드