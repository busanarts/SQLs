SELECT janghakcd �����ڵ�, janghaknm ���и�, DECODE(janghakgbn, '10', '����', '20', '����', '30', '����') ���б���,
DECODE(scholarship1, '1', '����') �������б�, DECODE(scholarship2, '1', '����') �������б�, scholarship3 ��Ÿ���б�, bigo ���
FROM TMSCHOLARSHIP
WHERE useyn= 'Y'
ORDER BY janghaknm