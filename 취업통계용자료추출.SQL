select  '73148000' 학교코드, '1' 본분교, '118' 단과대학코드, '단과대구분없음' 단과대학명, ' ' 학부명, 교육부학과코드, 학과명, 학과명 학과소분류명, '1' 주야간구분,
hj_hakbun 학번, hj_kname 성명, hj_jcode1 || hj_jcode2 주민번호,
hj_crucode1 || '-' || hj_crucode2 우편번호,
hj_craddr1 || ' ' || hj_craddr2 집주소,
hj_hsghtel 집전화, decode(trim(hj_hshptel), null, hj_hsghtel, hj_hshptel) 핸드폰,
hj_email 이메일,
SUBSTR(hj_iymd,1,6) 입학년월,-- 24
substr(hj_jymd, 1,6) 졸업년월,-- 25
'' 편입여부, '2' 산업체위탁, -- 26
'' 고교지역, decode(hj_gghgname, null, '자료없음', hj_gghgname) 출신고교, hj_ggcode,
'2' 국가기술자격여부,-- 18
DECODE(lr_result, 'Y', '1', '2') 교직과정이수,
'2' 예비역여부,
'4' 해외연수,-- 1 = 교환학생, 2 = 산업체연수, 3 : 기타연수, 4 : 해당없음
'0' 토익점수-- 20
--decode(substr(hj_jcode2,1,1), '5', '1', '6', '1', '2') 외국인유학-- 19
FROM psutis.ac12011, psutis.ac1121, psutis.tbl학과, psutis.AC1511
where hj_jymd > :학년도 || :졸업월
--and hj_hakbun < '99'
and hj_hgcode = hg_code and hg_mcode = 학과코드
AND hj_hakbun = lr_hakbun(+)
order by 학과명, hj_hakbun