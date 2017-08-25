SELECT
e.`equipment_port`,e.`start_time`,
e.`equipment_status` 
FROM `i_equipment_io` AS e
WHERE 
e.`equipment_port` LIKE 'a1%' AND e.`start_time` = '2017-07-25 21:00:00'
GROUP BY e.`equipment_port`, e.`start_time`


#     --------------resource--------------
SELECT
DISTINCT r.`resource_id`,
r.`resource_limit`
FROM `i_resource_limit` AS r
WHERE r.`resource_limit` = 3

#    --------------status-----------------
SELECT
DISTINCT e.`equipment_port`,
e.`equipment_status`
FROM `i_equipment_io_bak` AS e
WHERE e.`equipment_status`=1 AND (
e.`equipment_id`LIKE 'a%'
OR
e.`equipment_id`LIKE 'r%'
OR 
e.`equipment_id`LIKE 'm%'
)
ORDER BY e.`equipment_port`
