UPDATE tm학적 s
       SET 지번주소 =
       (SELECT iw_addr1
         FROM ipsi.ipsi201_임시 b
        WHERE s.학번 = b.iw_shno
       ),
       상세주소 =
       (SELECT iw_addr2
         FROM ipsi.ipsi201_임시 b
        WHERE s.학번 = b.iw_shno
       )
 WHERE 학적상태 = '00'
       AND 학번 IN
       (SELECT b.iw_shno
         FROM tm학적 a,
              ipsi.ipsi201_임시 b
        WHERE 학적상태 = '00'
              AND a.학번 = b.iw_shno
              AND a.지번주소 || a.상세주소 <> b.iw_addr1 || b.iw_addr2
       )