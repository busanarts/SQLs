select hg_name 학과명, iw_SHno 수험번호,
iw_kname 성명, jg_name 전형명,
sc_name 실기명, SG_DATE 실기일자, SG_TIME 시작시간, SG_GOSAJANG 고사장
from ipsi201, ipsi104, ipsi108, ipsi109, IPSI303
where iw_year = :입시연도 and iw_chasu = :차수
and iw_sgcode is not NULL
AND IW_YEAR = HG_YEAR and iw_jwhgcode1 = hg_code  -- 해당학년도 학과매칭
and iw_jhgubun = jg_code                          -- 전형구분
and iw_sgcode = sc_code                           -- 실기종목 매칭
AND IW_YEAR = SG_YEAR AND IW_CHASU = SG_CHASU     -- 실기점수테이블과 매칭
AND IW_JSNO = SG_SHNO
order by iw_jwhgcode1, sc_name, iw_shno