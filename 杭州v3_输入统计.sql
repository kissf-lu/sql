#  ------------------------------输入件量统计
(
SELECT pa.`parcel_type`, MIN(pa.`arrive_time`) AS 'min_t', MAX(pa.`arrive_time`) AS 'max_t', COUNT(pa.`parcel_id`), 'parcel_airside' AS 'parcel_from'
FROM `i_od_parcel_airside` AS pa
GROUP BY pa.`parcel_type`
)
UNION
(
SELECT pl.`parcel_type`, MIN(pl.`arrive_time`) AS 'min_t', MAX(pl.`arrive_time`) AS 'max_t', COUNT(pl.`parcel_id`), 'parcel_landside' AS 'parcel_from'
FROM `i_od_parcel_landside` AS pl
GROUP BY pl.`parcel_type`
)
/*
union
(
SELECT  sl.`parcel_type`, MIN(sl.`arrive_time`) AS 'min_t', MAX(sl.`arrive_time`) AS 'max_t', COUNT(sl.`small_id`), 'small_landside' AS 'parcel_from'
FROM `i_od_small_landside` AS sl
GROUP BY sl.`parcel_type`
)
union
(
SELECT  sa.`parcel_type`, MIN(sa.`arrive_time`) AS 'min_t', MAX(sa.`arrive_time`) AS 'max_t', COUNT(sa.`small_id`), 'small_airside' AS 'parcel_from'
FROM `i_od_small_airside` AS sa
GROUP BY sa.`parcel_type`
)

*/
#  -----------------------------------开关状态时间统计--------------------------
SELECT
e.equipment_port,
e.`equipment_status`,
e.start_time
FROM i_equipment_io AS e
WHERE e.equipment_status =1 AND e.equipment_port LIKE 'r%'
GROUP BY e.equipment_id,e.start_time


#