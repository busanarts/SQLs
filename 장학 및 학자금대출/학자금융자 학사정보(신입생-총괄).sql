SELECT ���ڱ��ڵ� ���ڱ������а��ڵ�, '11' �����ڵ�, iw_jcode1 || iw_jcode2 �ֹι�ȣ, si_hakbun �й�, iw_kname ����,
:�Խó⵵ ���г⵵, '13' ���������ڵ�, '1' �г�, DECODE(state, '77', '2', '11', '1', '0') ��ϳ��δ�󱸺�,
admissionfee + tuition  �����ϱݾ�,
:�Խó⵵ || :��ϸ�����  ��ϸ�����,
'11' ��������, 'N' �����б����Կ���,
4.5 ������������, 15 �б���ּ��̼�����,
0 �����б��̼�����, 0 �����б��̼�����,
0 ���̼�����, 0 ���̼�����, 0 �����б���������, 0 ����չ��������,
'Y' ���������������, '' �����������⵵, '' ������������б�,
'N' �����б⿩��, :�Խó⵵ || :�������� ���п�������, 'Y' ���д�ý��Ի�����
from ipsi.IPSI201, ipsi.ipsi401, TDFEEGOJI, tm�а�
where iw_year = :�Խó⵵  --AND iw_chasu = '01'
AND iw_year = schoolyear AND si_hakbun = hakbun AND CLASS = �а��ڵ�
--AND studentgbn = '3030'
AND STUDENTGBN <> '30304000'
AND iw_year = si_year AND iw_shno = si_shno
