update ipsi201 set iw_dungrok = '1'
where iw_year = &sYear
and iw_shno in (
Select iw_shno 수험번호
From  IPSI201, ipsi203
Where iw_year      = &sYear
and iw_year = dr_year and iw_shno = dr_shno
and (dr_drniymd is NOT NULL and dr_drhbymd is NULL AND IW_DUNGROK <> '1')) -- 등록자
;
update ipsi201 set iw_dungrok = '4'
where iw_year = &sYear
and iw_shno in (
Select iw_shno 수험번호
From  IPSI201, ipsi203
Where iw_year      = &sYear
and iw_year = dr_year and iw_shno = dr_shno
and (dr_drniymd IS NOT  NULL and dr_drhbymd is NOT NULL AND IW_DUNGROK <> '4')) -- 환불자