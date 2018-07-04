Select  
           HJ_HAKBUN 학번,  
           HJ_KNAME 성명,  
           '부산예술대학',  
           HG_KNAME 학과명,  
           HJ_JCODE1 || hj_jcode2 주민번호,  
           substr(AC12011.HJ_BYMD,1,4) 생년월일,  
           HJ_SEXGBN 성별,  
           HJ_JUYAGBN 주야구분,  
           substr(HJ_JYMD,1,6) 졸업년월,  
           '2',  
           '2' 
From AC12011, AC1121 
Where (HJ_HGCODE = HG_CODE ) 
and HJ_JYMD > '200508'