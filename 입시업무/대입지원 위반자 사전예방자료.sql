SELECT DECODE(SUBSTR(iw_chasu,1,1), '9', 'A', '0', 'G', '*') 모집시기구분,
	iw_kname 이름, iw_jcode1 || iw_jcode2 주민등록번호, iw_ggcode 출신고등학교코드,
    iw_ggjyear 졸업년도, 'A000003810' 제출대학코드, iw_shno 수험번호,
    DECODE(SUBSTR(iw_shno, 1,1), '1', '1', '2', '3', '3', '4') 접수장소구분, iw_ipymd || '0000' 지원일자,
    DECODE(nvl(납입일자, '0'), '0', '0', DECODE(NVL(환불일자, '1'), '1', '1', '0')) 예치금납부여부
    FROM ipsi.IPSI201, CISS.TDFEEGOJI
    WHERE iw_year = :입시연도
    --AND iw_chasu = '92'
    AND iw_year = schoolyear AND iw_shno = hakbun