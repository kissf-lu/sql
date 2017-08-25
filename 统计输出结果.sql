SELECT 
COUNT(DISTINCT m.`parcel_id`)
FROM`o_machine_table` AS m
WHERE m.`parcel_type`='small'

SELECT
p.`parcel_type`,
COUNT(p.`parcel_id`)
FROM `i_od_parcel_landside` AS p
GROUP BY p.`parcel_type`;

SELECT
p.`parcel_type`,
COUNT(p.`parcel_id`)
FROM `i_od_parcel_airside` AS p
GROUP BY p.`parcel_type`;

SELECT
u.`equipment_port`,
GROUP_CONCAT(u.`origin_type`, u.`dest_type`)
FROM `i_unload_setting` AS u
WHERE u.`equipment_port`LIKE 'r%'
GROUP BY u.`equipment_port`
#--,CONCAT(u.`origin_type`, u.`dest_type`)
