SELECT iw_shno 수험번호, iw_kname 성명, iw_ggname 고교이름
FROM ipsi201

WHERE iw_year = :입시연도
AND iw_chasu = :차수
AND iw_ggjyear IS NULL