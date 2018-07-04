
SELECT 고지명부.Schoolyear 학년도, 고지명부.SEMESTER 학기, 고지명부.lvl 학년, 학과명, 고지명부.HAKBUN 학번, 성 || 이름 성명, TRIM(F_STATENM(학적상태)) 학적상태,
ADMISSIONFEE 입학금, TUITION 수업료, SCHOLARSHIP 고지장학금,

F_janghaknm(janghakcd1) 장학명1, SCHOLARSHIP1 장학1금액,
F_janghaknm(janghakcd2) 장학명2, SCHOLARSHIP2 장학2금액,
F_janghaknm(janghakcd3) 장학명3, SCHOLARSHIP3 장학3금액,
F_janghaknm(janghakcd4) 장학명4, SCHOLARSHIP4 장학4금액,

--(NVL(SCHOLARSHIP1,0) + NVL(SCHOLARSHIP2,0) + NVL(SCHOLARSHIP3,0) + NVL(SCHOLARSHIP4,0)) 장학SUM,

SCHOLARSHIP -(NVL(SCHOLARSHIP1,0) + NVL(SCHOLARSHIP2,0) + NVL(SCHOLARSHIP3,0) + NVL(SCHOLARSHIP4,0)) 차액,

prefee 예치금,
ADMISSIONFEE + TUITION - SCHOLARSHIP - NVL(PREFEE,0) 고지금액, NVL(수납금액,0) 수납금액,
DECODE(NVL(수납금액,0), 0, 0, NVL(수납금액,0) - NVL(환불금액,0)) 실납부금액, NVL(환불금액,0) 환불금액,
DECODE(고지명부.state, '77', '완납', '11', '미납', '33', '납부유예', '22', '부분납', '55', '승계', '88', '환불') 납부구분, 수납일자, 환불일자,
DECODE(고지명부.state, '11', 0, -(ADMISSIONFEE + TUITION - SCHOLARSHIP - NVL(수납금액,0) + NVL(환불금액,0))) 금액오류체크,
DECODE(고지명부.state, '11', DECODE(rcvamt, 0, '', '오류')) 납부구분오류,
bigo 비고


FROM TDFEEGOJI 고지명부, TM학적 학적, tm학과 학과, tdjanghaksum,
(SELECT schoolyear, semester, HAKBUN, SUM(NVL(FEE,0)+nvl(etcfee,0)) 환불금액, MAX(receivedt) 환불일자 FROM TDFEERECEIVE
WHERE  schoolyear = :학년도
AND studentgbn <> '30404000' -- 예치금 제외
and state = '88'
GROUP BY  schoolyear, semester,HAKBUN) 환불명부,
(SELECT schoolyear, semester, HAKBUN, SUM(NVL(fee,0) + nvl(etcfee,0)) 수납금액, MAX(RECEIVEDT) 수납일자 FROM TDFEERECEIVE
WHERE  schoolyear = :학년도
AND state <> '88'
AND studentgbn <> '30404000'
GROUP BY  schoolyear, semester,HAKBUN) 등록명부
WHERE 고지명부.schoolyear = :학년도
AND 고지명부.SEMESTER = :학기

AND 고지명부.SCHOOLYEAR = tdjanghaksum.SCHOOLYEAR(+)
AND 고지명부.semester = tdjanghaksum.SEMESTER(+)
AND 고지명부.hakbun = tdjanghaksum.HAKBUN(+)

AND 학적상태 = '00'
AND 고지명부.studentgbn <> '30304000'
AND 고지명부.schoolyear = 등록명부.schoolyear(+)
AND 고지명부.semester = 등록명부.semester(+)
AND 고지명부.hakbun = 등록명부.hakbun(+)
AND 고지명부.schoolyear = 환불명부.schoolyear(+)
AND 고지명부.semester = 환불명부.semester(+)
AND 고지명부.hakbun = 환불명부.hakbun(+)
AND 고지명부.hakbun = 학적.학번 AND 고지명부.CLASS = 학과.학과코드




ORDER BY 고지명부.SCHOOLYEAR, 고지명부.SEMESTER, 고지명부.LVL, 고지명부.HAKBUN

