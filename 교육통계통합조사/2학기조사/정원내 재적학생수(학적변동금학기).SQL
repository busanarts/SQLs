-- *** 재학생중 최종학적변동이 유급, 복학, 재입학, 전과, 편입학인 학생수 ***
SELECT 학과명,
MAX(NVL(DECODE(학년, '1', DECODE(학적변동, '61', CNT, 0)), 0)) "1학년 유급",
MAX(NVL(DECODE(학년, '1', DECODE(학적변동, '51', CNT, 0)), 0)) "1학년 복학",
MAX(NVL(DECODE(학년, '1', DECODE(학적변동, '52', CNT, 0)), 0)) "1학년 재입학",
MAX(NVL(DECODE(학년, '1', DECODE(학적변동, '31', CNT, 0)), 0)) "1학년 전과",
MAX(NVL(DECODE(학년, '1', DECODE(학적변동, '53', CNT, 0)), 0)) "1학년 편입학",
MAX(NVL(DECODE(학년, '2', DECODE(학적변동, '61', CNT, 0)), 0)) "2학년 유급",
MAX(NVL(DECODE(학년, '2', DECODE(학적변동, '51', CNT, 0)), 0)) "2학년 복학",
MAX(NVL(DECODE(학년, '2', DECODE(학적변동, '52', CNT, 0)), 0)) "2학년 재입학",
MAX(NVL(DECODE(학년, '2', DECODE(학적변동, '31', CNT, 0)), 0)) "2학년 전과",
MAX(NVL(DECODE(학년, '2', DECODE(학적변동, '53', CNT, 0)), 0)) "2학년 편입학"
FROM
(
	SELECT 학과명, HJ_HAKNYUN 학년, HC_SCODE 학적변동, COUNT(*) CNT  FROM AC12011, (
		SELECT HC_HAKBUN, HC_SCODE, HC_SIYMD FROM AC1202 A1
		WHERE (HC_HAKBUN, HC_SIYMD) IN (SELECT HC_HAKBUN, MAX(HC_SIYMD) FROM AC1202
		--WHERE HC_HAKBUN = A1.HC_HAKBUN AND HC_SIYMD >= 20071001 AND HC_SIYMD <= 20080331
        WHERE HC_HAKBUN = A1.HC_HAKBUN AND HC_SIYMD >= &NowYear || '0401' AND HC_SIYMD <= &NowYear || '0931'
		GROUP BY HC_HAKBUN)
	), AC1121, TBL학과
	WHERE HJ_STATE = '01' -- 재학
    AND HJ_JHGBN < '50'
	AND HJ_HAKBUN = HC_HAKBUN
	AND HJ_HGCODE = HG_CODE AND HG_MCODE = 학과코드
	GROUP BY 학과명, HJ_HAKNYUN, HC_SCODE
)
GROUP BY 학과명