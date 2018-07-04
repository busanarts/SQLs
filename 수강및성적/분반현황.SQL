select 학과명, hj_haknyun 학년, hj_ban 반, count(*) 인원 from ac12011, ac1121, tbl학과
where hj_state = '01'
and hj_hgcode = hg_code and hg_mcode  = 학과코드
group by 학과명, hj_haknyun, hj_ban