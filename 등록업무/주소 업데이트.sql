UPDATE tm���� s
       SET �����ּ� =
       (SELECT iw_addr1
         FROM ipsi.ipsi201_�ӽ� b
        WHERE s.�й� = b.iw_shno
       ),
       ���ּ� =
       (SELECT iw_addr2
         FROM ipsi.ipsi201_�ӽ� b
        WHERE s.�й� = b.iw_shno
       )
 WHERE �������� = '00'
       AND �й� IN
       (SELECT b.iw_shno
         FROM tm���� a,
              ipsi.ipsi201_�ӽ� b
        WHERE �������� = '00'
              AND a.�й� = b.iw_shno
              AND a.�����ּ� || a.���ּ� <> b.iw_addr1 || b.iw_addr2
       )