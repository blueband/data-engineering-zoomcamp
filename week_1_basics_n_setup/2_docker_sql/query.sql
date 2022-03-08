-- How to join multiple table

SELECT 
	tpep_pickup_datetime,
	tpep_dropoff_datetime,
	total_amount,
	CONCAT(zpu."Borough", ' / ', zpu."Zone", ' / ') AS pick_up_location,
	CONCAT(zdp."Borough", ' / ', zdp."Zone", ' / ' ) AS dropoff_location
FROM
	yellow_taxi_data t,
	zones zpu,
	zones zdp
WHERE
	t."PULocationID" = zpu."LocationID" AND
	t."DOLocationID" = zdp."LocationID"
	
LIMIT 100;


-- 