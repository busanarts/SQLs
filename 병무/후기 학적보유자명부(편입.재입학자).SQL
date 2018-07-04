--SELECT HJ_KNAME 성명, HJ_JCODE1 || HJ_JCODE2 주민번호, '83320000' 학교, HJ_HAKBUN 학번,
SELECT HJ_KNAME 성명, HJ_JCODE1 생년월일, hj_bname 보호자성명,'83320000' 학교, HJ_HAKBUN 학번,
병무학과코드 학과, '2' 학년제, '4' 학기제, HJ_HAKNYUN 학년, SUBSTR(HJ_IYMD,1,4) 입학년도,
SUBSTR(HJ_JYMD,1,4) 졸업년도, DECODE(hc_scode, '53', '1') 편입여부, HJ_JUYAGBN 주야구분, DECODE(hj_jhgbn, '54', '1') 재외국민여부,
HJ_EMAIL 전자우편
FROM psutis.AC12011, psutis.AC1121, psutis.TBL학과, (SELECT HC_HAKBUN, hc_scode FROM psutis.AC1202
WHERE HC_SIYMD >= :학년도 || '0601'
AND HC_SCODE IN ('52', '53'))
WHERE HJ_SEXGBN = '1'
AND SUBSTR(HJ_STATE,1,1) IN ('0', '1')
--AND HJ_JCODE1 >= SUBSTR(:학년도 - 25,3,2) || '1231' AND HJ_JCODE1 <= SUBSTR(:학년도 - 18, 3,2) || '0101'
AND HJ_HGCODE = HG_CODE AND HG_MCODE = 학과코드
AND HJ_HAKBUN = hc_hakbun