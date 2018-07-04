SELECT 학과명, HJ_HAKBUN 학번, HJ_KNAME 성명, HB_NAME 변동사유,
substr(hc_siymd, 1,4) || '.' || substr(hc_siymd, 5,2) || '.' || substr(hc_siymd, 7, 2) 학적변동일자,
substr(hj_hsghtel,1,3) || '-' || substr(hj_hsghtel,4,4) || '-' || substr(hj_hsghtel,8,4) 자택전화,
substr(hj_hshptel,1,3) || '-' || substr(hj_hshptel,4,4) || '-' || substr(hj_hshptel,8,4) 휴대전화
--HJ_HSHPTEL 핸드폰, HJ_HSGHTEL 집전화
FROM psutis.AC1202 A, psutis.AC12011, psutis.AC1121, psutis.TBL학과, psutis.AC1104
WHERE HC_YEAR = :학년도 AND HC_HAKGI = :학기
AND SUBSTR(HC_SCODE,1,1)  = '1'
AND HC_HAKBUN = HJ_HAKBUN
AND HJ_HGCODE = HG_CODE AND HG_MCODE = 학과코드
AND HC_SCODE = HB_CODE
AND (HC_HAKBUN, HC_SIYMD) IN
(SELECT HC_HAKBUN, MAX(HC_SIYMD) FROM psutis.AC1202
WHERE HC_HAKBUN = A.HC_HAKBUN
GROUP BY HC_HAKBUN)
ORDER BY 학과명, HJ_HAKBUN
