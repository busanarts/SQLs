INSERT INTO TDFEEGOJI_전년도합격자
SELECT a.* FROM TDFEEGOJI a, tm학적
WHERE a.schoolyear = :학년도
AND a.HAKBUN = 학번
AND 학적상태 = '00';
--DELETE FROM TDFEEGOJI
--WHERE a.schoolyear = :학년도
--AND a.HAKBUN IN (select 학번 FROM tm학적 where 학적상태 = '00');
INSERT INTO TDFEERECEIVE_전년도합격자
SELECT a.* FROM TDFEERECEIVE a, tm학적
WHERE a.schoolyear = :학년도
AND a.HAKBUN = 학번
AND 학적상태 = '00';
--INSERT INTO TM학적_전년도합격자
SELECT * FROM TM학적
WHERE 학적상태 = '00';