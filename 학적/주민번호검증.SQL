--주민번호는 총 13자리인데, 앞의 12자리를 떼내어서
--첫 숫자부터 각각 2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5를 곱한다.
--그 수들을 모두 합한다음, 11로 나누어 그 나머지를 다시 11에서 뺀 수가
--마지막 자릿수(13번째)와 일치하면 주민등록번호가 정상이라 본다.
--하지만 마지막 수식 결과가 10이면 0을 취하고 11이면 1을 취한다.

SELECT HJ_HAKBUN 학번, HJ_kname 성명, HJ_jcode1 || '-' || HJ_jcode2 주민번호
FROM AC12011
WHERE
SUBSTR(hj_state,1,1) IN ('0', '1')
AND SUBSTR(HJ_jcode2, 7,1) - mod(11 - MOD(SUBSTR(HJ_jcode1,1,1) * 2 +
SUBSTR(HJ_jcode1,2,1) * 3 +
SUBSTR(HJ_jcode1,3,1) * 4 +
SUBSTR(HJ_jcode1,4,1) * 5 +
SUBSTR(HJ_jcode1,5,1) * 6 +
SUBSTR(HJ_jcode1,6,1) * 7 +
SUBSTR(HJ_jcode2,1,1) * 8 +
SUBSTR(HJ_jcode2,2,1) * 9 +
SUBSTR(HJ_jcode2,3,1) * 2 +
SUBSTR(HJ_jcode2,4,1) * 3 +
SUBSTR(HJ_jcode2,5,1) * 4 +
SUBSTR(HJ_jcode2,6,1) * 5, 11) + DECODE(SUBSTR(HJ_jcode2,1,1), '5', 2, '6', 2, 0),10) <> 0
