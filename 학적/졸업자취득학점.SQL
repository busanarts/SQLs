select hj_hgcode, hg_kname || decode(hg_juya, '1', '', '(야)') 학과명, 
hj_hakbun, hj_kname, hj_jcode1 || '-' ||hj_jcode2  주민번호,
sum(sj_hjum) 취득학점
from ac12011, ac1121, ac1401 
where hj_state = '01' 
and hj_hgcode = hg_code
and hj_hakbun = sj_hakbun
and sj_dunggub <> 'F'
group by hj_hgcode, hg_kname, hg_juya, hj_hakbun, hj_kname, hj_jcode1, hj_jcode2
having sum(sj_hjum) >= 80
