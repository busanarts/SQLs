update ac12011 set hj_craddr  = 
concat(concat((select up_addrorg from ac1107 where up_code1 = hj_crucode1 and up_code2 = hj_crucode2 and up_seq = '00') ,   ' '), hj_craddr)
where hj_iymd > '20030201' 
