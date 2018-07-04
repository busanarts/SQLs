select * from ac1401
where sj_year = '2011'
and sj_hakgi = '1'
and sj_gghgcode  not in (select hg_code from ac1121, tbl학과
where hg_mcode = 학과코드 and 운영여부 = '1')