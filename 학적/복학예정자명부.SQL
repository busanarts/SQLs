select 학과명, hc_haknyun 학년, hj_hakbun 학번, hj_kname 성명,
hb_name 변동사유,
--substr(hc_siymd, 1,4) || '.' || substr(hc_siymd, 5,2) || '.' || substr(hc_siymd, 7, 2) 학적변동일자,
USR_TODATE(HC_SIYMD) 학적변동일자,
--substr(hj_hsghtel,1,3) || '-' || substr(hj_hsghtel,4,4) || '-' || substr(hj_hsghtel,8,4) 자택전화,
USR_TOTELNO(HJ_HSGHTEL) 자택전화,
USR_TOTELNO(HJ_HSHPTEL) 휴대전화
from psutis.ac1202 a, psutis.ac12011, psutis.ac1121, psutis.tbl학과, psutis.ac1104
where substr(hj_state,1,1) in ('1', '6')
and hc_hakbun = hj_hakbun
and hc_year = :학년도 and hc_hakgi = :학기
and hj_hgcode = hg_code and hg_mcode = 학과코드
and hj_state = hb_code
and (hc_hakbun, hc_siymd) in
(select hc_hakbun, max(hc_siymd) from psutis.ac1202
where hc_hakbun = a.hc_hakbun and substr(hc_scode,1,1) = '1'
group by hc_hakbun)
order by 학과명, hj_haknyun, hj_hakbun
