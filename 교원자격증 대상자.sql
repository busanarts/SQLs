SELECT lr_year �����⵵, lr_hgcode �а��ڵ�, hg_kname �а���, lr_hakbun �й�,
lr_licnno �ڰ�����ȣ, lr_result �հݿ���, lr_date �߱�����, '�λ꿹�����б�' ����, lr_bigo ���
FROM ac1511 a, ac12011 b, AC1121
WHERE lr_result IS NULL
AND lr_year = '2014'
--lr_result = 'Y'
AND lr_hakbun = hj_hakbun
AND lr_hgcode = hg_code