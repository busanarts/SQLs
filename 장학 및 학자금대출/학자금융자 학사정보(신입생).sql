SELECT 학자금코드 학자금융자학과코드,
       '11' 학적코드,
       iw_jcode1 || iw_jcode2 주민번호,
       Iw_shno 수험번호,
       iw_kname 성명,
       :입시년도 입학년도,
       '13' 학적상태코드,
       '1' 학년,
       DECODE(state, '77', '2', '11', '1', '0') 등록납부대상구분,
       admissionfee + tuition 예상등록금액,
       :입시년도 || :등록마감일 등록마감일,
       DECODE(SUBSTR(iw_ggcode,2,9),'100000001','13','11') 성적유형, -- 검정고시(13) 외 고교내신(11)으로
       'N' 계절학기포함여부,
       4.5 학점만점기준,
       15 학기당최소이수학점,
       0 직전학기이수학점,
       0 직전학기이수평점,
       0 총이수학점,
       0 총이수평점,
       0 직전학기백분위점수,
       0 총평균백분위점수,
       'Y' 성적유형통과여부,
       '' 최종성적취득년도,
       '' 최종성적취득학기,
       'N' 졸업학기여부,
       :입시년도 || :입학일자 입학예정일자,
       'Y' 입학당시신입생여부
  FROM ipsi.IPSI201,
       TDFEEGOJI,
       tm학과
 WHERE iw_year = :입시년도 --AND iw_chasu = '01'
       AND iw_result IN ('1', '5')
       AND iw_year = schoolyear
       AND iw_shno = hakbun
       AND CLASS = 학과코드
 		 --AND SUBSTR(studentgbn,5,2) = DECODE(:차수, '91', '30303010', '92', '30303010', '93', '30303010', '01', '30303110', '02', '30303120', '03', '30303130')
       AND STUDENTGBN <> '30304000' --AND state <> '88'
     --AND studentgbn = '3030' || DECODE(:구분, '수시', '30', '정시', '31') || SUBSTR(:차수,2,1) || :추가  -- 정시1차 추가1차
       --AND studentgbn = '30303112'
