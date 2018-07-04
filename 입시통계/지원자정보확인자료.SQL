select  '71083000' 대학코드, hg_ghcode 모집단위, decode(iw_chasu, '99', 'G', '01', 'H', '02', 'I') 전형구분, 
decode(iw_result, 
	'1', decode(iw_dungrok, '1', '1', '2', '3', '0', '3', '4', '4') ,
	'2', decode(iw_dungrok, '1', '2', '2', '5', '0', '5', '4', '6'), 
	'3', '7')  등록결과, iw_kname 성명, iw_jcode1 || iw_jcode2 주민번호, hg_jygubun 주야구분, 
decode(substr(iw_jhgubun,1,1), '5', '2', '1') 정원내외구분, 
decode(iw_jhgubun, 	'21', '  ', 
		           	'22', '17',
		           	'23', '  ', 
		           	'31', '  ',
		           	'32', '  ',
		           	'33', '14',
		           	'34', '11',
		           	'41', '19',
		           	'42', '19',
			'43', '19',
			'44', '19',
			'45', '19',
			'46', '19',
			'51', '18',
			'52', '18',
			'53', '12',
			'54', '15' )  특수사항, cs학교코드 출신고코드, iw_ggjyear 졸업년도 
from ipsi201, ipsi104, 고등학교코드
where iw_year = '2005' 
and iw_jwhgcode1 = hg_code
and iw_ggcode = neis학교코드(+) --and trim(iw_ggname) = trim(neis학교명(+))