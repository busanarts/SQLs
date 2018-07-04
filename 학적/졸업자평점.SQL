select hg_kname 학과명, hj_hakbun, hj_kname 성명, hj_jcode1 || '-' ||hj_jcode2  주민번호,
ROUND(sum(sj_hjum * sj_pjum) / sum(sj_hjum),2) 평점평균,
ROUND(SUM(sj_jumsu * sj_hjum) / SUM(sj_hjum),2) 백분율
from ac12011, ac1121, ac1401
where SUBSTR(hj_state,1,1) = '8' and hj_jymd >= :학년도 || '08'
and hj_hgcode = hg_code
and hj_hakbun = sj_hakbun
--and sj_dunggub <> 'F'
and sj_dunggub <> 'P'
group by hj_hgcode, hg_kname, hg_juya, hj_hakbun, hj_kname, hj_jcode1, hj_jcode2
