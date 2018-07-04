SELECT iw_chasu 차수, iw_jsno 접수번호, iw_kname 성명, iw_jcode1 || '-' || iw_jcode2 주민번호,
iw_jwhgcode1 지원학과, hg_name 학과명, iw_jhgubun 전형코드, jg_fname 전형구분,
iw_ggcode 고교코드, iw_ggname 고교명, iw_ggjyear 고교졸업년도, iw_ggjyear - ('19' || SUBSTR(iw_jcode1,1,2)) 졸업당시연령
FROM IPSI201, IPSI104, IPSI108
WHERE iw_year = :학년도
and iw_chasu = :차수
AND iw_jhgubun NOT IN ('51', '52', '54') -- 대졸, 전문대졸, 재외국민, 외국인 제외
AND SUBSTR(iw_ggcode,2,9) <> '120000000' -- 검정고시 제외
AND (iw_ggjyear < :학년도 - 5 OR iw_ggjyear > :학년도 OR iw_ggjyear IS NULL OR LENGTH(RTRIM(iw_ggjyear)) <> 4)
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year AND iw_jhgubun = jg_code