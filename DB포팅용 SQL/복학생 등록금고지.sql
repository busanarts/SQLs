INSERT INTO TDFEEGOJI (SCHOOLYEAR, SEMESTER, STUDENTGBN, HAKBUN, CLASS, LVL, ADMISSIONFEE, TUITION,
                                                ETCFEE, SCHOLARSHIP, PREFEE, STATE, DELAYREQDT, DELAYSAYU, DELAYGIGAN,
                                                BIGO, FROMDT, TODT, REMARK, BANKCD1, BANKCD2, BANKCD3, BANKCD4, WRITEUSER, WRITEDATE)
                                        SELECT :SCHOOLYEAR, :SEMESTER, :STUDENTGBN, A.�й� AS HAKBUN, A.�а��ڵ� AS CLASS, �г� AS LVL,
                                                C.ADMISSIONFEE, C.TUITION, C.ETCFEE, NVL(D.SCHOLARSHIP,0) AS SCHOLARSHIP,
                                                NVL(E.NABOO,0) AS PREFEE, '11' AS STATE, ' ', ' ', ' ', ' ',  B.FROMDT, B.TODT, B.REMARK,
                                                B.BANKCD1, B.BANKCD2, B.BANKCD3, B.BANKCD4, :WRITEUSER, SYSDATE
                                           FROM (SELECT G.*
                                                      FROM PSUTIS.AC1202 F,
                                                              TM���� G
                                                    WHERE F.HC_HAKBUN = G.�й�(+)
                                                       AND SUBSTR(HC_SCODE,1,1) = '5'
                                                       AND HC_SIYMD > DECODE(:SEMESTER, '1', :SCHOOLYEAR - 1 || '12', '2', :SCHOOLYEAR || '07')) A,
                                                TMFEEMAST B,
                                                TMFEEDTL  C,
                                                (SELECT HAKBUN, SUM(SCHOLARSHIP) as SCHOLARSHIP
                                                   FROM TDJANGHAK
                                                  WHERE SCHOOLYEAR = :SCHOOLYEAR
                                                    AND SEMESTER   = :SEMESTER
                                                    AND CONFIRM    = 'Y'
                                                  GROUP BY HAKBUN) D,

 (SELECT HAKBUN, FEE + ETCFEE AS NABOO
                                                   FROM TDFEERECEIVE
                                                  WHERE SCHOOLYEAR = :SCHOOLYEAR
                                                    AND SEMESTER   = :SEMESTER
                                                    AND STUDENTGBN = '30304000') E
                                          WHERE B.SCHOOLYEAR = :SCHOOLYEAR
                                             AND B.SEMESTER   = :SEMESTER
                                             AND B.JOBGBN     = '20'
                                             AND B.SEQNO      = C.SEQNO
                                             AND A.�а��ڵ�   = C.CLASS
                                             AND A.�г�       = C.LVL
                                             AND A.�й�       = D.HAKBUN(+)
                                             AND A.�й�       = E.HAKBUN(+)
