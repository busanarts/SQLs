UPDATE TMTEACHERLICENSE set lr_date = :발급일자
--SELECT * FROM TMTEACHERLICENSE
WHERE lr_result = 'Y'
--AND lr_date IS NULL
AND lr_year >= :발급년도

