SELECT 학자금코드 학자금융자학과코드,
       '11' 학적코드,
       iw_jcode1 || iw_jcode2 주민번호,
       Iw_shno 수험번호,
       iw_kname 성명,
       '1' 학년,
       DECODE(state, '77', '2', '11', '1', '0') 등록납부대상구분,
       :입시년도 || :등록마감일 수납원장마감일자,
       '1' 대학수납계좌구분1,
       '032' 수납계좌은행코드1,
       F_GETVNO(iw_shno, '301002') 수납은행계좌번호1,
       iw_kname 수납계좌예금주명1,
       '1' 대학수납계좌구분2,
       '011' 수납계좌은행코드2,
       F_GETVNO(iw_shno, '301003') 수납은행계좌번호2,
       iw_kname 수납계좌예금주명2,

       --DECODE(J.JANGHAKCD1, '30', F_GETDCODE(J.JANGHAKCD1), '') 재단수혜장학1코드,
       DECODE(F_GETJANGHAKGBN(janghakcd1), '30', F_GETDCODE(JANGHAKCD1), '') 재단수혜장학1코드,
       DECODE(F_GETJANGHAKGBN(J.JANGHAKCD1), '30', NVL(J.SCHOLARSHIP1, 0), 0) 재단수혜장학1금액,

       --DECODE(J.JANGHAKCD2, '30', F_GETDCODE(J.JANGHAKCD2), '') 재단수혜장학2코드,
       DECODE(F_GETJANGHAKGBN(janghakcd2), '30', F_GETDCODE(JANGHAKCD2), '') 재단수혜장학2코드,
       DECODE(F_GETJANGHAKGBN(J.JANGHAKCD2), '30', NVL(J.SCHOLARSHIP2, 0), 0) 재단수혜장학2금액,

       --DECODE(J.JANGHAKCD3, '30', F_GETDCODE(J.JANGHAKCD3), '') 재단수혜장학3코드,
       DECODE(F_GETJANGHAKGBN(janghakcd3), '30', F_GETDCODE(JANGHAKCD3), '') 재단수혜장학3코드,
       DECODE(F_GETJANGHAKGBN(J.JANGHAKCD3), '30', NVL(J.SCHOLARSHIP3, 0), 0) 재단수혜장학3금액,

       DECODE(F_GETJANGHAKGBN(J.JANGHAKCD1), '10', NVL(J.SCHOLARSHIP1, 0), 0) + DECODE(F_GETJANGHAKGBN(J.JANGHAKCD2), '10', NVL(J.SCHOLARSHIP2, 0), 0) + DECODE(F_GETJANGHAKGBN(J.JANGHAKCD3), '10', NVL(J.SCHOLARSHIP3, 0), 0) 교내장학금,
       DECODE(F_GETJANGHAKGBN(J.JANGHAKCD1), '20', NVL(J.SCHOLARSHIP1, 0), 0) + DECODE(F_GETJANGHAKGBN(J.JANGHAKCD2), '20', NVL(J.SCHOLARSHIP2, 0), 0) + DECODE(F_GETJANGHAKGBN(J.JANGHAKCD3), '20', NVL(J.SCHOLARSHIP3, 0), 0) 교외장학금,

       prefee 예치금, -- 무조건 0 처리
       admissionfee 입학금,
       tuition 수업료,
       0 기성회비

  FROM TDFEEGOJI D,
       TDJANGHAKSUM J,
       ipsi.ipsi201 S,
       TM학과 H --, TMSCHOLARSHIP C
 WHERE D.schoolyear = :입시년도
       AND D.SCHOOLYEAR = J.SCHOOLYEAR(+)
       AND D.SEMESTER = J.SEMESTER(+)
       AND D.HAKBUN = J.HAKBUN(+)
       AND d.SCHOOLYEAR = s.iw_year
       AND D.HAKBUN = s.iw_shno
       AND D.class = H.학과코드
       AND s.IW_RESULT IN ('1', '5') --AND studentgbn = '30303130' -- 30303000 = 정시1차, 30303112 = 정시1차 추가합격2, 30303120 = 정시2차, 30303130 = 정시3차
       AND STUDENTGBN <> '30304000' --AND state <> '88'
       --AND studentgbn = '3030' || DECODE(:구분, '수시', '30', '정시', '31') || SUBSTR(:차수,2,1) || :추가 -- 정시1차 추가1차
       --AND studentgbn = '30303111'  -- 정시1차 추가1차


