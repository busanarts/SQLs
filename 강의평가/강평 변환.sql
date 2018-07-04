UPDATE SUBSTR(아주그렇다,instr(아주그렇다, '(')+1, instr(아주그렇다, ')') - instr(아주그렇다, '(')-1)
tbl강의평가 SET 아주그렇다 = SUBSTR(아주그렇다,instr(아주그렇다, '(')+1, instr(아주그렇다, ')') - instr(아주그렇다, '(')-1),
그렇다 = SUBSTR(그렇다,instr(그렇다, '(')+1, instr(그렇다, ')') - instr(그렇다, '(')-1),
보통이다 = SUBSTR(보통이다,instr(보통이다, '(')+1, instr(보통이다, ')') - instr(보통이다, '(')-1),
아니다 = SUBSTR(아니다,instr(아니다, '(')+1, instr(아니다, ')') - instr(아니다, '(')-1),
전혀아니다 = SUBSTR(전혀아니다,instr(전혀아니다, '(')+1, instr(전혀아니다, ')') - instr(전혀아니다, '(')-1)