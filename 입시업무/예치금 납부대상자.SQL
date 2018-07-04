select iw_chasu 차수, hg_name 지원학과, iw_shno 수험번호, iw_kname 성명,
iw_jcode1 || '-' || SUBSTR(iw_jcode2,1,1) 주민번호,
USR_TOTELNO(iw_hdtel) 휴대폰
FROM ipsi.ipsi201, ipsi.IPSI104 a, psutis.ac1121 b
where iw_year = :모집년도
and iw_result IN ( '1', '5')
AND iw_year = a.hg_year
and iw_jwhgcode1 = a.hg_code AND hg_gycode = b.hg_code
ORDER BY hg_name, iw_kname