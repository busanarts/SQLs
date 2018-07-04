Select iw_chasu 차수, iw_shno 수험번호, iw_kname 성명,
iw_result 지원결과, iw_mjcheck 적격여부, dr_drniymd 등록일자, dr_drhbymd 환불일자
From  ipsi.IPSI201, ipsi.ipsi203
Where iw_year      = &sYear
and iw_year = dr_year and iw_shno = dr_shno
and ((dr_drniymd is NOT NULL and dr_drhbymd is NULL AND IW_DUNGROK <> '1') -- 등록자
or (dr_drniymd IS NOT  NULL and dr_drhbymd is NOT NULL AND IW_DUNGROK <> '4')) -- 환불자
--)
