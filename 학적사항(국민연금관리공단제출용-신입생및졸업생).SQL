select hj_jcode1 || hj_jcode2 주민등록번호, hj_iymd 입학일자, '2' 학업년수,
hj_jymd 졸업일자,
decode(hj_hshptel, null,
LPAD(TRIM(SUBSTR(hj_hsghtel, 1, 4)), 4, '0') || '-' || LPAD(TRIM(SUBSTR(hj_hsghtel, 5,4)), 4, '0') || '-' || SUBSTR(hj_hsghtel, 9, 4),
LPAD(TRIM(SUBSTR(hj_hshptel, 1, 3)), 4, '0') || '-' || LPAD(TRIM(SUBSTR(hj_hshptel, 4,4)), 4, '0') || '-' || SUBSTR(hj_hshptel, 8, 4)
) 전화번호
from psutis.ac12011
where SUBSTR(hj_iymd,1,4) = :학년도
OR hj_jymd > :학년도-1 || '08'

