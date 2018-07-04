SELECT hj_hakbun 학번, hj_wthgcode 학과코드, hj_state 학적상태,
hj_jcode1 || hj_jcode2 주민번호, hj_haknyun 학년, dd_haknyun 등록학년,
dd_hakgi 등록학기, DD_IHAKG 입학금, DD_SURYO 수업료, DD_GISBI 기성회비,
DD_GMIHAKG 입학금감면, DD_GMSURYO 수업료감면, DD_GMGISBI 기성회비감면,
DD_TOTGUM 등록금계, DD_TGMGUM 감면액계, DD_NIPGUM 납입금, DD_MODGUM 미납금,
DD_NIDATE 납입일자, DD_BIGO 비고, DD_NIPGUM1, DD_NIPGUM2, DD_NIPGUM3,
DD_NIDATE2, DD_NIDATE3, DD_NIDATE1
from ac12011, ac2711
where dd_year = &sYear and dd_hakgi = &sHakgi
and hj_hakbun = dd_hakbun