SELECT table_name
     , num_rows -- ������� �Ǽ�
     , TO_NUMBER(
       dbms_xmlgen.getxmltype('SELECT COUNT(*) c FROM ' || table_name).Extract('//text()')
       ) num_rows2 -- �������� �Ǽ�
  FROM user_tables
