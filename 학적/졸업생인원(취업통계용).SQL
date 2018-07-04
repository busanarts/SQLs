SELECT 학년도, 졸업구분, 학과명, MAX(DECODE(성별, '1', 졸업인원, 0)) 남, MAX(DECODE(성별, '2', 졸업인원, 0)) 여,
MAX(DECODE(성별, '1', 졸업인원, 0)) + MAX(DECODE(성별, '2', 졸업인원, 0)) 계
FROM (
SELECT SUBSTR(hj_jymd, 1,4) 학년도, DECODE(hj_state, '81', '전기', '83', '후기') 졸업구분, HG_KNAME 학과명, HJ_SEXGBN 성별, COUNT(*) 졸업인원
From AC12011, AC1121
Where (HJ_HGCODE = HG_CODE )
and SUBSTR(HJ_JYMD,1,6) >= &연월
GROUP BY SUBSTR(hj_jymd,1,4), hj_state, hg_kname , hj_sexgbn)
GROUP BY 학년도, 졸업구분, 학과명
ORDER BY 학년도, 졸업구분, 학과명