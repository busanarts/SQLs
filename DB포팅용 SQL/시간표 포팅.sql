DELETE psutis.tmtimeschedule;
INSERT INTO  psutis.TMTIMESCHEDULE
SELECT tm_year, tm_haknyun, tm_hakgi, hg_mcode, tm_juya, tm_week, tm_time, tm_ban, tm_krkrdong, tm_krkrroom, tm_gmcode, tm_pfcode
FROM psutis.ac1304, psutis.ac1121
WHERE tm_hgcode = hg_code