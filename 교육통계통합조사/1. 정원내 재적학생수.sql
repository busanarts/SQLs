-- 2.1.3.��~�� ������ �����л��� ����.����.������.����.������(���ο�)
--SELECT SUBSTR(20141001,1,4) || DECODE(SUBSTR(20141001,5,2), '04', '01', '02') ����Ⱓ�ڵ�, '73148000' �б��ڵ�, �г�, �а���,
SELECT �г�, �а���, '' ��������,
MAX(NVL(DECODE(grp, '�����ο�', cnt, 0),0)) �����ο�,
MAX(NVL(DECODE(grp, '��������', CNT, 0),0)) ��������,
MAX(NVL(DECODE(grp||��������, '���ο�61', CNT, 0),0)) ����,
MAX(NVL(DECODE(grp||��������, '���б�61', CNT, 0),0)) ����_���б�,
MAX(NVL(DECODE(grp||��������, '���ο�51', CNT, 0),0)) ����,
MAX(NVL(DECODE(grp||��������, '���б�51', CNT, 0),0)) ����_���б�,
MAX(NVL(DECODE(grp||��������, '���ο�52', CNT, 0),0)) ������,
MAX(NVL(DECODE(grp||��������, '���б�52', CNT, 0),0)) ������_���б�,
MAX(NVL(DECODE(grp||��������, '���ο�31', CNT, 0),0)) ����,
MAX(NVL(DECODE(grp||��������, '���б�31', CNT, 0),0)) ����_���б�,
MAX(NVL(DECODE(grp||��������, '���ο�53', CNT, 0),0)) ������,
MAX(NVL(DECODE(grp||��������, '���б�53', CNT, 0),0)) ������_���б�,
MAX(NVL(DECODE(grp||��������, '��������', CNT, 0),0)) +
MAX(NVL(DECODE(grp||��������, '���ο�61', CNT, 0),0)) + MAX(NVL(DECODE(grp||��������, '���ο�51', CNT, 0),0)) +
MAX(NVL(DECODE(grp||��������, '���ο�52', CNT, 0),0)) + MAX(NVL(DECODE(grp||��������, '���ο�31', CNT, 0),0)) +
MAX(NVL(DECODE(grp||��������, '���ο�11', CNT, 0),0)) ���л����ο�,
MAX(NVL(DECODE(grp||��������, '���б�61', CNT, 0),0)) + MAX(NVL(DECODE(grp||��������, '���б�51', CNT, 0),0)) +
MAX(NVL(DECODE(grp||��������, '���б�52', CNT, 0),0)) + MAX(NVL(DECODE(grp||��������, '���б�31', CNT, 0),0)) +
MAX(NVL(DECODE(grp||��������, '���б�53', CNT, 0),0)) ���л����б�,
MAX(NVL(DECODE(GRP||��������, '���л�1', CNT, 0),0)) ���л�_��,
MAX(NVL(DECODE(GRP||��������, '���л�2', CNT, 0),0)) ���л�_��,
MAX(NVL(DECODE(GRP||��������, '���л�1', CNT, 0),0)) + MAX(NVL(DECODE(GRP||��������, '���л�2', CNT, 0),0)) ���л�_��,
MAX(NVL(DECODE(grp||��������, '�������ο�1', CNT, 0),0)) ����_��,
MAX(NVL(DECODE(grp||��������, '�������ο�2', CNT, 0),0)) ����_��,
MAX(NVL(DECODE(grp||��������, '�������ο�1', CNT, 0),0)) + MAX(NVL(DECODE(grp||��������, '�������ο�2', CNT, 0),0)) ����_��,
MAX(NVL(DECODE(grp||��������, '���б�����91', CNT, 0),0)) ���б�����,
max(NVL(DECODE(grp||��������, '���������б��Դ�', cnt, 0), 0)) ���Դ�,
'' ���п���_��, '' ���п���_��, '' ����غ�_��, '' ����غ�_��, '' ��������_��, '' ��������_��,
max(NVL(DECODE(grp||��������, '���������а��λ�����', cnt, 0), 0)) ���λ���_��,
max(NVL(DECODE(grp||��������, '���������а��λ�����', cnt, 0), 0)) ���λ���_��,
MAX(NVL(DECODE(grp||��������, '�̵�ϳ�', cnt, 0), 0)) �̵��_��,
MAX(NVL(DECODE(grp||��������, '�̵�Ͽ�', cnt, 0), 0)) �̵��_��,
MAX(NVL(DECODE(grp||��������, '�̵�ϳ�', cnt, 0), 0)) + MAX(NVL(DECODE(grp||��������, '�̵�Ͽ�', cnt, 0), 0)) �̵�ϰ�,
MAX(NVL(DECODE(grp, '������', cnt, 0), 0)) ������

