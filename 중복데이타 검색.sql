SELECT a.*
  FROM TDPAYRECEIVE a
 WHERE A.ROWID IN
       (SELECT s.rid
         FROM
              (SELECT S.ROWID AS rid,
                     ROW_NUMBER() OVER (PARTITION BY s.hakbun ORDER BY S.ROWID desc) AS rn
                FROM TDPAYRECEIVE s
               WHERE schoolyear = '2015'
              ) s
        WHERE s.rn > 1
       )
and schoolyear = '2015'