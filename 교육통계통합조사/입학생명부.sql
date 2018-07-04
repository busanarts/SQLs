select hg_kname 학과, DECODE(SUBSTR(hj_jhgbn,1,1), '5', '정원외', '정원내') 전형구분, hj_hakbun 학번, hj_kname 성명,
DECODE(hj_SEXGBN, '1', '남', '2', '여') 성별,  age(hj_jcode1, :학년도 || '0301') 연령, USR_TODATE(HJ_JCODE1) 생년월일, USR_TODATE(HJ_IYMD) 입학일자,
USR_HJNAME(USR_LCSCODE(hj_hakbun)) 최종학적변동
from ac12011_20140401, ac1121
--where HJ_HAKBUN LIKE 'A14%' AND HJ_HAKNYUN = 1
where SUBSTR(HJ_IYMD,1,4) = :학년도 --HJ_HAKNYUN = 1
and hj_hgcode = hg_code
