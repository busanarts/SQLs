select hj_hgcode, hg_kname || decode(hg_juya, '1', '', '(��)') �а���, 
hj_hakbun, hj_kname, hj_jcode1 || '-' ||hj_jcode2  �ֹι�ȣ,
sum(sj_hjum) �������
from ac12011, ac1121, ac1401 
where hj_state = '01' 
and hj_hgcode = hg_code
and hj_hakbun = sj_hakbun
and sj_dunggub <> 'F'
group by hj_hgcode, hg_kname, hg_juya, hj_hakbun, hj_kname, hj_jcode1, hj_jcode2
having sum(sj_hjum) >= 80
