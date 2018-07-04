--UPDATE  TDJANGHAK SET confirm = 'Y'
--SELECT * FROM TDJANGHAK
DELETE  FROM TDJANGHAK
WHERE schoolyear = '2015'
AND semester = '1'
AND confirm = 'N'
AND TO_CHAR(lastdate, 'YYYY-MM-DD') = TO_CHAR(SYSDATE, 'YYYY-MM-DD')
--AND writeuser IS null
--AND hakbun IN ( 'A1525051')
--AND janghakcd = '78'