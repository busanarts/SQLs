--update TDFEEGOJI A SET fromdt = '20120820', todt = '20120825'
SELECT 학과명, lvl 학년, hakbun 학번, 성 || 이름 성명, 휴대전화, 집전화
FROM TDFEEGOJI, TM학적 h, tm학과 d
WHERE schoolyear = :학년도 AND semester = :학기
AND hakbun NOT IN (SELECT hakbun FROM TDFEERECEIVE WHERE schoolyear = :학년도 AND semester = :학기) --WHERE receivedt <> '00000000')
AND hakbun = 학번
AND h.학과코드 = d.학과코드
AND 학적상태 = '01'
ORDER BY 학과명, lvl, hakbun


