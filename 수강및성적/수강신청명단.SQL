SELECT SJ_GGGMCODE 과목코드, GG_KNAME 과목명, 학과명, HJ_HAKBUN 학번, HJ_KNAME 성명, SJ_HAKNYUN 학년
FROM AC1401, AC12011, AC1303, AC1121, TBL학과
WHERE SJ_YEAR    = '2008'
      --AND GG_HAKNYUN = '1'
      AND SJ_HAKGI   = '1' AND GG_OPEN = '2'
      AND   SJ_YEAR        = GG_YEAR
      AND   SJ_HAKGI       = GG_HAKGI
      AND   SJ_HAKBUN      = HJ_HAKBUN
      AND HJ_HGCODE = HG_CODE AND HG_MCODE = 학과코드
      AND   SJ_GGHGCODE    = GG_HGCODE
      AND   SJ_GGGMCODE    = GG_GMCODE
      ORDER BY GG_KNAME, 학과명, HJ_HAKBUN