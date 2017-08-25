#  ------------------------------输入件量统计
/*
(
SELECT 
pa.`parcel_type`, 
GROUP_CONCAT(DISTINCT  pa.`src_type`, pa.`dest_type`) AS '流向', 
MIN(pa.`arrive_time`) AS '最早票', 
MAX(pa.`arrive_time`) AS '最晚票', 
COUNT(pa.`parcel_id`) as '包裹数', 
'空侧包裹' AS '路/空'
FROM `i_od_parcel_airside` AS pa
GROUP BY pa.`parcel_type`
)
UNION
(
SELECT 
pl.`parcel_type` as '包裹类型', 
GROUP_CONCAT(DISTINCT  pl.`src_type`, pl.`dest_type`) AS '流向', 
MIN(pl.`arrive_time`) AS '最早票', 
MAX(pl.`arrive_time`) AS '最晚票', 
COUNT(pl.`parcel_id`) as '包裹数', 
'路侧包裹' AS '路/空'
FROM `i_od_parcel_landside` AS pl
GROUP BY pl.`parcel_type`
)

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

(
SELECT 
pa.`arrive_time`,
pa.`parcel_type`,
CONCAT(pa.`src_type`, pa.`dest_type`)AS '流向',
COUNT(pa.`parcel_id`) AS '包裹数',
'空侧包裹' AS '路/空'
FROM `i_od_parcel_airside` AS pa
GROUP BY pa.`parcel_type`, CONCAT(pa.`src_type`, pa.`dest_type`)
)
UNION
(
SELECT
`arrive_time`,
`parcel_type`,
CONCAT(`src_type`, `dest_type`)AS '流向',
COUNT(`parcel_id`) AS '包裹数',
'路侧包裹' AS '路/空'
FROM `i_od_parcel_landside`
GROUP BY `parcel_type`, CONCAT(`src_type`, `dest_type`)
)
