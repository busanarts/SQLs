select  distinct '71083000' 대학코드, hg_ghcode 모집단위, iw_chasu, 
-- decode(iw_chasu, '91', 'G', '92', 'H', '93', 'H', '01', 'I', '02', 'I', '03', 'I', '04', 'J') 전형구분, 
decode(iw_result, 
	'1', decode(iw_dungrok, '1', '1', '2', '3', '0', '3', '4', '4', '3') ,
	'2', decode(iw_dungrok, '1', '2', '2', '5', '0', '5', '4', '6', '5'), 
	'3', '9')  등록결과, iw_kname 성명, iw_jcode1 || iw_jcode2 주민번호, hg_jygubun 주야구분, 
decode(substr(iw_jhgubun,1,1), '5', '2', '1') 정원내외구분, 
decode(iw_jhgubun, 	'31', '11', 
		           	'33', '12',
		           	'34', '13', 
		           	'35', '15 ',
			'37', '15',
			'38', '15',
		           	'39', '15',
			'3A', '15',
		           	'53', '16',
		           	'54', '18',
		           	'51', '19',
		           	'52', '19',
			'  ' )  특수사항, neis학교코드 출신고코드, iw_ggjyear 졸업년도
from ipsi201, ipsi104, 고등학교코드
where iw_year = '2005' 
and iw_jwhgcode1 = hg_code
and iw_ggcode = neis학교코드(+) --and trim(iw_ggname) = trim(neis학교명(+))
and iw_jwhgcode1 <> '99'
order by iw_chasu