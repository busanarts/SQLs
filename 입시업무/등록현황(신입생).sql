SELECT �а���, DECODE(SUBSTR(iw_jhgubun,1,1), '5', '������', '������') ��������,
COUNT(*) ����ο�
FROM ipsi.IPSI201, TDFEEGOJI, tm�а�
WHERE iw_year = :�Խÿ���
AND iw_result = '1'
AND iw_year = schoolyear
AND iw_shno = hakbun
AND state  NOT IN( '11', '88')
AND studentgbn <> '30304000'
AND CLASS = �а��ڵ�
GROUP BY CUBE(�а���, DECODE(SUBSTR(iw_jhgubun,1,1), '5', '������', '������'))
ORDER BY �а���