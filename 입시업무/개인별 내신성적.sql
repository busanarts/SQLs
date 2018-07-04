SELECT hg_name �а�, iw_shno �����ȣ, iw_kname ����, socialnumber �ֹι�ȣ,
max(DECODE(cno, 1, subjectname)) ����11, MAX(DECODE(cno,1, unit)) �̼�����11, max(DECODE(cno, 1, rankinggrade)) ���11,
max(DECODE(cno, 2, subjectname)) ����12, MAX(DECODE(cno,2, unit)) �̼�����12, max(DECODE(cno, 2, rankinggrade)) ���12,
max(DECODE(cno, 3, subjectname)) ����21, MAX(DECODE(cno,3, unit)) �̼�����21, max(DECODE(cno, 3, rankinggrade)) ���21,
max(DECODE(cno, 4, subjectname)) ����22, MAX(DECODE(cno,4, unit)) �̼�����22, max(DECODE(cno, 4, rankinggrade)) ���22
from
(SELECT row_number() over (partition BY SocialNumber ORDER BY term, rankingGrade) cno, socialnumber, subjectname, unit, rankinggrade
FROM selectedscore
ORDER BY socialnumber, term
), ipsi201, ipsi104
WHERE iw_year = :�Խÿ��� AND iw_chasu = :����
AND iw_jcode1 || iw_jcode2 = socialnumber
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year
--WHERE socialnumber = '9503072820821'
GROUP BY hg_name, iw_shno, iw_kname, socialnumber
order BY hg_name, iw_shno, iw_kname


