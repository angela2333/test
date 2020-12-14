select partner_id, file_name_matcher, map 
from 
    (select *, row_number()over(partition by partner_id, file_name_matcher order by created_at desc) as row_number
     from column_maps 
     where partner_id = 343) x 
where tombstone <> true and row_number = 1
--test
--remove test
