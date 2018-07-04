select 학과명, hj_haknyun 학년, hj_hakbun 학번, hj_kname 성명,
decode(hc_scode, '51', '복학', '52', '재입학', '53', '편입학', '61', '유급') 변동사유, hc_siymd 변동일자
from psutis.ac12011, psutis.ac1121, psutis.tbl학과, psutis.ac1202
where hj_hakbun = hc_hakbun
and hj_hgcode = hg_code and hg_mcode = 학과코드
and hc_year = :학년도 and hc_hakgi = :학기
AND hj_state = '01'
and hc_scode  in ('61')
--UNION
--select 학과명, hj_haknyun 학년, hj_hakbun 학번, hj_kname 성명,
--decode(hc_scode, '51', '복학', '52', '재입학', '53', '편입학', '61', '유급') 변동사유, hc_siymd 변동일자
--from ac12011, ac1121, tbl학과, ac1202
--where hj_hakbun = hc_hakbun
--and hj_hgcode = hg_code and hg_mcode = 학과코드
--and hc_year = :학년도 and hc_hakgi = :학기
--and hc_scode  in ('51', '52', '53', '61')