select 학과명, max(decode(학년, '1', 인원, 0)) "1학년", max(decode(학년, '2', 인원, 0)) "2학년"
from (
select hc_haknyun 학년, 학과명, count(*) 인원
from psutis.ac1202 a, psutis.ac12011, psutis.ac1121, psutis.tbl학과, psutis.ac1104
where substr(hj_state,1,1)  = '1'
and hc_hakbun = hj_hakbun
and hc_year = &sYear and hc_hakgi = &sHakgi
and hj_hgcode = hg_code and hg_mcode = 학과코드
and hj_state = hb_code
and (hc_hakbun, hc_siymd) in
(select hc_hakbun, max(hc_siymd) from psutis.ac1202
where hc_hakbun = a.hc_hakbun
group by hc_hakbun)
group by cube(hc_haknyun, 학과명))
group by 학과명
ORDER BY 학과명