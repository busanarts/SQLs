--INSERT INTO ipsi.ipsi401
Select :입시연도, hg_gycode, iw_shno, iw_kname, iw_jcode1, iw_jcode2, 'A', iw_jhgubun,
iw_ggcode, iw_ggname, iw_ggjyear, 0,0, hakbun, ''
--, iw_jwhgcode1, hg_name
From ipsi.ipsi201, ipsi.IPSI104, (SELECT si_hgcode, 'A' || TO_CHAR(TO_NUMBER(SUBSTR(MAX(si_hakbun),2))+1) hakbun
FROM IPSI.IPSI401, IPSI.IPSI104
WHERE si_year = :입시연도
--AND hg_code = iw_jwhgcode1
AND si_hgcode = hg_gycode
AND si_year = hg_year
GROUP BY si_hgcode
)
Where iw_year       = :입시연도
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year
--And iw_dungrok    = '1'
And iw_jwhgcode1  = hg_code
AND iw_year = hg_year
AND hg_gycode = si_hgcode
And iw_Shno       = :수험번호;
