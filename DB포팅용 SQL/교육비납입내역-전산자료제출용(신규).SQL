select 주민등록번호, 성명,
max(decode(월, '01', 납입금액, '')) "1월",
max(decode(월, '02', 납입금액, '')) "2월",
max(decode(월, '03', 납입금액, '')) "3월",
max(decode(월, '04', 납입금액, '')) "4월",
max(decode(월, '05', 납입금액, '')) "5월",
max(decode(월, '06', 납입금액, '')) "6월",
max(decode(월, '07', 납입금액, '')) "7월",
max(decode(월, '08', 납입금액, '')) "8월",
max(decode(월, '09', 납입금액, '')) "9월",
max(decode(월, '10', 납입금액, '')) "10월",
max(decode(월, '11', 납입금액, '')) "11월",
max(decode(월, '12', 납입금액, '')) "12월"
from (
	select 학과명, a.학번, 주민등록번호, 성 || 이름 성명, c.lvl, a.학적상태,
	semester, rcvdt , SUBSTR(rcvdt,5,2) 월, rcvamt 납입금액
	from tm학적 a, tm학과 b, TDFEEGOJI c
  WHERE a.학과코드 = b.학과코드
  AND a.학번 = c.hakbun
  AND schoolyear = :학년도
)
group by 주민등록번호, 성명

