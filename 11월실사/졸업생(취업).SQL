SELECT
           학과명,
           HJ_HAKBUN 학번,
           HJ_KNAME 성명,
           HJ_JCODE1 || '-' || hj_jcode2 주민번호,
           DECODE(hj_state, '81', '전기졸업', '후기졸업') 졸업구분,
           substr(HJ_JYMD,1,6) 졸업년월
From AC12011, AC1121, tbl학과
Where HJ_HGCODE = HG_CODE AND hg_mcode = 학과코드
and HJ_JYMD > '200508' AND hj_jymd < '200605'
ORDER BY 학과명, 성명