SELECT ���ڱ��ڵ� ���ڱ������а��ڵ�,
       '11' �����ڵ�,
       iw_jcode1 || iw_jcode2 �ֹι�ȣ,
       Iw_shno �����ȣ,
       iw_kname ����,
       '1' �г�,
       DECODE(state, '77', '2', '11', '1', '0') ��ϳ��δ�󱸺�,
       :�Խó⵵ || :��ϸ����� �������帶������,
       '1' ���м������±���1,
       '032' �������������ڵ�1,
       F_GETVNO(iw_shno, '301002') ����������¹�ȣ1,
       iw_kname �������¿����ָ�1,
       '1' ���м������±���2,
       '011' �������������ڵ�2,
       F_GETVNO(iw_shno, '301003') ����������¹�ȣ2,
       iw_kname �������¿����ָ�2,

       --DECODE(J.JANGHAKCD1, '30', F_GETDCODE(J.JANGHAKCD1), '') ��ܼ�������1�ڵ�,
       DECODE(F_GETJANGHAKGBN(janghakcd1), '30', F_GETDCODE(JANGHAKCD1), '') ��ܼ�������1�ڵ�,
       DECODE(F_GETJANGHAKGBN(J.JANGHAKCD1), '30', NVL(J.SCHOLARSHIP1, 0), 0) ��ܼ�������1�ݾ�,

       --DECODE(J.JANGHAKCD2, '30', F_GETDCODE(J.JANGHAKCD2), '') ��ܼ�������2�ڵ�,
       DECODE(F_GETJANGHAKGBN(janghakcd2), '30', F_GETDCODE(JANGHAKCD2), '') ��ܼ�������2�ڵ�,
       DECODE(F_GETJANGHAKGBN(J.JANGHAKCD2), '30', NVL(J.SCHOLARSHIP2, 0), 0) ��ܼ�������2�ݾ�,

       --DECODE(J.JANGHAKCD3, '30', F_GETDCODE(J.JANGHAKCD3), '') ��ܼ�������3�ڵ�,
       DECODE(F_GETJANGHAKGBN(janghakcd3), '30', F_GETDCODE(JANGHAKCD3), '') ��ܼ�������3�ڵ�,
       DECODE(F_GETJANGHAKGBN(J.JANGHAKCD3), '30', NVL(J.SCHOLARSHIP3, 0), 0) ��ܼ�������3�ݾ�,

       DECODE(F_GETJANGHAKGBN(J.JANGHAKCD1), '10', NVL(J.SCHOLARSHIP1, 0), 0) + DECODE(F_GETJANGHAKGBN(J.JANGHAKCD2), '10', NVL(J.SCHOLARSHIP2, 0), 0) + DECODE(F_GETJANGHAKGBN(J.JANGHAKCD3), '10', NVL(J.SCHOLARSHIP3, 0), 0) �������б�,
       DECODE(F_GETJANGHAKGBN(J.JANGHAKCD1), '20', NVL(J.SCHOLARSHIP1, 0), 0) + DECODE(F_GETJANGHAKGBN(J.JANGHAKCD2), '20', NVL(J.SCHOLARSHIP2, 0), 0) + DECODE(F_GETJANGHAKGBN(J.JANGHAKCD3), '20', NVL(J.SCHOLARSHIP3, 0), 0) �������б�,

       prefee ��ġ��, -- ������ 0 ó��
       admissionfee ���б�,
       tuition ������,
       0 �⼺ȸ��

  FROM TDFEEGOJI D,
       TDJANGHAKSUM J,
       ipsi.ipsi201 S,
       TM�а� H --, TMSCHOLARSHIP C
 WHERE D.schoolyear = :�Խó⵵
       AND D.SCHOOLYEAR = J.SCHOOLYEAR(+)
       AND D.SEMESTER = J.SEMESTER(+)
       AND D.HAKBUN = J.HAKBUN(+)
       AND d.SCHOOLYEAR = s.iw_year
       AND D.HAKBUN = s.iw_shno
       AND D.class = H.�а��ڵ�
       AND s.IW_RESULT IN ('1', '5') --AND studentgbn = '30303130' -- 30303000 = ����1��, 30303112 = ����1�� �߰��հ�2, 30303120 = ����2��, 30303130 = ����3��
       AND STUDENTGBN <> '30304000' --AND state <> '88'
       --AND studentgbn = '3030' || DECODE(:����, '����', '30', '����', '31') || SUBSTR(:����,2,1) || :�߰� -- ����1�� �߰�1��
       --AND studentgbn = '30303111'  -- ����1�� �߰�1��


