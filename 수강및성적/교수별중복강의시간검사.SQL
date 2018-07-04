select decode(a.tm_week, '2', '월', '3', '화', '4', '수', '5', '목', '6', '금', '7', '토') 요일, 
a.tm_time 시간, a.tm_pfcode 교수코드, is_kname 성명, a.tm_gmcode 과목코드, 
gm_kname 과목명, a.tm_ban 분반,
decode(a.tm_juya, '1', '주간','야간') 주야구분
from ac1304 a, ac1304 b, ac1302, ac22011
where a.tm_year = '2006' and a.tm_hakgi = '1' 
and a.rowid <> b.rowid 
and a.tm_year = b.tm_year and a.tm_hakgi = b.tm_hakgi
and a.tm_week = b.tm_week and a.tm_time = b.tm_time 
and a.tm_pfcode = b.tm_pfcode and a.tm_juya = b.tm_juya
and a.tm_gmcode = gm_code and a.tm_pfcode = is_id
order by a.tm_week, a.tm_time, is_kname, a.tm_gmcode
--group by tm_week, tm_time, tm_pfcode, is_kname--, tm_gmcode, gm_kname
--having count(*) > 1
