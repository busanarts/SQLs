select hg_code 학과코드, hg_kname || decode(hg_juya, '1', '', '(야)') 학과명, hj_hakbun 학번, hj_kname 성명,
hj_jcode1 || '-' ||hj_jcode2  주민등록번호, sum(sj_hjum) 취득학점,
round(sum(sj_hjum * sj_pjum) / sum(decode(sj_pjum, 'P', 0, sj_hjum)),2) 평점평균, '                                ' 비고
from ac12011, ac1121, ac1401
where hj_state = '81' and substr(hj_jymd,1,4) = :연도 and hj_hakbun = sj_hakbun
and hj_hgcode = hg_code and sj_dunggub not in ('F')
group by hg_code, hg_kname, hg_juya, hj_hakbun, hj_kname, hj_jcode1, hj_jcode2

