--UPDATE TM국가장학금수혜자 aa SET 학번 = (SELECT 학번 FROM TM학적 학적 WHERE aa.주민등록번호 = 학적.주민등록번호 AND SUBSTR(학적.학적상태,1,1) IN ('0', '1')) WHERE LENGTH(학번) <> 8;
UPDATE TM국가장학금수혜자 SET 등록금액 = (SELECT SUM(NVL(fee, 0)+NVL(etcfee, 0)) FROM TDFEERECEIVE WHERE schoolyear = '2015' AND hakbun = 학번 AND state <> '88')
,환불금액 = (SELECT SUM(NVL(fee, 0)+NVL(etcfee, 0)) FROM TDFEERECEIVE WHERE schoolyear = '2015' AND hakbun = 학번 and state = '88')
,등록구분 = (SELECT DECODE(state, '77', '완납', '11', '미납', '88', '환불', '55', '승계', '33', '납부유예', '22', '부분납') FROM TDFEEGOJI WHERE schoolyear = '2015' AND hakbun = 학번 AND studentgbn <> '30304000')
,고지금액= (SELECT (admissionfee+tuition-etcfee-scholarship) FROM TDFEEGOJI WHERE schoolyear = '2015' AND hakbun = 학번  AND studentgbn <> '30304000')
,감면금액= (SELECT scholarship FROM TDFEEGOJI WHERE schoolyear = '2015' AND hakbun = 학번  AND studentgbn <> '30304000')
,학적상태 = f_hjstate(학번)

