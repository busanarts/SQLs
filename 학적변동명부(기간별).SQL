select ROWNUM 연번, 학과명, hj_hakbun 학번, hj_kname 성명, hj_haknyun 학년,
hj_jcode1 || '-' || SUBSTR(hj_jcode2,1,1) || '******' 주민번호,
USR_TODATE(hc_siymd) 학적변동일자, hb_name 변동사유, '' 비고
from psutis.ac12011, psutis.ac1202, psutis.ac1104, psutis.ac1121, psutis.tbl학과
where hj_hakbun = hc_hakbun(+) and hc_scode = hb_code
and hj_hgcode = hg_code AND hg_mcode = 학과코드
--and hc_scode <> '61'
--and hc_scode in ('21', '22','51','11','24') -- 미등록미복학복학휴학자퇴
and hc_siymd >= :시작일자 AND hc_siymd <= :종료일자

