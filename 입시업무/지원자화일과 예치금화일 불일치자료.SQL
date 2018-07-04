select iw_jwhgcode1, iw_shno, iw_kname, 차수 || ' -> ' || iw_chasu  차수변경 from ipsi201, tbl수시예치금파일
where iw_year = 지원년도
and iw_shno = 수험번호
and iw_chasu <> 차수