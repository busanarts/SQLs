DELETE FROM ac1303
WHERE gg_year = :학년도
AND gg_hakgi = :학기;

INSERT INTO ac1303
SELECT  schoolyear, LVL, SEMESTER, HG_CODE, GMCODE, BANGBN, PROFID, gm_kname, '', '', SUBSTR(studygbn,7,2), '', gradejum, irtime, sstime, '', '1'
FROM TDCURRICULUM, ac1302, ac1121
WHERE schoolyear = :학년도 AND semester = :학기
AND gmcode = gm_code AND hg_code = SUBSTR(gmcode,1,2)
AND hgcode = hg_mcode;
--AND (schoolyear, semester, lvl, hg_code, gmcode) NOT IN (SELECT gg_year, gg_hakgi, gg_haknyun, gg_hgcode, gg_gmcode FROM ac1303, ac1121
--WHERE gg_year = schoolyear AND gg_hakgi = semester
--AND gg_hgcode = )