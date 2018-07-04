select hg_name, si_shno 수험번호, si_hakbun 학번, iw_kname 성명, iw_chasu 차수, sc_name 실기명,
admissionfee + tuition 등록금, scholarship 장학금, prefee 선납, rcvamt 수납금액, admissionfee + tuition + prefee - scholarship - rcvamt 차이,
DECODE(state, '77', '완납', '55', '분납', '') 납부구분,
rcvdt 최종수납일자, bigo 비고
from ipsi.ipsi104, ipsi.ipsi401, ipsi.ipsi201, IPSI.IPSI109, TDFEEGOJI
where iw_year = :입시연도
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year
AND si_year = iw_year
AND si_shno = iw_shno
AND iw_year = schoolyear
AND iw_shno = hakbun
AND studentgbn <> '30304000'
AND iw_sgcode = sc_code(+)
--AND iw_chasu = '50';





