-- psutis로 로그인해서 실행해야함
Select hg_name 지원학과, iw_shno 수험번호, iw_kname 성명, iw_jcode1 || '-' || SUBSTR(iw_jcode2,1,1) || '******' 주민번호,
--substr(iw_hdtel,1,3) || '-' ||  substr(iw_hdtel,4,4) || '-' ||  substr(iw_hdtel,8,4) 핸드폰,
USR_TOTELNO(iw_hdtel) 핸드폰,
iw_telno1 || '-' || iw_telno2 || '-' || iw_telno3 전화번호,
dr_hstotal 학생회비납부액, USR_TODATE(dr_drniymd) 납입일자 --, dr_dr_drhbymd 환불일자
From  ipsi.IPSI201, ipsi.ipsi104, ipsi.ipsi203
Where iw_year      = &sYear
and iw_year = dr_year and iw_shno = dr_shno
and dr_drniymd IS NOT null and dr_drhbymd IS NULL
AND dr_hsniymd IS NOT NULL AND dr_hshbymd IS NULL
--and iw_result = '1'
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year
order by hg_name, iw_shno
