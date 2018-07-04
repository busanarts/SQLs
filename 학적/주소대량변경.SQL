DECLARE
	CURSOR c1 IS
	select * from ac1107, ac12011 where up_code1 = hj_crucode1 and up_code2 = hj_crucode2
	where substr(hj_hakbun,1,3) = 'A02' ;
BEGIN
	FOR i IN c1 LOOP
		UPDATE ac12011 SET hj_craddr = i.up_addrorg + ' ' + hj_craddr 
		where substr(hj_hakbun,1,3) = 'A02' ;
	END LOOP;
END;