SELECT DISTINCT hj_hakbun 학번, hj_kname 성명,
USR_HJNAME(hj_state) 학적상태, USR_TODATE(USR_LCDATE(hj_hakbun)) 변동일자
FROM psutis.ac12011, psutis.ac1401
WHERE sj_year = '2011' AND sj_hakgi = '2'
AND sj_hakbun = hj_hakbun
AND hj_state <> '01'
AND sj_injung Is null