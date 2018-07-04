SELECT hj_hakbun, hj_kname 성명, hj_jcode1 || '-' || hj_jcode2 주민번호, hj_craddr1 || ' ' || hj_craddr2 주소,
	hj_hshptel 연락처, usr_lcdate(hj_hakbun) 휴학일자, 'N' 복학여부
FROM ac12011
WHERE
--hj_hakbun < 'A06' AND
hj_state IN ( '12', '13')