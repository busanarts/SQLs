--update TDFEEGOJI A SET fromdt = '20120820', todt = '20120825'
SELECT �а���, lvl �г�, hakbun �й�, �� || �̸� ����, �޴���ȭ, ����ȭ
FROM TDFEEGOJI, TM���� h, tm�а� d
WHERE schoolyear = :�г⵵ AND semester = :�б�
AND hakbun NOT IN (SELECT hakbun FROM TDFEERECEIVE WHERE schoolyear = :�г⵵ AND semester = :�б�) --WHERE receivedt <> '00000000')
AND hakbun = �й�
AND h.�а��ڵ� = d.�а��ڵ�
AND �������� = '01'
ORDER BY �а���, lvl, hakbun


