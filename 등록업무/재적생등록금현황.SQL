select 학과명, 학번, 성명, 학년, 학적상태,
max(decode(학년학기, '11', 납입일자, '')) "1학년 1학기",
max(decode(학년학기, '11', 납입금액, '')) "1-1 납입금액",
max(decode(학년학기, '11', 미납금액, '')) "1-1 미납금액",
max(decode(학년학기, '11', 비고, '')) "1-1 비고",
max(decode(학년학기, '12', 납입일자, '')) "1학년 2학기",
max(decode(학년학기, '12', 납입금액, '')) "1-2 납입금액",
max(decode(학년학기, '12', 미납금액, '')) "1-2 미납금액",
max(decode(학년학기, '12', 비고, '')) "1-2 비고",
max(decode(학년학기, '21', 납입일자, '')) "2학년 1학기",
max(decode(학년학기, '21', 납입금액, '')) "2-1 납입금액",
max(decode(학년학기, '21', 미납금액, '')) "2-1 미납금액",
max(decode(학년학기, '21', 비고, '')) "2-1 비고",
max(decode(학년학기, '22', 납입일자, '')) "2학년 2학기",
max(decode(학년학기, '22', 납입금액, '')) "2-2 납입금액",
max(decode(학년학기, '22', 미납금액, '')) "2-2 미납금액",
max(decode(학년학기, '22', 비고, '')) "2-2 비고"
from (
	select 학과명, hj_hakbun 학번, hj_kname 성명, hj_haknyun 학년, hb_name 학적상태,
	dd_haknyun || dd_hakgi 학년학기, dd_nidate 납입일자 , dd_nipgum 납입금액, dd_modgum 미납금액, dd_bigo 비고
	from psutis.ac12011, psutis.ac2711, psutis.ac1104, psutis.ac1121, psutis.tbl학과
	where hj_state not in ( '81', '83', '21', '22', '23', '24')
	--and hj_haknyun = '2' and hj_state = '01' and dd_nidate is null
	and hj_state = hb_code
	and hj_hgcode = hg_code and hg_mcode = 학과코드
	and hj_hakbun = dd_hakbun
)
group by 학과명, 학번, 성명, 학년, 학적상태 --having count(*) < (hj_haknyun * 2 - 1)
order by 학과명, 학번