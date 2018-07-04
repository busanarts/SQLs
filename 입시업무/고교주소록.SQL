select distinct 학교코드, 학교명, 우편번호, 주소
from ipsi.ipsi201, ipsi.tbl고등학교
where iw_year = '2007' and iw_result = '1'
and iw_ggcode = 학교코드 
and not (학교명 like '%검정%')
--and 주소 is not null
