SELECT A.학과명,
	MAX(DECODE(A.성별, '남', DECODE(전형구분, '정원내', 인원, 0))) 정원내남, MAX(DECODE(A.성별, '여', DECODE(전형구분, '정원내', 인원, 0))) 정원내여,
	MAX(DECODE(A.성별, '남', DECODE(전형구분, '정원외', 인원, 0))) 정원외남, MAX(DECODE(A.성별, '여', DECODE(전형구분, '정원외', 인원, 0))) 정원외여,
	MAX(DECODE(A.성별, '남', DECODE(전형구분, '위탁', 인원, 0))) 위탁남, MAX(DECODE(A.성별, '여', DECODE(전형구분, '위탁', 인원, 0))) 위탁여,
	MAX(DECODE(B.성별, '남', 교원인원, 0)) 교직이수남, MAX(DECODE(B.성별, '여', 교원인원, 0)) 교직이수여
FROM
	(
  SELECT 학과명, f정원내외(학번) 전형구분,
		성별, COUNT(*) 인원
	FROM tm학적_&조사기준일 학적, tm학과 학과
	WHERE 학적상태 IN ('81', '82', '83') AND 졸업일자 >= SUBSTR(:조사기준일,1,4) - 1 || '08'
		AND 학적.학과코드 = 학과.학과코드
	GROUP BY 학과명, f정원내외(학번), 성별) A,
	(SELECT 학과명, 성별, COUNT(*) 교원인원
	FROM tm학적_&조사기준일 학적, tm학과 학과, psutis.AC1511
	WHERE 학적상태 IN ('81', '82', '83') AND 졸업일자 >= SUBSTR(:조사기준일,1,4) - 1 || '08'
		AND 학적.학과코드 = 학과.학과코드
		AND 학번 = LR_HAKBUN AND LR_RESULT = 'Y'
	GROUP BY 학과명, 성별) B
WHERE A.학과명 = B.학과명(+)
GROUP BY A.학과명
ORDER BY A.학과명


