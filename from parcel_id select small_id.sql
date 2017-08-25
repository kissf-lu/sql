SELECT
s.`parcel_id`,
s.`small_id`,
s.`parcel_type`
FROM `i_od_small_airside` AS s
WHERE s.`parcel_id` IN (
      SELECT 
      DISTINCT t.parcel_id
      FROM(
            SELECT 
                f.parcel_id
             FROM `i_od_parcel_airside` AS f
             WHERE f.`parcel_type`='small'
             ORDER BY f.`arrive_time`
       ) AS t
)
GROUP BY s.`parcel_id`,s.`small_id`

SELECT
s.`parcel_id`,
s.`small_id`,
s.`parcel_type`
FROM `i_od_small_landside` AS s
WHERE s.`parcel_id` IN (
      SELECT 
      DISTINCT t.parcel_id
      FROM(
            SELECT 
                f.parcel_id
             FROM `i_od_parcel_landside` AS f
             WHERE f.`parcel_type`='small'
             ORDER BY f.`arrive_time`
       ) AS t
)
GROUP BY s.`parcel_id`,s.`small_id`
