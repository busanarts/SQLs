Select hg_name 지원학과, COUNT(*)
From  IPSI201, ipsi104, ipsi203
Where iw_year      = '2010'
and iw_year = dr_year and iw_shno = dr_shno
and nvl(dr_drniymd, '00000000') <>  '00000000' and nvl(dr_drhbymd, '00000000') = '00000000'
--and iw_result = '1'
and iw_jwhgcode1 = hg_code
group by cube(hg_name)
