SELECT JM_CODE 장학코드, JM_NAME 장학명, JM_GUBUN 구분,
JM_IHAKG 입학금감면, JM_SURYO 수업료감면, JM_GISBI 기성회비감면, JM_ETCGM 기타감면,
JM_JEWON 재원, JM_BIGO 비고, JM_DCODE 국가장학코드
FROM AC1701
WHERE JM_STOP = 'N'