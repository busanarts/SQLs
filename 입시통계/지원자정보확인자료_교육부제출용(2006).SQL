select  distinct '71083000' 대학코드, hg_ghcode 모집단위,  
decode(iw_chasu, '91', 'G', '92', 'H', '93', 'H', '01', 'I', '02', 'I', '03', 'J') 모집시기구분, 
decode(iw_result, 
	'1', decode(iw_dungrok, '1', '1', '2', '3', '0', '3', '4', '4', '3') ,
	'2', decode(iw_dungrok, '1', '2', '2', '5', '0', '5', '4', '6', '5'), 
	'3', '9')  지원결과, iw_kname 성명, iw_jcode1 || iw_jcode2 주민번호, hg_jygubun 주야구분, 
decode(substr(iw_jhgubun,1,1), '5', '2', '1') 정원내외구분, 
decode(iw_jhgubun, 	'31', '21', 
		           	'33', '22',
		           	'34', '23', 
		           	'39', '25',
		           	'53', '26',
		           	'54', '28',
		           	'51', '29',
		           	'52', '29',
			'  ' )  특수사항, 
(case when iw_jhgubun in ('51', '52') then '9999999901' 
	when iw_jhgubun not in ('51', '52') then neis학교코드 
end) 출신고교코드, iw_ggjyear 졸업년도, 
(case when iw_chasu = '91' and 납입일자 >= '2005-09-05' and 납입일자 <= '2005-09-06' then '11'
	when iw_chasu = '91' and 납입일자 >= '2005-09-07' then '12'
	when iw_chasu in ('92', '93') and 납입일자 <= '2005-12-23' then '13'
	when iw_chasu in ('92', '93') and 납입일자 >= '2005-12-24' then '14'
	when iw_chasu in ('01', '02') and 납입일자 <= '2006-02-28' then '20'
	when iw_chasu in ('01', '02') and 납입일자 >= '2006-03-01' then '21'
	when iw_chasu = '03' and 납입일자 >= '2006-03-01' and 납입일자 <= '2006-03-10' then '22'
	when iw_chasu = '03' and 납입일자 >= '2006-03-11' then '23'
end) 등록일자구분 --, 납입일자
from ipsi201, ipsi104, 고등학교코드, tmp신입생등록화일
where iw_year = '2006' 
and iw_jwhgcode1 = hg_code
and iw_ggcode = neis학교코드(+)
and iw_jwhgcode1 = 학과코드(+) and iw_kname = 성명(+)
--and iw_dungrok = '1'
--and (환불일자 is null or 환불일자 < '2006-03')
--order by iw_result