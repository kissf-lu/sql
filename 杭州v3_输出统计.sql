# --------------------输出件量统计-------------------------
(
SELECT
m.`parcel_type` AS 'parcel_type',
COUNT(DISTINCT m.`small_id`)
FROM `o_machine_table` AS m
GROUP BY m.`parcel_type`
)
UNION
(
SELECT
'总计' AS 'parcel_type',
COUNT(DISTINCT m.`small_id`)
FROM `o_machine_table` AS m
)

#  ------------------------------------机器, 服务状态时间表-------------------------
SELECT
m.`equipment_id`,
CONCAT(
m.`real_time_stamp`, ',',
m.`parcel_id`, ',',
GROUP_CONCAT(m.`action`)) AS 'rule'
FROM `o_machine_table` AS m
WHERE 
#`parcel_id`=100003
m.`equipment_id` LIKE 'a%'
GROUP BY m.`equipment_id`,m.`parcel_id`,m.`real_time_stamp`
ORDER BY m.`real_time_stamp`

# ----------------------------------parcel，路由表----------------------------------
SELECT
`parcel_id`,
CONCAT(
`real_time_stamp`, ',',
`equipment_id`, ',',
GROUP_CONCAT(`action`)) AS 'rule'
FROM `o_machine_table`
WHERE 
`parcel_id`=526484
# and m.`equipment_id` like 'j%'
GROUP BY `equipment_id`,`parcel_id`,`real_time_stamp`
ORDER BY `real_time_stamp`

#-----------------------------------------------------------------------
SELECT
m.`equipment_id` AS '机器id',
m.`real_time_stamp`,
m.`parcel_id`,
GROUP_CONCAT(m.`action`)
FROM `o_machine_table` AS m
WHERE m.`equipment_id` LIKE 'r%' 
GROUP BY m.`equipment_id`,
m.`real_time_stamp`,
m.`parcel_id`
ORDER BY m.`real_time_stamp`
