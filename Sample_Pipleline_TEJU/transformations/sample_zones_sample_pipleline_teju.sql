-- This file defines a sample transformation.
-- Edit the sample below or add new transformations
-- using "+ Add" in the file browser.

CREATE MATERIALIZED VIEW `sample_zones_sample_pipleline_teju` AS
SELECT
    pickup_zip,
    SUM(fare_amount) AS total_fare
FROM `sample_trips_sample_pipleline_teju`
GROUP BY pickup_zip
