INSERT INTO tm�λ�
SELECT is_id, SUBSTR(is_kname,1,1), SUBSTR(is_kname,2,7), is_jumin1 || '-' || is_jumin2,
is_hptel, is_hmtel, is_hucode1 || '-' || is_hucode2, '', is_hjuso, is_email,
is_gmstate, is_sosok, is_jikchk, is_jiknung, is_jikgub, is_hobong, usr_todate(is_imyong), usr_todate(is_taejik)
FROM psutis.ac22011
WHERE is_id NOT IN (SELECT �������ڵ� FROM tm�λ�)
AND is_kname IS NOT null
