SELECT �а���, �й�, �� || �̸� ����, �г�, ADMISSIONFEE ���б�, TUITION ������,
		   '' �����ڵ�1,
       '' ���б�1,
       '' �����ڵ�2,
       '' ���б�2,
       '' �����ڵ�3,
       '' ���б�3,
       '' �����ڵ�4,
       '' ���б�4
  FROM TM���� ����,
       TM�а� �а�,
       Tmfeemast mst,
       TMFEEDTL dtl
 WHERE �������� = '01'
       AND ����.�а��ڵ� = �а�.�а��ڵ�
       AND mst.SCHOOLYEAR = :�г⵵
       AND mst.SEMESTER = :�б�
       AND ����.�а��ڵ� = DTL.CLASS
       AND ����.�г� = DTL.LVL
       AND mst.SEQNO = DTL.SEQNO
ORDER BY ����.�а��ڵ�,
       �й� --AND mst_TOTGUM - mst_TGMGUM > 0