-- Lakeflow Pipeline: Streaming, Materialized view, view
--path: s3://jpmctraining/input_files/sales

--ingesting sales to bronze
create streaming table sales_pipeline_bronze as
select * from stream read_files("s3://jpmctraining/input_files/sales",format => "csv");

--ingesting products to bronze
create streaming table products_pipeline_bronze as
select * from stream read_files("s3://jpmctraining/input_files/products",format => "csv");

--ingesting customer to bronze
create streaming table customers_pipeline_bronze as
select * from stream read_files("s3://jpmctraining/input_files/customers",format => "csv");