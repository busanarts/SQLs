SELECT 학번, 학적상태, 최종학적변동코드, usr_lcscode(학번) FROM tm학적
--WHERE 최종학적변동코드 <> usr_lcscode(학번)
WHERE 최종학적변동일자 <> usr_lcdate(학번)
AND 학적상태 NOT IN ('81', '82', '83', '21', '22', '23', '24')
AND usr_lcscode(학번) NOT IN( 'N/A', '51', '61', '31')
