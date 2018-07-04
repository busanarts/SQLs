SELECT 학과명, HJ_HAKBUN 학번, HJ_KNAME 성명, HJ_JCODE1 || '-' || HJ_JCODE2 주민번호,
HL_PSNAME 표시과목명, LR_LICNNO 자격증번호, usr_todate(lr_date) 발급일, USR_TODATE(hj_jymd) 졸업일자
FROM psutis.AC1511, psutis.AC12011, psutis.AC1121, psutis.TBL학과, psutis.AC1501
WHERE --LR_LICNNO >= '1800'
lr_date = :발급일자
--AND lr_date <> hj_jymd
--AND hl_psname = '음악'
AND LR_HAKBUN = HJ_HAKBUN
AND HJ_HGCODE = HG_CODE AND HG_MCODE = 학과코드
AND LR_HGCODE = HL_HGCODE
ORDER BY LR_LICNNO