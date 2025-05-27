
-- 1. Remove rows with NULL values
DELETE FROM sales_data WHERE product IS NULL OR region IS NULL;

-- 2. Standardize region names
UPDATE sales_data SET region = 'North' WHERE region ILIKE 'nort%';

-- 3. Clean product names (trim whitespace, capitalize)
UPDATE sales_data SET product = INITCAP(TRIM(product));

-- 4. Find top 3 selling products
SELECT product, SUM(units_sold) AS total_units FROM sales_data
GROUP BY product ORDER BY total_units DESC LIMIT 3;

-- 5. Average revenue per region
SELECT region, AVG(units_sold * unit_price) AS avg_revenue FROM sales_data
GROUP BY region;
