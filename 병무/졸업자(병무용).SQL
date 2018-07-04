select ROWNUM 연번, hj_kname 성명,
hj_jcode1 || '-' || hj_jcode2 주민등록번호, hj_jymd 졸업일자, '' 비고
from psutis.ac12011,psutis.ac1121
where hj_wthgcode = hg_code and hj_jymd >= :졸업년도 and substr(hj_jcode2,1,1) = '1'
--order by