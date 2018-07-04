SELECT *
FROM flashback_transaction_query
WHERE TO_CHAR(commit_timestamp, 'YYYYMMDD') >= :³¯Â¥
--AND table_owner IN ('CISS')
AND table_name = 'TDFEEGOJI'
