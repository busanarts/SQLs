SELECT DISTINCT hj_hakbun �й�, hj_kname ����,
USR_HJNAME(hj_state) ��������, USR_TODATE(USR_LCDATE(hj_hakbun)) ��������
FROM psutis.ac12011, psutis.ac1401
WHERE sj_year = '2011' AND sj_hakgi = '2'
AND sj_hakbun = hj_hakbun
AND hj_state <> '01'
AND sj_injung Is null