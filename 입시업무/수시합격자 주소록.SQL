select hg_name 학과명, jg_fname 전형구분, iw_shno 수험번호, 
decode(substr(iw_chasu,1,1), '9', '수시', '정시') 모집시기,
substr(iw_chasu,2,1) || '차' 차수, 
iw_kname 성명, iw_ucode1 || '-' || iw_ucode2 우편번호, iw_addr1 || ' ' || iw_addr2 주소
from ipsi201, ipsi104, ipsi108, tbl수시예치금파일
where iw_year = '2007'
and iw_result in ('1', '2')
and iw_rank1 <> 0
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year
and iw_jhgubun = jg_code
and iw_shno = 수험번호
