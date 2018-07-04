-- 2.1.3.ㄹ~ㅇ 정원내 재적학새우 유급.복학.재입학.전과.편입학(총인원)
--SELECT SUBSTR(20141001,1,4) || DECODE(SUBSTR(20141001,5,2), '04', '01', '02') 조사기간코드, '73148000' 학교코드, 학년, 학과명,
SELECT 학년, 학과명, '' 입학정원,
MAX(NVL(DECODE(grp, '입학인원', cnt, 0),0)) 입학인원,
MAX(NVL(DECODE(grp, '당초입학', CNT, 0),0)) 당초입학,
MAX(NVL(DECODE(grp||학적변동, '총인원61', CNT, 0),0)) 유급,
MAX(NVL(DECODE(grp||학적변동, '금학기61', CNT, 0),0)) 유급_금학기,
MAX(NVL(DECODE(grp||학적변동, '총인원51', CNT, 0),0)) 복학,
MAX(NVL(DECODE(grp||학적변동, '금학기51', CNT, 0),0)) 복학_금학기,
MAX(NVL(DECODE(grp||학적변동, '총인원52', CNT, 0),0)) 재입학,
MAX(NVL(DECODE(grp||학적변동, '금학기52', CNT, 0),0)) 재입학_금학기,
MAX(NVL(DECODE(grp||학적변동, '총인원31', CNT, 0),0)) 전과,
MAX(NVL(DECODE(grp||학적변동, '금학기31', CNT, 0),0)) 전과_금학기,
MAX(NVL(DECODE(grp||학적변동, '총인원53', CNT, 0),0)) 편입학,
MAX(NVL(DECODE(grp||학적변동, '금학기53', CNT, 0),0)) 편입학_금학기,
MAX(NVL(DECODE(grp||학적변동, '당초입학', CNT, 0),0)) +
MAX(NVL(DECODE(grp||학적변동, '총인원61', CNT, 0),0)) + MAX(NVL(DECODE(grp||학적변동, '총인원51', CNT, 0),0)) +
MAX(NVL(DECODE(grp||학적변동, '총인원52', CNT, 0),0)) + MAX(NVL(DECODE(grp||학적변동, '총인원31', CNT, 0),0)) +
MAX(NVL(DECODE(grp||학적변동, '총인원11', CNT, 0),0)) 재학생총인원,
MAX(NVL(DECODE(grp||학적변동, '금학기61', CNT, 0),0)) + MAX(NVL(DECODE(grp||학적변동, '금학기51', CNT, 0),0)) +
MAX(NVL(DECODE(grp||학적변동, '금학기52', CNT, 0),0)) + MAX(NVL(DECODE(grp||학적변동, '금학기31', CNT, 0),0)) +
MAX(NVL(DECODE(grp||학적변동, '금학기53', CNT, 0),0)) 재학생금학기,
MAX(NVL(DECODE(GRP||학적변동, '재학생1', CNT, 0),0)) 재학생_남,
MAX(NVL(DECODE(GRP||학적변동, '재학생2', CNT, 0),0)) 재학생_여,
MAX(NVL(DECODE(GRP||학적변동, '재학생1', CNT, 0),0)) + MAX(NVL(DECODE(GRP||학적변동, '재학생2', CNT, 0),0)) 재학생_계,
MAX(NVL(DECODE(grp||학적변동, '휴학총인원1', CNT, 0),0)) 휴학_남,
MAX(NVL(DECODE(grp||학적변동, '휴학총인원2', CNT, 0),0)) 휴학_여,
MAX(NVL(DECODE(grp||학적변동, '휴학총인원1', CNT, 0),0)) + MAX(NVL(DECODE(grp||학적변동, '휴학총인원2', CNT, 0),0)) 휴학_계,
MAX(NVL(DECODE(grp||학적변동, '금학기휴학91', CNT, 0),0)) 금학기휴학,
max(NVL(DECODE(grp||학적변동, '사유별휴학군입대', cnt, 0), 0)) 군입대,
'' 어학연수_남, '' 어학연수_여, '' 취업준비_남, '' 취업준비_여, '' 경제사정_남, '' 경제사정_여,
max(NVL(DECODE(grp||학적변동, '사유별휴학개인사정남', cnt, 0), 0)) 개인사정_남,
max(NVL(DECODE(grp||학적변동, '사유별휴학개인사정여', cnt, 0), 0)) 개인사정_여,
MAX(NVL(DECODE(grp||학적변동, '미등록남', cnt, 0), 0)) 미등록_남,
MAX(NVL(DECODE(grp||학적변동, '미등록여', cnt, 0), 0)) 미등록_여,
MAX(NVL(DECODE(grp||학적변동, '미등록남', cnt, 0), 0)) + MAX(NVL(DECODE(grp||학적변동, '미등록여', cnt, 0), 0)) 미등록계,
MAX(NVL(DECODE(grp, '제적생', cnt, 0), 0)) 제적생

