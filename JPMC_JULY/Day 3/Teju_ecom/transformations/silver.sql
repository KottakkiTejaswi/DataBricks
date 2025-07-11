create streaming table teju_silver.sales_cleaned_pl
(CONSTRAINT valid_order_id EXPECT (order_id IS NOT NULL) ON VIOLATION DROP ROW)
as
Select distinct * from stream sales_pipeline_bronze;


CREATE FLOW product_flow
AS AUTO CDC INTO
teju_silver.products_cleaned
FROM stream(products_pipeline_bronze)
KEYS(product_id)
APPLY AS DELETE when operation="DELETE"
SEQUENCE BY seqNum
COLUMNS * EXCEPT (operation,seqNum, _rescued_data)
STORED as SCD TYPE 1;
 
 
 
CREATE OR REFRESH STREAMING TABLE teju_silver.customers_cleaned;
 
CREATE FLOW customer_flow
AS AUTO CDC INTO
teju_silver.customers_cleaned
FROM stream(customers_pipeline_bronze)
KEYS(customer_id)
APPLY AS DELETE when operation="DELETE"
SEQUENCE BY sequenceNum
COLUMNS * EXCEPT (operation,sequenceNum, _rescued_data)
STORED as SCD TYPE 2;



 