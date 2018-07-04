select substr(is_sosok,2,2) 소속코드, hg_kname 학과명, is_kname 성명, is_id 계정, is_jumin1 || '-' || '*******' 주민등록번호
from psutis.ac22011, psutis.ac1121
where is_gmstate = '1' and is_taejik is null and substr(is_id,5,1) <> '1' and substr(is_sosok,2,2) = hg_code
order by substr(is_sosok,2,2), is_kname, is_id