select  distinct '71083000' 대학코드, hg_ghcode 모집단위,  
decode(iw_chasu, '91', 'G', '92', 'H', '93', 'H', '01', 'I', '02', 'I', '03', 'J') 모집시기구분, 
decode(iw_result, 
	'1', decode(iw_dungrok, '1', '1', '2', '3', '0', '3', '4', '4', '3') ,
	'2', decode(iw_dungrok, '1', '2', '2', '5', '0', '5', '4', '6', '5'), 
	'3', '9')  지원결과, iw_kname 성명, iw_jcode1 || iw_jcode2 주민번호, hg_jygubun 주야구분, 
decode(substr(iw_jhgubun,1,1), '5', '2', '1') 정원내외구분, 
decode(iw_jhgubun, 	'31', '21', 
		           	'33', '21',
		           	'34', '21', 
		           	'39', '21',
		           	'51', '21',
		           	'52', '21',
		           	'53', '21',
		           	'54', '22',
			'  ' )  특수사항, 
(case when iw_jhgubun in ('51', '52') then '9999999901' 
	when iw_jhgubun not in ('51', '52') then neis학교코드 
end) 출신고교코드, iw_ggjyear 졸업년도, 
(case when iw_chasu = '91' and dd_nidate >= '20060904' and dd_nidate <= '20060905' then '11'
	when iw_chasu = '91' and dd_nidate >= '20060906' then '12'
	when iw_chasu in ('92', '93') and dd_nidate >= '20061218'  and dd_nidate <= '20061219' then '13'
	when iw_chasu in ('92', '93') and dd_nidate >= '20061220' then '14'
	when iw_chasu in ('01', '02') and dd_nidate <= '20070228' then '20'
	when iw_chasu in ('01', '02') and dd_nidate >= '20070301' then '21'
	when iw_chasu = '03' and dd_nidate >= '20070301' and dd_nidate <= '20070309' then '22'
	when iw_chasu = '03' and dd_nidate >= '20070310' then '23'
	else 'XX'
end) 등록일자구분 --, dd_nidate
from ipsi.ipsi201, ipsi.ipsi104, ipsi.고등학교코드, (select * from psutis.ac12011, psutis.ac2711
where hj_hakbun = dd_hakbun and dd_hakbun like 'A07%')
where iw_year = '2007' 
and iw_jwhgcode1 = hg_code
and iw_ggcode = neis학교코드(+)
--and iw_shno = 수험번호(+) and iw_kname = 성명(+)
and iw_jcode1 = hj_jcode1(+) and iw_jcode2 = hj_jcode2(+)


