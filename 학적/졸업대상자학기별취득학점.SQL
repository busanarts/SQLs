SELECT 학과명,학번, 성명,
MAX(DECODE(학년 || 학기, '11', 총신청학점, 0)) "1학년 1학기 취득학점",
MAX(DECODE(학년 || 학기, '12', 총신청학점, 0)) "1학년 2학기 취득학점",
MAX(DECODE(학년 || 학기, '21', 총신청학점, 0)) "2학년 1학기 취득학점",
MAX(DECODE(학년 || 학기, '22', 총신청학점, 0)) "2학년 2학기 취득학점",

NVL(f_전필취득학점(학번),'0') 전필취득학점, NVL(f_전선취득학점(학번),'0') 전선취득학점,
NVL(f_교필취득학점(학번),'0') 교필취득학점, NVL(f_교선취득학점(학번),'0') 교선취득학점,
NVL(f_교직취득학점(학번),'0') 교직취득학점, NVL(f_자선취득학점(학번),'0') 자선취득학점,

MAX(DECODE(학년 || 학기, '11', 총신청학점, 0))  +
MAX(DECODE(학년 || 학기, '12', 총신청학점, 0))  +
MAX(DECODE(학년 || 학기, '21', 총신청학점, 0))  +
MAX(DECODE(학년 || 학기, '22', 총신청학점, 0)) "총취득학점",

F_AVGGRADE(학번) 총평점


FROM (SELECT 학과명, 학번 학번, 성 || 이름 성명, sglvl 학년, semester 학기,
SUM(gradejum) 총신청학점, ROUND(SUM(avejumsu * gradejum) / SUM(gradejum), 2) 평점평균
FROM ciss.tm학적 a, PSUTIS.tdresult, ciss.Tm학과 b
WHERE a.학과코드 = b.학과코드
AND 학번 = HAKBUN AND 학년 = '2'
AND 학적상태 = '01' AND gradelvl NOT IN ('F')
              AND 학번 IN
              (SELECT DISTINCT hakbun
                FROM psutis.tdresult
               WHERE 학번 = hakbun
                     AND schoolyear = DECODE(:졸업구분, '전기', :학년도, '후기', :학년도 + 1)
                     AND semester = DECODE(:졸업구분, '전기', '2', '후기', '1')
              )

GROUP BY 학과명, 학번, 성, 이름, sglvl, semester)
GROUP BY 학과명, 학번, 성명