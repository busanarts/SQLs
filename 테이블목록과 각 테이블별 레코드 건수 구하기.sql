SELECT table_name
     , num_rows -- 통계정보 건수
     , TO_NUMBER(
       dbms_xmlgen.getxmltype('SELECT COUNT(*) c FROM ' || table_name).Extract('//text()')
       ) num_rows2 -- 실제측정 건수
  FROM user_tables
