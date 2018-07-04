select hg_name 학과명, decode(iw_sexgubun, '1', '남', '2', '여') 성별,
	max(decode(age, '15이하', cnt, 0)) 연령15이하,
	max(decode(age, '16', cnt, 0))  연령16,
	max(decode(age, '17', cnt, 0))  연령17,
	max(decode(age, '18', cnt, 0))  연령18,
	max(decode(age, '19', cnt, 0))  연령19,
	max(decode(age, '20', cnt, 0))  연령20,
	max(decode(age, '21', cnt, 0))  연령21,
	max(decode(age, '22', cnt, 0))  연령22,
	max(decode(age, '23', cnt, 0))  연령23,
	max(decode(age, '24', cnt, 0))  연령24,
	max(decode(age, '25', cnt, 0))  연령25,
	max(decode(age, '26', cnt, 0))  연령26,
	max(decode(age, '27', cnt, 0))  연령27,
	max(decode(age, '28', cnt, 0))  연령28,
	max(decode(age, '29', cnt, 0))  연령29,
	max(decode(age, '30-34', cnt, 0))  연령30_34,
	max(decode(age, '35-39', cnt, 0))  연령35_39,
	max(decode(age, '40이상', cnt, 0))  연령40이상
from (
	select iw_jwhgcode1, iw_sexgubun, '15이하' age, count(*) cnt
	from ipsi201
	where iw_year = '2006' and iw_dungrok = '1'
	and iw_jcode1 > substr((2006 - 15 - 1), 3,2) || '0301' 
	group by iw_jwhgcode1, iw_sexgubun
	union
	select iw_jwhgcode1, iw_sexgubun, 
	to_char(trunc(months_between(to_date('20060301','YYMMDD'), to_date('19' || iw_jcode1,'YYMMDD'))/12)) age, count(*) cnt
	from ipsi201 
	where iw_year = '2006' and iw_dungrok = '1'
	group by iw_jwhgcode1, iw_sexgubun, 
	to_char(trunc(months_between(to_date('20060301','YYMMDD'), to_date('19' || iw_jcode1,'YYMMDD'))/12))
	union
	select iw_jwhgcode1, iw_sexgubun, '30-34' age, count(*) cnt
	from ipsi201 
	where iw_year = '2006' and iw_dungrok = '1'
	and iw_jcode1 < substr((2006 - 30), 3, 2) || '0301'
	and iw_jcode1 >= substr((2006 - 34-1), 3, 2) || '0301'
	group by iw_jwhgcode1, iw_sexgubun
	union
	select iw_jwhgcode1, iw_sexgubun, '35-39' age, count(*) cnt
	from ipsi201
	where iw_year = '2006' and iw_dungrok = '1'
	and iw_jcode1 < substr((2006 - 35), 3, 2) || '0301'
	and iw_jcode1 >= substr((2006 - 39-1), 3, 2) || '0301' 
	group by iw_jwhgcode1, iw_sexgubun
	union
	select iw_jwhgcode1, iw_sexgubun, '40이상' age, count(*) cnt
	from ipsi201
	where iw_year = '2006' and iw_dungrok = '1'
	and iw_jcode1 <= substr((2006 - 40), 3, 2) || '0301' 
	group by iw_jwhgcode1, iw_sexgubun
), ipsi104
where iw_jwhgcode1 = hg_code
group by hg_name, iw_sexgubun
