select hj_jolupno 졸업증서번호, hg_kname || decode(hg_juya, '1', '', '(야)') 학과명, hj_hakbun 학번, hj_kname 성명,
hj_jcode1 || '-' ||hj_jcode2  주민등록번호, hj_iymd 입학일자, hj_jymd 졸업일자, hj_hakwino 학위등록번호, '        ' 비고
from ac12011, ac1121
where substr(hj_jymd,1,4) = :졸업연도
AND DECODE(:졸업구분, '전기', '81', '후기', '83') = hj_state
and hj_hgcode = hg_code
order by hj_jolupno, hj_hgcode

