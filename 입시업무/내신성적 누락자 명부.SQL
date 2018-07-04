select sj_jsno, iw_jcode1, iw_jcode2, iw_kname, hg_name, iw_jhgubun, iw_ggjyear, sj_nshjum, iw_ggname from ipsi202, ipsi201, ipsi104, ipsi301
where sj_year = &NowYear --and iw_chasu = '91'
and iw_jwhgcode1 in ('03', '04', '05', '06', '07', '08', '09' )
and sj_year = iw_year and sj_chasu = iw_chasu and sj_jsno = iw_shno
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year
and iw_ggjyear > '2006' and (iw_jhgubun < '50' or iw_jhgubun = '53') and iw_jhgubun <> '23' and iw_jhgubun <> '34' and sj_nshjum = 0
and iw_jcode1 = rd_jcode1(+) and iw_jcode1 = rd_jcode2(+)
