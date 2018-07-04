INSERT INTO TMVIRTUALNO (seqno, bank, accountno, hakbun)
SELECT (SELECT MAX(seqno) + 1 FROM TMVIRTUALNO),  '301003', MIN(가상계좌), :학번 FROM TM가상계좌
WHERE 학번 IS NULL AND 은행명 = '농협'
GROUP BY  '';
UPDATE tm가상계좌 a SET 학번 = :학번
WHERE 가상계좌 = (SELECT accountno FROM TMVIRTUALNO WHERE hakbun = :학번 AND bank = '301003');
INSERT INTO TMVIRTUALNO (seqno, bank, accountno, hakbun)
SELECT (SELECT MAX(seqno) + 1 FROM TMVIRTUALNO),  '301002', MIN(가상계좌), :학번 FROM TM가상계좌
WHERE 학번 IS NULL AND 은행명 = '부산은행'
GROUP BY  '';
UPDATE tm가상계좌 a SET 학번 = :학번
WHERE 가상계좌 = (SELECT accountno FROM TMVIRTUALNO WHERE hakbun = :학번 AND bank = '301002')
--SELECT * FROM tm가상계좌
--UPDATE tm가상계좌 a SET 학번 = (SELECT hakbun FROM TMVIRTUALNO b WHERE accountno = a.가상계좌)
--WHERE 학번 IS null

