INSERT INTO TMVIRTUALNO (seqno, bank, accountno, hakbun)
SELECT (SELECT MAX(seqno) + 1 FROM TMVIRTUALNO),  '301003', MIN(�������), :�й� FROM TM�������
WHERE �й� IS NULL AND ����� = '����'
GROUP BY  '';
UPDATE tm������� a SET �й� = :�й�
WHERE ������� = (SELECT accountno FROM TMVIRTUALNO WHERE hakbun = :�й� AND bank = '301003');
INSERT INTO TMVIRTUALNO (seqno, bank, accountno, hakbun)
SELECT (SELECT MAX(seqno) + 1 FROM TMVIRTUALNO),  '301002', MIN(�������), :�й� FROM TM�������
WHERE �й� IS NULL AND ����� = '�λ�����'
GROUP BY  '';
UPDATE tm������� a SET �й� = :�й�
WHERE ������� = (SELECT accountno FROM TMVIRTUALNO WHERE hakbun = :�й� AND bank = '301002')
--SELECT * FROM tm�������
--UPDATE tm������� a SET �й� = (SELECT hakbun FROM TMVIRTUALNO b WHERE accountno = a.�������)
--WHERE �й� IS null

