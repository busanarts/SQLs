UPDATE tm국가장학금수혜자
SET 학적상태 = f_hjstate(학번, :기준일자)
WHERE 학년도 = :수혜학년도 AND 학기 = :수혜학기