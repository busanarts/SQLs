select '�Ѱ������¼�   : ' || to_char(count(distinct sj_gghgcode || sj_gggmcode ||sj_ggban))
from ac1401 --����/����
where sj_year = '2010' and sj_hakgi = '1'  -- �Ѱ������¼�
union
select '�����������¼� : ' || to_char(count(distinct sj_gghgcode || sj_gggmcode ||sj_ggban))
from ac1401 --����/����
where sj_year = '2010' and sj_hakgi = '1' and substr(sj_gggmcode,3,1) = '2' -- ������� �Ѱ������¼�
union
select '���簳�����¼� : ' || to_char(count(distinct sj_gghgcode || sj_gggmcode ||sj_ggban))
from ac1401 --����/����
where sj_year = '2010' and sj_hakgi = '1' and substr(sj_gggmcode,3,1) = '1' -- ������� �Ѱ������¼�
