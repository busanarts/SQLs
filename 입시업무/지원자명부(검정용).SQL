SELECT HG_NAME 지원학과, IW_JHGUBUN 전형코드, JG_FNAME 전형구분, IW_SGCODE 실기코드, SC_NAME 실기명,
IW_SHNO 수험번호, IW_KNAME 성명, IW_JCODE1 || '-' || IW_JCODE2 주민번호,
IW_UCODE1 우편번호, IW_ADDR1 주소앞, IW_ADDR2 주소뒤,
SUBSTR(IW_HDTEL,1,3) || '-' || SUBSTR(IW_HDTEL,4,4) || '-' || SUBSTR(IW_HDTEL,8,4) 휴대폰,
SUBSTR(IW_BHTELNO,1,3) || '-' || SUBSTR(IW_BHTELNO,4,4) || '-' || SUBSTR(IW_BHTELNO,8,4) 보호자연락처,
TRIM(IW_TELNO1) || '-' || TRIM(IW_TELNO2) || '-' || TRIM(IW_TELNO3) 전화번호, IW_EMAIL 전자우편,
IW_GGCODE 고교코드, IW_GGNAME 출신학교명, IW_GGJYEAR 졸업년도,
SUBSTR(IW_IPYMD,1,4) || '.' || SUBSTR(IW_IPYMD,5,2) || '.' || SUBSTR(IW_IPYMD,7,2) 지원일자,
DECODE(iw_sgcheck, '1', '예') 학생부활용동의여부, iw_ipsino 검정고시번호
FROM ipsi.IPSI201, ipsi.IPSI104, ipsi.IPSI108, ipsi.IPSI109
WHERE IW_YEAR = :입시연도 AND IW_CHASU like :차수 || '%'
--AND iw_shno LIKE '2%'

AND IW_SGCODE = SC_CODE(+)

AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year AND IW_JHGUBUN = JG_CODE
ORDER BY HG_NAME, IW_KNAME

--유 : 136
--129
--117