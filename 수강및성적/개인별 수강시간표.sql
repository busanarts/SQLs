SELECT DECODE(�ð�ǥ.TM_WEEK, '1', '�����Ǳ�', '2', '��', '3', 'ȭ', '4', '��', '5', '��', '6', '��', '7', '��') ����,
       �ð�ǥ.tm_time ����,
       �ð�ǥ.TM_KRKRROOM ���ǽ�,
       ���ǽ�.RROOMNAME ���ǽǸ�,
       �ð�ǥ.TM_GMCODE �����ڵ�,
       psutis.F_GWAMOKNM(�ð�ǥ.TM_GMCODE) AS �����,
       �ð�ǥ.TM_PFCODE �����ڵ�,
       ����.IS_KNAME ������
  FROM psutis.TDCOURSE ����,
       psutis.TMTIMESCHEDULE �ð�ǥ,
       psutis.TMROOM ���ǽ�,
       psutis.AC22011 ����
 WHERE ����.SCHOOLYEAR = �ð�ǥ.TM_YEAR
       AND ����.SEMESTER = �ð�ǥ.TM_HAKGI
       --AND ����.LVL = �ð�ǥ.TM_HAKNYUN
       AND ����.BANGBN = �ð�ǥ.TM_BAN
       AND ����.GMCODE = �ð�ǥ.TM_GMCODE
       AND ����.HAKBUN = :HAKBUN
       AND �ð�ǥ.TM_KRKRROOM = ���ǽ�.RROOM(+)
       AND �ð�ǥ.TM_PFCODE = ����.IS_ID (+)
ORDER BY �ð�ǥ.TM_WEEK,
       �ð�ǥ.TM_TIME