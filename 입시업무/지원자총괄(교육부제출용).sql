SELECT 'A000003810' �����ڵ�, '02' �õ�, '07' �ñ���, DECODE(IW_JWHGCODE1, '07', '01', '09', '01', '04') �迭�ڵ�, IW_JHGUBUN ��������,
	DECODE(IW_JHGUBUN,
	'21', '01', -- �Ϲ�����
    '22', '  ', -- ������2+1, �Ϲݰ� ��Ź��
 	'23', '04', -- ������� �����
 	'31', '06', -- ���ϰ� �а������
 	'32', '05', -- �ڰ��� ������
 	'33', '03', -- ����Ư����
 	'34', '02', -- ���ü�ٹ���
 	'35', '04', -- �п��濵��
 	'37', '04', -- ���������� �� �ڼ�
    '38', '04', -- ��.ȿ��� ������
    '39', '  ', -- �а��� �߰�����
     '3A', '04', -- �����ֺ� �� ���е�
     '51', '18', -- ���� �̻�
     '52', '18', -- �������� �̻�
     '53', '13', -- ������л�
     '54', '10', -- ��ܱ���
    '55', '17', -- ���е� �� ����������
    '56', '19' -- ���ʻ�Ȱ������
) ��������,
DECODE(IW_JHGUBUN,
    '21', '001',
    '22', '   ',
    '23', '024',
    '31', '001',
    '32', '001',
    '33', '  ',
    '34', '001',
    '35', '  ',
    '37', '001',
    '38', '003',
    '39', '   ',
    '3A', '022',
    '51', '001',
    '52', '001',
    '53', '001',
    '54', '002',
    '55', '001',
    '56', '001'
) ������������,
JG_FNAME ������, HG_NAME ����������,
DECODE(SUBSTR(IW_CHASU,1,1), '9', 'A', '0', 'G') �����ñⱸ��, '0' || substr(iw_chasu,2,1) ��������,
IW_RESULT || IW_DUNGROK || SIGN(NVL(IW_RANK2,0)) ���, DECODE(IW_RESULT || IW_DUNGROK || SIGN(NVL(iw_rank2, 0)),
    '110', '01', -- �����հ��������
    '100', '03', -- �����հݹ̵��
	'140', DECODE(SUBSTR(dr_drhbymd,5,4), '0301', '07', '0302', '07', '04'), -- �����հ� ����� ����
    '111', '02', -- ����հ� �������
    '101', '05', -- ����հ� �̵��
    '141', DECODE(SUBSTR(dr_drhbymd,5,4), '0301', '07', '0302', '07', '06'), -- ����հ� ����� ����
    '09' ) �������, IW_SHNO �����ȣ,
     IW_KNAME ����, IW_JCODE1 || IW_JCODE2 �ֹι�ȣ, '1' �־߱���,
     DECODE(SUBSTR(IW_JHGUBUN,1,1), '5', '2', '1') �������ܱ���,
    CASE
        WHEN IW_JHGUBUN = '51' THEN '9999999902'
        WHEN IW_JHGUBUN = '52' THEN '9999999901'
        ELSE IW_GGCODE
    END ��Ű��ڵ�, IW_GGJYEAR �����⵵,
    --CASE
    --    WHEN SUBSTR(IW_CHASU,1,1) = '9' THEN
    --        CASE
    --            WHEN RCVDT >= '20101213' AND RCVDT <= '20101215' THEN '11'
    --            ELSE '00' --���� �̴���� �� �̳���
    --        END
    --    WHEN IW_CHASU IN ('01', '02', '03') THEN
    --        CASE
    --            WHEN DR_DRNIYMD >= '20101217' AND DR_DRNIYMD <= '20110228' THEN '18'
    --            ELSE '00' --���� �̴���� �� �̳���
    --        END
    --    END ������ڱ���,
    SI_HAKBUN �й�
FROM IPSI.IPSI201, IPSI.IPSI104, IPSI.IPSI108, IPSI.IPSI401, TDFEEGOJI
WHERE IW_YEAR = :�Խÿ��� AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year AND IW_JHGUBUN = JG_CODE
    AND SI_YEAR = SCHOOLYEAR(+) AND SI_HAKBUN = HAKBUN(+)
    AND IW_YEAR = SI_YEAR AND IW_SHNO = SI_SHNO
ORDER BY SUBSTR(IW_CHASU,1,1) DESC, SUBSTR(IW_CHASU, 2,1), HG_NAME, �������