SELECT hg_name, iw_kname 성명, iw_shno 수험번호, si_hakbun 학번,
DECODE(SUBSTR(IW_CHASU,1,1), '9', '수시', '정시') || SUBSTR(IW_CHASU,2,1) || '차' 차수,
DECODE(SUBSTR(iw_jhgubun,1,1), '2', '일반전형', '3', '특별전형', '5', '정원외') 전형구분,
DECODE(iw_result, '1', '합격', '5', '충원합격', '4', '합격포기', '0', '불합격', '2', '예비합격', '3', '면접불찰') 합격구분,
DECODE(state, '77', '완납', '22', '부분납', '33', '납부유예', '55', '승계', '88',
DECODE(rcvamt, 0, '환불', '완납'), '11', '', state) 납부구분, sc_name 실기종목, si_ban 반
FROM ipsi.IPSI201, ciss.TDFEEGOJI g, ipsi.ipsi104, ipsi.ipsi401, ipsi.ipsi109
WHERE iw_year = :입시연도
--AND iw_result IN( '1', '5')
AND g.schoolyear(+) = iw_year
AND g.hakbun(+) = iw_shno
AND g.studentgbn(+) <> '30304000'
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year
AND iw_year = si_year(+)
--AND iw_chasu = si_chasu(+)
AND iw_shno = si_shno(+)
AND iw_sgcode = sc_code(+)
--AND iw_jwhgcode1 = '01'
ORDER BY hg_name, DECODE(SUBSTR(iw_jhgubun,1,1), '2', '일반전형', '3', '특별전형', '5', '정원외')