FROM
(
--------------------------------------------------------------------------------
--
-- ������ ���л�
--
--------------------------------------------------------------------------------
-- �����ο�
	select '�����ο�' grp, hj_haknyun �г�, �а���, '00' ��������, count(*) cnt
	from ac12011_20141001, AC1121, TBL�а�
	where hj_jhgbn < '50' AND HJ_HAKBUN NOT LIKE 'T%'
  AND hj_hakbun LIKE 'A' || SUBSTR(20141001,3,2) || '%'
--  AND (hj_hakbun LIKE 'A' || SUBSTR(20141001,3,2) || '%'
--  OR hj_hakbun LIKE 'A' || LPAD(TO_CHAR(TO_NUMBER(SUBSTR(20141001,3,2)) - 1), 2, '0') || '%')
  and hj_hakbun not in (select distinct hc_hakbun from AC1202_20141001 where hc_hakbun = hj_hakbun AND hc_scode IN ('52', '53'))
  AND SUBSTR(HJ_hakbun,4,2) = hg_code AND hg_mcode = �а��ڵ�
	group by hj_haknyun, �а���
  UNION
-- ��������
	select '��������' grp, hj_haknyun �г�, �а���, '00' ��������, count(*) cnt
	from ac12011_20141001, AC1121, TBL�а�
	where hj_state = '01' and hj_jhgbn < '50' AND HJ_HAKBUN NOT LIKE 'T%'
	and hj_hakbun not in (select distinct hc_hakbun from AC1202_20141001 where hc_hakbun = hj_hakbun)
  AND SUBSTR(HJ_hakbun,4,2) = hg_code AND hg_mcode = �а��ڵ�
	group by hj_haknyun, �а���
  UNION
  -- ���л���������
	SELECT '���ο�' grp, HJ_HAKNYUN �г�, �а���, '11' ��������, COUNT(*) CNT
  FROM ac12011_20141001, AC1121, TBL�а�
	WHERE HJ_STATE = '01' AND hj_jhgbn < '50' AND HJ_HAKBUN NOT LIKE 'T%'
	AND HJ_HGCODE = hg_code AND hg_mcode = �а��ڵ�
	GROUP BY �а���, HJ_HAKNYUN
  UNION
  -- ���л����ະ
  select '���л�' grp, hj_haknyun �г�, �а���,
	hj_sexgbn ����, count(*) cnt
	from ac12011_20141001, AC1121, TBL�а�
	where hj_state = '01' and hj_jhgbn < '50' AND HJ_HAKBUN NOT LIKE 'T%'
  AND HJ_HGCODE = hg_code AND hg_mcode = �а��ڵ�
	group by �а���, hj_haknyun, hj_sexgbn
  UNION
  -- ���б���������
	SELECT '���б�' grp, HJ_HAKNYUN �г�, �а���, HC_SCODE ��������, COUNT(*) CNT
  FROM ac12011_20141001, AC1121, TBL�а�, (
		SELECT HC_HAKBUN, HC_SCODE, HC_SIYMD FROM AC1202_20141001 A1
		WHERE (HC_HAKBUN, HC_SIYMD) IN (SELECT HC_HAKBUN, MAX(HC_SIYMD) FROM AC1202_20141001
		WHERE HC_SIYMD >= DECODE(SUBSTR(20141001,5,2), '04',
  									SUBSTR(20141001,1,4) - 1 || '1001',
                    SUBSTR(20141001,1,4) || '0401')
  	AND HC_SIYMD <= DECODE(SUBSTR(20141001,5,2), '04',
  									SUBSTR(20141001,1,4) || '0331',
                    SUBSTR(20141001,1,4) || '0931')
		GROUP BY HC_HAKBUN)
	)
	WHERE HJ_STATE = '01' AND hj_jhgbn < '50' AND HJ_HAKBUN NOT LIKE 'T%'
	AND HJ_HAKBUN = HC_HAKBUN
  AND HJ_HGCODE = hg_code AND hg_mcode = �а��ڵ�
	GROUP BY HJ_HAKNYUN, �а���, HC_SCODE
  -- �������ο�
  UNION

--------------------------------------------------------------------------------
--
-- ������ ���л�
--
--------------------------------------------------------------------------------
  SELECT '�������ο�' grp, HJ_HAKNYUN �г�, �а���,
	HJ_SEXGBN ����, COUNT(*) cnt
	FROM ac12011_20141001, AC1121, TBL�а�
	WHERE SUBSTR(HJ_STATE,1,1) = '1'
	AND hj_jhgbn < '50' AND hj_hakbun NOT LIKE 'T%'
  AND HJ_HGCODE = hg_code AND hg_mcode = �а��ڵ�
	GROUP BY HJ_HAKNYUN, �а���, HJ_SEXGBN
	UNION
  -- ���б� ����
  SELECT '���б�����' grp, HJ_HAKNYUN �г�, �а���, '91' ��������,COUNT(*) ���б������ο�
  FROM ac12011_20141001, AC1202_20141001, AC1121, TBL�а�
  WHERE HJ_HAKBUN = HC_HAKBUN
  AND HJ_HGCODE = hg_code AND hg_mcode = �а��ڵ�
  AND hj_jhgbn < '50'
  AND SUBSTR(HC_SCODE,1,1) = '1' AND HJ_HAKBUN NOT LIKE 'T%'
	AND HC_SIYMD >= DECODE(SUBSTR(20141001,5,2), '04',
  									SUBSTR(20141001,1,4) - 1 || '1001',
                    SUBSTR(20141001,1,4) || '0401')
  AND HC_SIYMD <= DECODE(SUBSTR(20141001,5,2), '04',
  									SUBSTR(20141001,1,4) || '0331',
                    SUBSTR(20141001,1,4) || '0931')
  GROUP BY HJ_HAKNYUN, �а���
  UNION
  -- ������ ���л���
  SELECT '����������' grp, hj_haknyun �г�, �а���,
  DECODE(Hj_state, '12', '���Դ�', '13', '���Դ�', DECODE(hj_sexgbn, '1', '���λ�����', '���λ�����')) ��������, COUNT(*) �������ο�
	FROM ac12011_20141001, AC1121, TBL�а�
  WHERE hj_jhgbn < '50'
  AND HJ_HGCODE = hg_code AND hg_mcode = �а��ڵ�
  AND SUBSTR(HJ_STATE,1,1) = '1'
  AND HJ_HAKBUN NOT LIKE 'T%'
  GROUP BY hj_haknyun, �а���, DECODE(Hj_state, '12', '���Դ�', '13', '���Դ�', DECODE(hj_sexgbn, '1', '���λ�����', '���λ�����'))
  UNION
--------------------------------------------------------------------------------
--
-- ������ ������
--
--------------------------------------------------------------------------------
-- �̵��
	SELECT '�̵��' grp, hj_haknyun �г�, �а���, DECODE(hj_sexgbn, '1', '��', '2', '��') ��������, COUNT(*) �������ο�
	FROM PSUTIS.AC12011_20141001, ciss.TDFEEGOJI, AC1121, TBL�а�
	WHERE schoolyear = substr(20141001,1,4) AND state IN('11', '22', '33')
	AND hakbun = hj_hakbun
  AND HJ_HGCODE = hg_code AND hg_mcode = �а��ڵ�
	AND hj_state = '01'
	AND hj_jhgbn < '50'
	GROUP BY �а���, hj_haknyun, DECODE(hj_sexgbn, '1', '��', '2', '��')
  UNION

-- ����
	SELECT '������' grp, hj_haknyun �г�, �а���, '20' ��������, COUNT(*) �������ο�
	FROM PSUTIS.AC12011_20141001, AC1121, TBL�а�
	WHERE HJ_HAKBUN IN (SELECT HC_HAKBUN FROM AC1202_20141001
	WHERE SUBSTR(HC_SCODE,1,1) = '2'
	AND HC_SIYMD >= DECODE(SUBSTR(20141001,5,2), '04',
  									SUBSTR(20141001,1,4) - 1 || '1001',
                    SUBSTR(20141001,1,4) || '0401')
  AND HC_SIYMD <= DECODE(SUBSTR(20141001,5,2), '04',
  									SUBSTR(20141001,1,4) || '0331',
                    SUBSTR(20141001,1,4) || '0931')
	GROUP BY HC_HAKBUN)
  AND hj_jhgbn < '50'
  AND HJ_HGCODE = hg_code AND hg_mcode = �а��ڵ�
	GROUP BY �а���, hj_haknyun

)

GROUP BY �г�, �а���
ORDER BY �г�, �а���
