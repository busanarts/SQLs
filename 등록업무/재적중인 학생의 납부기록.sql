SELECT 학번, 성 || 이름 성명, f_statenm(학적상태) 학적상태, 학년, f_deptnm(학과코드) 학과명,
schoolyear 납부학년도, semester 납부학기, f_deptnm(CLASS) 납부학과, lvl 납부학년,
f_feestatenm(state) 납부구분, fee 금액, etcfee 예치금, DECODE(receivegbn, '1000', '은행', '2000', '자수납', '') 납부방법, bank, bigo 비고
FROM TDFEERECEIVE, tm학적
WHERE SUBSTR(학적상태,1,1) IN ('0', '1')
AND hakbun = 학번
