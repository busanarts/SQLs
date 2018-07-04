SELECT 'A000003810' 대학코드, '02' 시도, '07' 시군구, DECODE(IW_JWHGCODE1, '07', '01', '09', '01', '04') 계열코드, IW_JHGUBUN 전형구분,
	DECODE(IW_JHGUBUN,
	'21', '01', -- 일반전형
    '22', '  ', -- 공업계2+1, 일반고 위탁생
 	'23', '04', -- 검정고시 출신자
 	'31', '06', -- 동일계 학과출신자
 	'32', '05', -- 자격증 소지자
 	'33', '03', -- 예능특기자
 	'34', '02', -- 산업체근무자
 	'35', '04', -- 학원경영자
 	'37', '04', -- 국가유공자 및 자손
    '38', '04', -- 선.효행상 수상자
    '39', '  ', -- 학과별 추가범위
     '3A', '04', -- 전업주부 및 만학도
     '51', '18', -- 대졸 이상
     '52', '18', -- 전문대졸 이상
     '53', '13', -- 농어촌학생
     '54', '10', -- 재외국민
    '55', '17', -- 만학도 및 성인재직자
    '56', '19' -- 기초생활수급자
) 전형유형,
DECODE(IW_JHGUBUN,
    '21', '001',
    '22', '   ',
    '23', '024',
    '31', '001',
    '32', '001',
    '33', '  ',
    '34', '001',
    '35', '  ',
    '37', '001',
    '38', '003',
    '39', '   ',
    '3A', '022',
    '51', '001',
    '52', '001',
    '53', '001',
    '54', '002',
    '55', '001',
    '56', '001'
) 세부전형유형,
JG_FNAME 전형명, HG_NAME 모집단위명,
DECODE(SUBSTR(IW_CHASU,1,1), '9', 'A', '0', 'G') 모집시기구분, '0' || substr(iw_chasu,2,1) 모집차수,
IW_RESULT || IW_DUNGROK || SIGN(NVL(IW_RANK2,0)) 결과, DECODE(IW_RESULT || IW_DUNGROK || SIGN(NVL(iw_rank2, 0)),
    '110', '01', -- 최초합격최종등록
    '100', '03', -- 최초합격미등록
	'140', DECODE(SUBSTR(dr_drhbymd,5,4), '0301', '07', '0302', '07', '04'), -- 최초합격 등록후 포기
    '111', '02', -- 충원합격 최종등록
    '101', '05', -- 충원합격 미등록
    '141', DECODE(SUBSTR(dr_drhbymd,5,4), '0301', '07', '0302', '07', '06'), -- 충원합격 등록후 포기
    '09' ) 지원결과, IW_SHNO 수험번호,
     IW_KNAME 성명, IW_JCODE1 || IW_JCODE2 주민번호, '1' 주야구분,
     DECODE(SUBSTR(IW_JHGUBUN,1,1), '5', '2', '1') 정원내외구분,
    CASE
        WHEN IW_JHGUBUN = '51' THEN '9999999902'
        WHEN IW_JHGUBUN = '52' THEN '9999999901'
        ELSE IW_GGCODE
    END 출신고교코드, IW_GGJYEAR 졸업년도,
    --CASE
    --    WHEN SUBSTR(IW_CHASU,1,1) = '9' THEN
    --        CASE
    --            WHEN RCVDT >= '20101213' AND RCVDT <= '20101215' THEN '11'
    --            ELSE '00' --납부 미대상자 및 미납자
    --        END
    --    WHEN IW_CHASU IN ('01', '02', '03') THEN
    --        CASE
    --            WHEN DR_DRNIYMD >= '20101217' AND DR_DRNIYMD <= '20110228' THEN '18'
    --            ELSE '00' --납부 미대상자 및 미납자
    --        END
    --    END 등록일자구분,
    SI_HAKBUN 학번
FROM IPSI.IPSI201, IPSI.IPSI104, IPSI.IPSI108, IPSI.IPSI401, TDFEEGOJI
WHERE IW_YEAR = :입시연도 AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year AND IW_JHGUBUN = JG_CODE
    AND SI_YEAR = SCHOOLYEAR(+) AND SI_HAKBUN = HAKBUN(+)
    AND IW_YEAR = SI_YEAR AND IW_SHNO = SI_SHNO
ORDER BY SUBSTR(IW_CHASU,1,1) DESC, SUBSTR(IW_CHASU, 2,1), HG_NAME, 지원결과