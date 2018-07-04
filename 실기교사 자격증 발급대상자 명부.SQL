SELECT 학과명, HJ_HAKBUN 학번, HJ_KNAME 성명, HJ_JCODE1 || '-' || HJ_JCODE2 주민번호,
HL_PSNAME 표시과목명, lr_licnno 번호
FROM AC1511, AC12011, AC1121, TBL학과, AC1501
WHERE --LR_LICNNO >= '1702'
lr_result = 'Y'
--AND lr_hgcode = '25'
AND lr_licnno IS null
AND LR_HAKBUN = HJ_HAKBUN
AND HJ_HGCODE = HG_CODE AND HG_MCODE = 학과코드
AND LR_HGCODE = HL_HGCODE
ORDER BY 학과명, hj_hakbun