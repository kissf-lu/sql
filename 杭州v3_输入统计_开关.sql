
#  -----------------------------------开关状态时间统计--------------------------
SELECT
`equipment_port`,

CONCAT(
`equipment_status`, ',',
`start_time`
) AS 'status_time'
FROM `i_equipment_io`
WHERE 
equipment_status =1
#AND equipment_port LIKE 'a1%'
GROUP BY `equipment_port`, CONCAT(
`equipment_status`, ',',
`start_time`
)
