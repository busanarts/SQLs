select hj_hakbun 학번, hj_kname 성명, 
decode(substr(iw_chasu,1,1), '9', '수시', '정시') || substr(iw_chasu,2,1) || '차' 차수, 
decode(iw_result, '1', '합격', '2', '예비합격', '3', '불합격') 결과, 
decode(iw_dungrok, '1', '등록') 등록여부, 
dd_nidate 납입일자, dd_nidate1 최초납입, dd_nidate2
from ac12011, ac2711, ipsi.ipsi201
where hj_hakbun like 'A07%'
and hj_hakbun = dd_hakbun
and hj_shno = iw_shno
and iw_year = '2007'