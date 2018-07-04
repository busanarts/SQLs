SELECT hg_kname 학과명, hj_hakbun 학번, hj_kname 성명, F_HJSTATE(hj_hakbun, '20120401') "2012학년도 1학기 상태"
FROM AC12011, AC1121
WHERE hj_hgcode = hg_code
AND F_HJSTATE(hj_hakbun, '20111001') = '재학'
--WHERE hj_hakbun = 'A1125045'