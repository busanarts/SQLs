SELECT Up_code,
       Up_sido || ' ' || up_sigungu || ' ' || Up_roadname || ' ' || up_bldno || decode(up_bldop, '0', '', '-' || up_bldop) || ' ' || '(' || up_bjdongnm ||
       DECODE(up_bldngsgg, '', ')',  ',' || up_bldngsgg || ')') newaddr,




       Up_sido || ' ' || up_sigungu || ' ' || up_epmyun || ' ' || up_bjdongnm || ' ' || up_jibunno || decode(up_jibunop, '0', '', '-' || up_jibunop) || ' ' ||up_bldngsgg oldAddr
  FROM CISS.ZIP
-- WHERE up_roadname LIKE :�ּ� || '%'
--       OR up_bjdongnm LIKE :�ּ� || '%'
--       OR up_ri LIKE :�ּ� || '%'
--       OR up_epmyun LIKE :�ּ� || '%'
--       OR up_hjdongnm = SUBSTR(:�ּ�, 1, regexp_instr(:�ּ�, '[0-9]') - 1) ||'��' || SUBSTR(:�ּ�, regexp_instr(:�ּ�, '[0-9]'))
--       OR up_bldngsgg LIKE :�ּ� || '%'
--       OR up_hjdongnm LIKE :�ּ� || '%'