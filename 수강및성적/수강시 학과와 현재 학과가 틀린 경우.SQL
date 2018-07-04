select hj_hakbun 학번, hj_kname 성명, hj_hgcode 소속학과, hj_wthgcode 수업학과, sj_hgcode 수강신청시학과,
sj_gghgcode 개설학과, sj_gggmcode 교과코드, sj_isugbm 이수구분
from ac1401, ac12011
where sj_year = '2011' and sj_hakgi = '1'
and sj_hakbun = hj_hakbun
and sj_hgcode <> hj_wthgcode
and sj_isugbm = '41'