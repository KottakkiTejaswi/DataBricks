-- This file defines a sample transformation.
-- Edit the sample below or add new transformations
-- using "+ Add" in the file browser.

CREATE MATERIALIZED VIEW `sample_trips_sample_pipleline_teju` AS
SELECT
    pickup_zip,
    fare_amount
FROM samples.nyctaxi.trips;


CREATE MATERIALIZED VIEW trips as
select * from samples.nyctaxi.trips