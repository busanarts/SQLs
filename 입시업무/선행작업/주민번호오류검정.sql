--주민번호는 총 13자리인데, 앞의 12자리를 떼내어서
--첫 숫자부터 각각 2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5를 곱한다.
--그 수들을 모두 합한다음, 11로 나누어 그 나머지를 다시 11에서 뺀 수가
--마지막 자릿수(13번째)와 일치하면 주민등록번호가 정상이라 본다.
--하지만 마지막 수식 결과가 10이면 0을 취하고 11이면 1을 취한다.

SELECT iw_chasu 차수, iw_jsno 접수번호, iw_kname 성명, iw_jcode1 || '-' || iw_jcode2 주민번호,
SUBSTR(iw_jcode2, 7,1) - mod(11 - MOD(SUBSTR(iw_jcode1,1,1) * 2 +
SUBSTR(iw_jcode1,2,1) * 3 +
SUBSTR(iw_jcode1,3,1) * 4 +
SUBSTR(iw_jcode1,4,1) * 5 +
SUBSTR(iw_jcode1,5,1) * 6 +
SUBSTR(iw_jcode1,6,1) * 7 +
SUBSTR(iw_jcode2,1,1) * 8 +
SUBSTR(iw_jcode2,2,1) * 9 +
SUBSTR(iw_jcode2,3,1) * 2 +
SUBSTR(iw_jcode2,4,1) * 3 +
SUBSTR(iw_jcode2,5,1) * 4 +
SUBSTR(iw_jcode2,6,1) * 5, 11) + DECODE(SUBSTR(iw_jcode2,1,1), '5', 2, '6', 2, 0),10) 검증값,
iw_ggjyear 고교졸업년도, hg_name 지원학과, iw_jhgubun 전형구분, iw_sgcode 실기코드
FROM IPSI.IPSI201, ipsi.ipsi104
WHERE iw_year = :입시연도
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year
AND SUBSTR(iw_jcode2, 7,1) - mod(11 - MOD(SUBSTR(iw_jcode1,1,1) * 2 +
SUBSTR(iw_jcode1,2,1) * 3 +
SUBSTR(iw_jcode1,3,1) * 4 +
SUBSTR(iw_jcode1,4,1) * 5 +
SUBSTR(iw_jcode1,5,1) * 6 +
SUBSTR(iw_jcode1,6,1) * 7 +
SUBSTR(iw_jcode2,1,1) * 8 +
SUBSTR(iw_jcode2,2,1) * 9 +
SUBSTR(iw_jcode2,3,1) * 2 +
SUBSTR(iw_jcode2,4,1) * 3 +
SUBSTR(iw_jcode2,5,1) * 4 +
SUBSTR(iw_jcode2,6,1) * 5, 11) + DECODE(SUBSTR(iw_jcode2,1,1), '5', 2, '6', 2, 0),10) <> 0
