select '1' 체크, '73429010' 기관코드번호, '부산예전' 발급부호, '부산예술대학' 발급기관,
--lr_licnno 자격번호, hj_kname 성명, hj_jcode1 || hj_jcode2 주민등록번호, '008' 자격종별, '015' 자격급별,
lr_licnno 자격번호, 성||이름 성명, 주민등록번호, '008' 자격종별, '015' 자격급별,
'5' 표시과목부호,
decode(hl_psname, '미술', '557', '디자인', '558', '음악', '559', '체육', '560', '사진', '556', '미용', '526') 출원과목,
decode(hl_psname, '미술', '55701', '디자인', '55801', '음악', '55901', '체육', '56001', '미용', '52601') 표시과목코드,
lr_date 발급일자, lr_year 보고년도, lr_date 취득일자, '21' 조, '2' 항, '2' 호, 학위번호, '00' 장애코드, '0' 복수전공
--from psutis.ac1511, ciss.tm학적, psutis.ac1501
from ciss.TMTEACHERLICENSE, ciss.tm학적 hj, psutis.ac1501, ciss.tm학과 hg
where lr_date >= :발급일자
--lr_licnno >= '1304' --and lr_licnno <= '1431'
--and lr_result = 'Y' and lr_hakbun = 학번 and SUBSTR(lr_licode,7,2) = hl_licode(+)
and lr_result = 'Y' and lr_hakbun = 학번 and hj.학과코드 = hg.학과코드 AND hg.구학과코드 = hl_hgcode
order by lr_licnno