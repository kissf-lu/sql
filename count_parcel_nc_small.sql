#  ------------------  统计各种类别的件数分布------------------
SELECT
p.`parcel_type`,
COUNT(1)
FROM `i_od_parcel_landside` AS p
GROUP BY p.`parcel_type`;

SELECT
p.`parcel_type`,
COUNT(1)
FROM `i_od_parcel_airside` AS p
GROUP BY p.`parcel_type`

#  ------------------  统计小件数量------------------------------
SELECT
COUNT(DISTINCT p.`parcel_id`)
FROM `i_od_small_landside` AS p

SELECT
COUNT(DISTINCT p.`parcel_id`)
FROM `i_od_small_airside` AS p
#  -------------------统计小件数量 按照small_id统计  ----------------------

SELECT
COUNT(DISTINCT p.`small_id`)
FROM `i_od_small_landside` AS p

SELECT
COUNT(DISTINCT p.`small_id`)
FROM `i_od_small_airside` AS p

#  --------------------统计输出结果 -------------------------
SELECT
om.`parcel_type`,
COUNT(om.`parcel_id`)

FROM `o_machine_table` AS om
GROUP BY om.`parcel_type`

