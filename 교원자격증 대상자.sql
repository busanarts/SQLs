SELECT lr_year 졸업년도, lr_hgcode 학과코드, hg_kname 학과명, lr_hakbun 학번,
lr_licnno 자격증번호, lr_result 합격여부, lr_date 발급일자, '부산예술대학교' 구분, lr_bigo 비고
FROM ac1511 a, ac12011 b, AC1121
WHERE lr_result IS NULL
AND lr_year = '2014'
--lr_result = 'Y'
AND lr_hakbun = hj_hakbun
AND lr_hgcode = hg_code