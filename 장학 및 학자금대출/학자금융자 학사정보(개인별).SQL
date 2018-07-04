-- 주의 : 복학생 등록금 고지작업완료후에 실행하기 바람
SELECT DISTINCT 학자금융자학과코드 학과코드,
DECODE(HC_SCODE, '52', '15', '53', '14', '19') 학적코드, -- 11: 신입, 14: 편입, 15: 재입학, 19: 재학
HJ_JCODE1 || HJ_JCODE2 주민등록번호, HJ_HAKBUN 학번, HJ_KNAME 학생성명,
SUBSTR(HJ_IYMD, 1, 4) 입학년도,
DECODE(HC_SCODE, '11', '64', '12', '65', '13', '65', '24', '66', '31', '18', '81', '69', '51', '16', '52', '13', '53', '13', '14') 학적상태코드,
-- 13: 입학예정, 14: 재학중, 15: 입학취소, 16: 복학, 17: 유급, 18: 전과, 19: 교환, 20: 제적(학사징계)
-- 64: 일반휴학, 65: 군입대휴학, 66: 자퇴, 67: 제적, 68: 등록포기(복학취소포함), 69: 졸업
고지서.LVL 학년, DECODE(고지서.STATE, '11', '1', '88', '0', '2') 등록대상여부,
ADMISSIONFEE + TUITION  등록금액, :학년도 || :등록마감일 등록마감일, --:학년도 || DECODE(:학기, '1', '0330', '2', '0928') 등록마감일,
DECODE(hc_scode, '52', '11', '53', '11', '17') 성적유형, 'N' 계절학기,
-- 11: 고교내신, 12: 수능등급, 13: 검정고시, 14: 해외고교졸업, 15: 북한이탈주민, 16: 석차비율, 17: 이수학점
--DECODE(hc_scode, '51', 4.5, 0) 학생만점기준, DECODE(hc_scode, '51', 직전학기취득학점, 0) 직전학기취득학점,
4.5 학생만점기준, '15' 최소이수학점,
직전학기취득학점, ROUND(직전학기평점평균,2) 직전학기평점평균, 총취득학점,
ROUND(총평점평균,2) 총평점평균, TRUNC(직전학기백분위점수,0) 직전학기백분위점수, TRUNC(총백분위점수,0) 총백분위점수,
'Y' 성적유형통과여부, SUBSTR(최종학년학기, 1, 4) 최종성적취득년도, SUBSTR(최종학년학기, 5, 1) 최종성적취득학기,
DECODE(:학기, '1', 'N', 'Y') 졸업학기여부,
HJ_IYMD 입학일자, 'Y' 입학당시신입생여부
FROM PSUTIS.AC12011, PSUTIS.AC1121, PSUTIS.TBL학과, TDFEEGOJI 고지서, TDFEERECEIVE 수납파일,
(
SELECT 학적변동.* FROM PSUTIS.AC1202 학적변동, (SELECT hc_hakbun, max(hc_siymd) lcdate FROM psutis.AC1202
WHERE HC_SIYMD > DECODE(:학기, '1', :학년도 - 1 || '12', '2', :학년도 || '07')
GROUP BY hc_hakbun) 최종변동
--WHERE HC_SCODE IN ('51', '52', '53') AND HC_SIYMD > DECODE(:학기, '1', :학년도 - 1 || '12', '2', :학년도 || '07')
WHERE HC_SIYMD > DECODE(:학기, '1', :학년도 - 1 || '12', '2', :학년도 || '07')
AND 학적변동.hc_hakbun = 최종변동.hc_hakbun
AND 학적변동.hc_siymd = 최종변동.lcdate
--AND hc_scode = '31'
) cc, -- 복학자료 가져오기
(
SELECT SJ_HAKBUN, 최종학년학기, SUM(DECODE(SJ_DUNGGUB, 'F', 0, SJ_HJUM)) 직전학기취득학점,
SUM(DECODE(SJ_DUNGGUB, 'P', 0, SJ_PJUM) * SJ_HJUM) / DECODE(SUM(DECODE(SJ_DUNGGUB, 'P', 0, SJ_HJUM)), 0, 1, SUM(DECODE(SJ_DUNGGUB, 'P', 0, SJ_HJUM))) 직전학기평점평균,
SUM(DECODE(SJ_DUNGGUB, 'P', 0, SJ_JUMSU) * SJ_HJUM) / DECODE(SUM(DECODE(SJ_DUNGGUB, 'P', 0, SJ_HJUM)), 0, 1, SUM(DECODE(SJ_DUNGGUB, 'P', 0, SJ_HJUM))) 직전학기백분위점수
FROM PSUTIS.AC1401 A,
(
SELECT SJ_HAKBUN 학번,
MAX(SJ_YEAR||SJ_HAKGI) 최종학년학기
FROM PSUTIS.AC1401, PSUTIS.AC12011
WHERE SJ_HAKBUN = HJ_HAKBUN
--AND HJ_STATE = '01'
AND SJ_INJUNG = 'Y'
GROUP BY SJ_HAKBUN
) B
WHERE SJ_HAKBUN = 학번 AND SJ_YEAR = SUBSTR(최종학년학기, 1, 4) AND SJ_HAKGI = SUBSTR(최종학년학기, 5, 1)
GROUP BY SJ_HAKBUN, 최종학년학기
) C,
(
SELECT SJ_HAKBUN, SUM(DECODE(SJ_DUNGGUB, 'F', 0, SJ_HJUM)) 총취득학점,
SUM(DECODE(SJ_DUNGGUB, 'P', 0, SJ_PJUM) * SJ_HJUM) / DECODE(SUM(DECODE(SJ_DUNGGUB, 'P', 0, SJ_HJUM)), 0, 1, SUM(DECODE(SJ_DUNGGUB, 'P', 0, SJ_HJUM))) 총평점평균,
SUM(DECODE(SJ_DUNGGUB, 'P', 0, SJ_JUMSU) * SJ_HJUM) / DECODE(SUM(DECODE(SJ_DUNGGUB, 'P', 0, SJ_HJUM)), 0, 1, SUM(DECODE(SJ_DUNGGUB, 'P', 0, SJ_HJUM))) 총백분위점수
FROM PSUTIS.AC1401, PSUTIS.AC12011
WHERE SJ_HAKBUN = HJ_HAKBUN
--AND HJ_STATE = '01'
AND SJ_INJUNG = 'Y'
GROUP BY SJ_HAKBUN
) D
WHERE
HJ_HGCODE = HG_CODE AND HG_MCODE = 학과코드(+)
AND HJ_HAKBUN = C.SJ_HAKBUN(+)
AND HJ_HAKBUN = D.SJ_HAKBUN(+)
AND HJ_HAKBUN = cc.HC_HAKBUN(+)
--AND HJ_HAKBUN = cc.HC_HAKBUN
AND 고지서.SCHOOLYEAR = :학년도 AND 고지서.SEMESTER = :학기
AND HJ_HAKBUN = 고지서.HAKBUN
AND 고지서.SCHOOLYEAR = 수납파일.SCHOOLYEAR(+) AND 고지서.SEMESTER = 수납파일.SEMESTER(+) AND 고지서.HAKBUN = 수납파일.HAKBUN(+)
--AND 고지서.studentgbn = '3030' || DECODE(:학적상태, '0', '1000', '5', '2000')
AND 고지서.studentgbn <> '30304000'
AND HJ_HAKBUN = :학번