FROM
(
--------------------------------------------------------------------------------
--
-- 정원내 재학생
--
--------------------------------------------------------------------------------
-- 입학인원
	select '입학인원' grp, hj_haknyun 학년, 학과명, '00' 학적변동, count(*) cnt
	from ac12011_20141001, AC1121, TBL학과
	where hj_jhgbn < '50' AND HJ_HAKBUN NOT LIKE 'T%'
  AND hj_hakbun LIKE 'A' || SUBSTR(20141001,3,2) || '%'
--  AND (hj_hakbun LIKE 'A' || SUBSTR(20141001,3,2) || '%'
--  OR hj_hakbun LIKE 'A' || LPAD(TO_CHAR(TO_NUMBER(SUBSTR(20141001,3,2)) - 1), 2, '0') || '%')
  and hj_hakbun not in (select distinct hc_hakbun from AC1202_20141001 where hc_hakbun = hj_hakbun AND hc_scode IN ('52', '53'))
  AND SUBSTR(HJ_hakbun,4,2) = hg_code AND hg_mcode = 학과코드
	group by hj_haknyun, 학과명
  UNION
-- 당초입학
	select '당초입학' grp, hj_haknyun 학년, 학과명, '00' 학적변동, count(*) cnt
	from ac12011_20141001, AC1121, TBL학과
	where hj_state = '01' and hj_jhgbn < '50' AND HJ_HAKBUN NOT LIKE 'T%'
	and hj_hakbun not in (select distinct hc_hakbun from AC1202_20141001 where hc_hakbun = hj_hakbun)
  AND SUBSTR(HJ_hakbun,4,2) = hg_code AND hg_mcode = 학과코드
	group by hj_haknyun, 학과명
  UNION
  -- 재학생학적변동
	SELECT '총인원' grp, HJ_HAKNYUN 학년, 학과명, '11' 학적변동, COUNT(*) CNT
  FROM ac12011_20141001, AC1121, TBL학과
	WHERE HJ_STATE = '01' AND hj_jhgbn < '50' AND HJ_HAKBUN NOT LIKE 'T%'
	AND HJ_HGCODE = hg_code AND hg_mcode = 학과코드
	GROUP BY 학과명, HJ_HAKNYUN
  UNION
  -- 재학생남녀별
  select '재학생' grp, hj_haknyun 학년, 학과명,
	hj_sexgbn 성별, count(*) cnt
	from ac12011_20141001, AC1121, TBL학과
	where hj_state = '01' and hj_jhgbn < '50' AND HJ_HAKBUN NOT LIKE 'T%'
  AND HJ_HGCODE = hg_code AND hg_mcode = 학과코드
	group by 학과명, hj_haknyun, hj_sexgbn
  UNION
  -- 금학기학적변동
	SELECT '금학기' grp, HJ_HAKNYUN 학년, 학과명, HC_SCODE 학적변동, COUNT(*) CNT
  FROM ac12011_20141001, AC1121, TBL학과, (
		SELECT HC_HAKBUN, HC_SCODE, HC_SIYMD FROM AC1202_20141001 A1
		WHERE (HC_HAKBUN, HC_SIYMD) IN (SELECT HC_HAKBUN, MAX(HC_SIYMD) FROM AC1202_20141001
		WHERE HC_SIYMD >= DECODE(SUBSTR(20141001,5,2), '04',
  									SUBSTR(20141001,1,4) - 1 || '1001',
                    SUBSTR(20141001,1,4) || '0401')
  	AND HC_SIYMD <= DECODE(SUBSTR(20141001,5,2), '04',
  									SUBSTR(20141001,1,4) || '0331',
                    SUBSTR(20141001,1,4) || '0931')
		GROUP BY HC_HAKBUN)
	)
	WHERE HJ_STATE = '01' AND hj_jhgbn < '50' AND HJ_HAKBUN NOT LIKE 'T%'
	AND HJ_HAKBUN = HC_HAKBUN
  AND HJ_HGCODE = hg_code AND hg_mcode = 학과코드
	GROUP BY HJ_HAKNYUN, 학과명, HC_SCODE
  -- 휴학총인원
  UNION

--------------------------------------------------------------------------------
--
-- 정원내 휴학생
--
--------------------------------------------------------------------------------
  SELECT '휴학총인원' grp, HJ_HAKNYUN 학년, 학과명,
	HJ_SEXGBN 성별, COUNT(*) cnt
	FROM ac12011_20141001, AC1121, TBL학과
	WHERE SUBSTR(HJ_STATE,1,1) = '1'
	AND hj_jhgbn < '50' AND hj_hakbun NOT LIKE 'T%'
  AND HJ_HGCODE = hg_code AND hg_mcode = 학과코드
	GROUP BY HJ_HAKNYUN, 학과명, HJ_SEXGBN
	UNION
  -- 금학기 휴학
  SELECT '금학기휴학' grp, HJ_HAKNYUN 학년, 학과명, '91' 학적변동,COUNT(*) 금학기휴학인원
  FROM ac12011_20141001, AC1202_20141001, AC1121, TBL학과
  WHERE HJ_HAKBUN = HC_HAKBUN
  AND HJ_HGCODE = hg_code AND hg_mcode = 학과코드
  AND hj_jhgbn < '50'
  AND SUBSTR(HC_SCODE,1,1) = '1' AND HJ_HAKBUN NOT LIKE 'T%'
	AND HC_SIYMD >= DECODE(SUBSTR(20141001,5,2), '04',
  									SUBSTR(20141001,1,4) - 1 || '1001',
                    SUBSTR(20141001,1,4) || '0401')
  AND HC_SIYMD <= DECODE(SUBSTR(20141001,5,2), '04',
  									SUBSTR(20141001,1,4) || '0331',
                    SUBSTR(20141001,1,4) || '0931')
  GROUP BY HJ_HAKNYUN, 학과명
  UNION
  -- 사유별 휴학생수
  SELECT '사유별휴학' grp, hj_haknyun 학년, 학과명,
  DECODE(Hj_state, '12', '군입대', '13', '군입대', DECODE(hj_sexgbn, '1', '개인사정남', '개인사정여')) 학적변동, COUNT(*) 사유별인원
	FROM ac12011_20141001, AC1121, TBL학과
  WHERE hj_jhgbn < '50'
  AND HJ_HGCODE = hg_code AND hg_mcode = 학과코드
  AND SUBSTR(HJ_STATE,1,1) = '1'
  AND HJ_HAKBUN NOT LIKE 'T%'
  GROUP BY hj_haknyun, 학과명, DECODE(Hj_state, '12', '군입대', '13', '군입대', DECODE(hj_sexgbn, '1', '개인사정남', '개인사정여'))
  UNION
--------------------------------------------------------------------------------
--
-- 정원내 제적생
--
--------------------------------------------------------------------------------
-- 미등록
	SELECT '미등록' grp, hj_haknyun 학년, 학과명, DECODE(hj_sexgbn, '1', '남', '2', '여') 학적변동, COUNT(*) 사유별인원
	FROM PSUTIS.AC12011_20141001, ciss.TDFEEGOJI, AC1121, TBL학과
	WHERE schoolyear = substr(20141001,1,4) AND state IN('11', '22', '33')
	AND hakbun = hj_hakbun
  AND HJ_HGCODE = hg_code AND hg_mcode = 학과코드
	AND hj_state = '01'
	AND hj_jhgbn < '50'
	GROUP BY 학과명, hj_haknyun, DECODE(hj_sexgbn, '1', '남', '2', '여')
  UNION

-- 제적
	SELECT '제적생' grp, hj_haknyun 학년, 학과명, '20' 학적변동, COUNT(*) 사유별인원
	FROM PSUTIS.AC12011_20141001, AC1121, TBL학과
	WHERE HJ_HAKBUN IN (SELECT HC_HAKBUN FROM AC1202_20141001
	WHERE SUBSTR(HC_SCODE,1,1) = '2'
	AND HC_SIYMD >= DECODE(SUBSTR(20141001,5,2), '04',
  									SUBSTR(20141001,1,4) - 1 || '1001',
                    SUBSTR(20141001,1,4) || '0401')
  AND HC_SIYMD <= DECODE(SUBSTR(20141001,5,2), '04',
  									SUBSTR(20141001,1,4) || '0331',
                    SUBSTR(20141001,1,4) || '0931')
	GROUP BY HC_HAKBUN)
  AND hj_jhgbn < '50'
  AND HJ_HGCODE = hg_code AND hg_mcode = 학과코드
	GROUP BY 학과명, hj_haknyun

)

GROUP BY 학년, 학과명
ORDER BY 학년, 학과명
