// *** 재학생중 최종학적변동이 유급, 복학, 재입학, 전과, 편입학인 학생수 ***
select 학과명, decode(주야구분, '주', '주', '야', '야', '주야') 주야구분, decode(학년, '1', '1', '2', '2', '계') 학년,
max(decode(학적변동, '61', cnt, 0)) 유급,
max(decode(학적변동, '51', cnt, 0)) 복학,
max(decode(학적변동, '52', cnt, 0)) 재입학,
max(decode(학적변동, '31', cnt, 0)) 전과,
max(decode(학적변동, '53', cnt, 0)) 편입학,
max(decode(학적변동, '61', cnt, 0)) + 
max(decode(학적변동, '51', cnt, 0)) +
max(decode(학적변동, '52', cnt, 0)) +
max(decode(학적변동, '31', cnt, 0)) +
max(decode(학적변동, '53', cnt, 0)) 계
from 
(
	select 학과명, 주야구분, hj_haknyun 학년, hc_scode 학적변동, count(*) cnt  from ac12011, (
		select hc_hakbun, hc_scode, hc_siymd from ac1202 a1 
		where (hc_hakbun, hc_siymd) in (select hc_hakbun, max(hc_siymd) from ac1202 
		where hc_hakbun = a1.hc_hakbun
		group by hc_hakbun) 
	), ac1121, tbl학과
	where hj_state = '01' -- 재학
	--and hj_jhgbn < '51' -- 정원내
	and hj_jhgbn >= '51' -- 정원외
	and hj_hakbun = hc_hakbun
	and hj_hgcode = hg_code and hg_mcode = 학과코드
	group by 학과명, 주야구분, hj_haknyun, hc_scode
)
group by 학과명, 주야구분, 학년