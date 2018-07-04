INSERT INTO TMSCHOLARSHIP
SELECT jm_gubun || '0' || jm_code, jm_name, jm_gubun || '0', jm_jyong,
DECODE(SIGN(jm_ihakg), 1, 1, 0),
DECODE(SIGN(jm_suryo), 1, 1, 0),  jm_etcgm, '',
'', '', '', jm_bigo, '', '', '', ''
FROM psutis.AC1701