SELECT 학자금코드  학과코드, '19' 학적코드, 주민등록번호, 학번, 성 || 이름 학생명, 학년,
DECODE(state, '77', '2', '11', '1', '0') 등록납부대상구분, :학년도 || :등록마감일 수납원장마감일자,
'1' 대학수납계좌구분1, '032' 수납계좌은행코드1, F_GETVNO(학번, '301002') 수납은행계좌번호1, 성 || 이름 수납계좌예금주명1,
'1' 대학수납계좌구분2, '011' 수납계좌은행코드2, F_GETVNO(학번, '301003') 수납은행계좌번호2, 성 || 이름 수납계좌예금주명2,
DECODE(J.JANGHAKCD1, '30', F_GETDCODE(J.JANGHAKCD1), '') 재단수혜장학1코드,
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD1), '30', NVL(J.SCHOLARSHIP1, 0), 0) 재단수혜장학1금액,
DECODE(J.JANGHAKCD2, '30', F_GETDCODE(J.JANGHAKCD2), '') 재단수혜장학2코드,
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD2), '30', NVL(J.SCHOLARSHIP2, 0), 0) 재단수혜장학2금액,
DECODE(J.JANGHAKCD3, '30', F_GETDCODE(J.JANGHAKCD3), '') 재단수혜장학3코드,
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD3), '30', NVL(J.SCHOLARSHIP3, 0), 0) 재단수혜장학3금액,
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD1), '10', NVL(J.SCHOLARSHIP1, 0), 0) +
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD2), '10', NVL(J.SCHOLARSHIP2, 0), 0) +
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD3), '10', NVL(J.SCHOLARSHIP3, 0), 0) 교내장학금,
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD1), '20', NVL(J.SCHOLARSHIP1, 0), 0) +
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD2), '20', NVL(J.SCHOLARSHIP2, 0), 0) +
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD3), '20', NVL(J.SCHOLARSHIP3, 0), 0) 교외장학금,
0 예치금, ADMISSIONFEE 입학금, TUITION 수업료, '' 기성회비
FROM TDFEEGOJI D, TDJANGHAKSUM J, TM학적 S, TM학과 H, --, TMSCHOLARSHIP C
(SELECT * FROM psutis.AC1202
WHERE SUBSTR(HC_SCODE,1,1) = '5'
AND HC_SIYMD > DECODE(:학기, '1', :학년도 - 1 || '12', '2', :학년도 || '07')
) C--, TMSCHOLARSHIP C
WHERE D.schoolyear = :학년도 AND d.SEMESTER = :학기
AND D.HAKBUN IN ( 'A1075041')
AND D.SCHOOLYEAR = J.SCHOOLYEAR(+)
AND D.SEMESTER = J.SEMESTER(+)
AND D.HAKBUN = J.HAKBUN(+)
AND D.HAKBUN = 학번 AND S.학과코드 = H.학과코드
AND 학번 = c.hc_hakbun
--AND studentgbn IN ( '30301000', '30302000')
AND 학적상태 = '01'


