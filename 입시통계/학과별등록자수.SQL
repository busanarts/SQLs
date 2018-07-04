-- 정원외 미포함 등록자수
select iw_jwhgcode1 학과코드, hg_name 학과명, count(*) from ipsi201,ipsi104
where iw_year = '2002' and iw_dungrok = '1' and iw_jhburyu not in ('51','52','53') and iw_jwhgcode1 = hg_code
group by iw_jwhgcode1, hg_name