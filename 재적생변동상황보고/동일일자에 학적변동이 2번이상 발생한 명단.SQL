select a.hc_hakbun, a.hc_scode, a.hc_siymd
from ac1202 a, ac1202 b
where a.hc_hakbun = b.hc_hakbun
and a.hc_siymd = b.hc_siymd
and a.rowid <> b.rowid
order by a.hc_hakbun