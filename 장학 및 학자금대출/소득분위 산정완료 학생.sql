SELECT 학적.학번 학적학번,국가장학.학번 신청시학번, 성명, 학적.주민등록번호, 학적상태, 승인상태, 신청상태, 소득분위,f_deptnm(고지서.class) 등록학과명,고지서.LVL 등록학년, admissionfee + tuition 총등록금액, scholarship 장학금액,
DECODE(f_janghakgbn(janghakcd1),  '30', '국가', '10', '교내', '20', '외부', '') 장학구분1, f_janghaknm(janghakcd1) 장학명1, scholarship1 장학금1,
DECODE(f_janghakgbn(janghakcd2),  '30', '국가', '10', '교내', '20', '외부', '') 장학구분2, f_janghaknm(janghakcd2) 장학명2, scholarship2 장학금2,
DECODE(f_janghakgbn(janghakcd3),  '30', '국가', '10', '교내', '20', '외부', '') 장학구분3, f_janghaknm(janghakcd3) 장학명3, scholarship3 장학금3,
DECODE(f_janghakgbn(janghakcd4),  '30', '국가', '10', '교내', '20', '외부', '') 장학구분4, f_janghaknm(janghakcd4) 장학명4, scholarship4 장학금4

FROM TDFEEGOJI 고지서, TDJANGHAKSUM 장학금,  tm국가장학신청학생 국가장학, TM학적 학적

WHERE 고지서.schoolyear = :학년도
AND 고지서.semester = :학기
AND 고지서.hakbun = 학적.학번
       AND 고지서.studentgbn <> '30304000'
       AND 학적.주민등록번호 = 국가장학.주민등록번호
       --AND 학적상태 = '01'
AND 고지서.hakbun = 장학금.HAKBUN(+)
AND 고지서.SCHOOLYEAR = 장학금.SCHOOLYEAR(+)
AND 고지서.SEMESTER = 장학금.SEMESTER(+)
