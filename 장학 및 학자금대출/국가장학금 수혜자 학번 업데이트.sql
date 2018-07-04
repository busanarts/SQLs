UPDATE tm국가장학금수혜자
SET 학번 = (SELECT hj_hakbun FROM psutis.AC12011 WHERE hj_jcode1 || hj_jcode2 = 주민등록번호)