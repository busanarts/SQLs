select hj_kname 성명, hj_jcode1 || '-' || hj_jcode2 주민번호, hc_siymd 복학일자
from ac12011, ac1202
where hj_hakbun = hc_hakbun
and hj_state = '01' and hj_sexgbn = '1'
and substr(hc_scode,1,1) = '5'
and hc_siymd > '20040101'