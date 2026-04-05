"The queries below are used to clean the data in the Financials table by removing unwanted characters
and converting the data types to FLOAT for numerical analysis." "The SQL queries provided are part of a data cleaning
    and analysis process for the Financials table.Here 's a breakdown of each query and its purpose:
1. **SELECT * FROM Financials**: This query retrieves all records from the Financials table. It is likely used to inspect the data before performing any cleaning operations, allowing the user to understand the structure and identify any issues with the data.
2. **UPDATE Financials SET ...**: This query is designed to clean the data in the Financials table by removing unwanted characters (such as ' $', ',
    ', '(', ') ', and ' - ') from the numerical fields and converting them to FLOAT data type for numerical analysis. Each field (units_sold, manufacturing_pr, sale_price, gross_sales, discounts, sales, cogs, profit) is processed to ensure that any non-numeric characters are stripped out, and empty or invalid entries are set to NULL.
   - `NULLIF` is used to handle cases where the cleaned string might be empty or contain only unwanted characters, converting such cases to NULL.
   - `REPLACE` is used to remove specific characters from the string, and `TRIM` is used to remove any leading or trailing whitespace.
3. **SELECT * FROM Financials GROUP BY ... HAVING COUNT(*) > 1**: This query is used to identify duplicate records in the Financials table. It groups the data by all relevant fields (channel_partners, country, product, discount_band, units_sold, manufacturing_pr, sale_price, gross_sales, discounts, sales, cogs, profit, date, month_number, month_name, year) and uses the HAVING clause to filter groups that have more than one record. This helps in identifying and potentially removing duplicate entries from the dataset.' Checking for Missing
Values in the Financials Table To check for missing
values in the Financials table,
    the SQL query below is used: This SQL query Below calculates the number of missing
values for each column in the Financials table.It uses the `SUM` function along with a `CASE` statement to count how many times each column contains a NULL value.The result will provide a summary of missing
values for each field,
    which can be useful for data cleaning
    and analysis purposes."
SELECT *
FROM Financials
UPDATE Financials
SET units_sold = NULLIF(
        NULLIF(
            REPLACE(REPLACE(TRIM(units_sold), '$', ''), ',', ''),
            '-'
        ),
        ''
    )::FLOAT,
    manufacturing_pr = NULLIF(
        NULLIF(
            REPLACE(
                REPLACE(TRIM(manufacturing_pr), '$', ''),
                ',',
                ''
            ),
            '-'
        ),
        ''
    )::FLOAT,
    sale_price = NULLIF(
        NULLIF(
            REPLACE(REPLACE(TRIM(sale_price), '$', ''), ',', ''),
            '-'
        ),
        ''
    )::FLOAT,
    gross_sales = NULLIF(
        NULLIF(
            REPLACE(REPLACE(TRIM(gross_sales), '$', ''), ',', ''),
            '-'
        ),
        ''
    )::FLOAT,
    discounts = NULLIF(
        NULLIF(
            REPLACE(REPLACE(TRIM(discounts), '$', ''), ',', ''),
            '-'
        ),
        ''
    )::FLOAT,
    sales = NULLIF(
        NULLIF(
            REPLACE(REPLACE(TRIM(sales), '$', ''), ',', ''),
            '-'
        ),
        ''
    )::FLOAT,
    cogs = NULLIF(
        NULLIF(
            REPLACE(REPLACE(TRIM(cogs), '$', ''), ',', ''),
            '-'
        ),
        ''
    )::FLOAT,
    profit = NULLIF(
        NULLIF(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(TRIM(profit), '$', ''),
                        '(',
                        ''
                    ),
                    ')',
                    ''
                ),
                ',',
                ''
            ),
            '-'
        ),
        ''
    )::FLOAT;
SELECT *
FROM Financials
GROUP BY channel_partners,
    country,
    product,
    discount_band,
    units_sold,
    manufacturing_pr,
    sale_price,
    gross_sales,
    discounts,
    sales,
    cogs,
    profit,
    date,
    month_number,
    month_name,
    year
HAVING COUNT(*) > 1
SELECT SUM(
        CASE
            WHEN channel_partners IS NULL THEN 1
            ELSE 0
        END
    ) AS missing_channel_partners,
    SUM(
        CASE
            WHEN country IS NULL THEN 1
            ELSE 0
        END
    ) AS missing_country,
    SUM(
        CASE
            WHEN product IS NULL THEN 1
            ELSE 0
        END
    ) AS missing_product,
    SUM(
        CASE
            WHEN discount_band IS NULL THEN 1
            ELSE 0
        END
    ) AS missing_discount_band,
    SUM(
        CASE
            WHEN units_sold IS NULL THEN 1
            ELSE 0
        END
    ) AS missing_units_sold,
    SUM(
        CASE
            WHEN manufacturing_pr IS NULL THEN 1
            ELSE 0
        END
    ) AS missing_manufacturing_pr,
    SUM(
        CASE
            WHEN sale_price IS NULL THEN 1
            ELSE 0
        END
    ) AS missing_sale_price,
    SUM(
        CASE
            WHEN gross_sales IS NULL THEN 1
            ELSE 0
        END
    ) AS missing_gross_sales,
    SUM(
        CASE
            WHEN discounts IS NULL THEN 1
            ELSE 0
        END
    ) AS missing_discounts,
    SUM(
        CASE
            WHEN sales IS NULL THEN 1
            ELSE 0
        END
    ) AS missing_sales,
    SUM(
        CASE
            WHEN cogs IS NULL THEN 1
            ELSE 0
        END
    ) AS missing_cogs,
    SUM(
        CASE
            WHEN profit IS NULL THEN 1
            ELSE 0
        END
    ) AS missing_profit,
    SUM(
        CASE
            WHEN date IS NULL THEN 1
            ELSE 0
        END
    ) AS missing_date,
    SUM(
        CASE
            WHEN month_number IS NULL THEN 1
            ELSE 0
        END
    ) AS missing_month_number,
    SUM(
        CASE
            WHEN month_name IS NULL THEN 1
            ELSE 0
        END
    ) AS missing_month_name,
    SUM(
        CASE
            WHEN year IS NULL THEN 1
            ELSE 0
        END
    ) AS missing_year
FROM Financials;
"Displaying the Cleaned Financials Data
After cleaning the data
    and checking for missing
values,
    you can display the cleaned Financials data using the following SQL query:"
SELECT Product,
    sales,
    profit
FROM Financials
SELECT Product,
    AVG(profit::float) AS average_profit
FROM Financials
GROUP BY Product
ORDER BY average_profit DESC;
SELECT channel_partners,
    country,
    product,
    sales,
    profit
FROM Financials
WHERE channel_partners = 'Government'
INSERT INTO Financials (product, sales, profit)
VALUES ('Soap', 15000, 2000);
SELECT product,
    sales,
    profit
FROM Financials
WHERE product = 'Soap';
UPDATE Financials
SET sales = 20000,
    profit = 2500
WHERE product = 'Soap';
SELECT product,
    sales,
    profit
FROM Financials
WHERE product = 'Soap';
DELETE FROM Financials
WHERE product = 'Soap';
SELECT product,
    sales,
    profit
FROM Financials
WHERE product = 'Soap';
SELECT country,
    AVG(sales::float) AS average_sales,
    AVG(profit::float) AS average_profit
FROM Financials
GROUP BY country
SELECT AVG(sales::float) AS average_sales,
    MAX(profit::float) AS max_profit,
    SUM(units_sold::float) AS total_units_sold
FROM Financials;
SELECT country,
    SUM(sales::float) AS total_sales_revenue
FROM Financials
GROUP BY country
ORDER BY total_sales_revenue DESC;
SELECT product,
    SUM(sales::float) AS total_sales_revenue
FROM Financials
GROUP BY product
ORDER BY total_sales_revenue DESC;
"Profitability Analysis profit margin = (profit / sales) * 100"
SELECT product,
    SUM(sales::float) AS total_sales,
    SUM(profit::float) AS total_profit,
    (SUM(profit::float) / SUM(sales::float)) * 100 AS profit_margin
FROM Financials
GROUP BY product
ORDER BY profit_margin DESC;
SELECT discount_band,
    SUM(sales::float) AS total_sales,
    SUM(profit::float) AS total_profit,
    (SUM(profit::float) / SUM(sales::float)) * 100 AS profit_margin
FROM Financials
GROUP BY discount_band
ORDER BY total_sales DESC;
WITH Input AS(
    SELECT 'Paseo' AS Selected_Product,
        290 AS Estimated_Units_Sold
)
SELECT i.Estimated_Units_Sold,
    AVG(f.manufacturing_pr::float) AS Average_Manufacturing_Cost,
    i.Estimated_Units_Sold * AVG(f.manufacturing_pr::float) AS Estimated_Total_Manufacturing_Budget
FROM Financials f
    JOIN Input i ON f.product = i.Selected_Product
GROUP BY i.Estimated_Units_Sold;
"Customer Segmentation Analysis"
SELECT channel_partners,
    Country,
    Product,
    SUM(sales::float) AS total_sales,
    SUM(profit::float) AS total_profit,
    SUM(units_sold::float) AS total_units_sold,
    AVG(discounts::float) AS total_discounts
FROM Financials
GROUP BY channel_partners,
    Country,
    Product
ORDER BY total_sales DESC
LIMIT 5;
"Monthly Sales Trends and Performance Analysis"
SELECT EXTRACT(
        MONTH
        FROM TO_DATE(date, 'DD/MM/YYYY')
    ) AS month_numbers,
    SUM(CAST(sales AS FLOAT)) AS total_sales
FROM Financials
WHERE EXTRACT(
        YEAR
        FROM TO_DATE(date, 'DD/MM/YYYY')
    ) = 2014
GROUP BY EXTRACT(
        MONTH
        FROM TO_DATE(date, 'DD/MM/YYYY')
    )
ORDER BY total_sales DESC;
"Identifying Products with High COGS and Low Profit"
SELECT CONCAT(product, ' - ', channel_partners, ' - ', country) AS Unique_id,
    product,
    cogs,
    profit,
    (profit::float / cogs::float) AS profit_to_cogs_ratio
FROM Financials
WHERE cogs::float > 50000
    AND profit::float < 10000
ORDER BY profit_to_cogs_ratio ASC;
"Financial Growth Projectionm and Sales Forecasting Explaining the below SQL Query in details.""'***The SQL query provided is designed to analyze monthly sales trends for the year 2014, calculate the monthly growth rate, and project sales for the next month based on the average growth rate. Here's a detailed breakdown of each part of the query: 
the query uses Common Table Expressions (CTEs) to structure the analysis into three main parts: Sales_Projection, Growth_Rate, and Average_Growth_Rate.
a. **Sales_Projection CTE**: This CTE calculates the total sales for each month in the year 2014. It extracts the month from the date field, sums up the sales for each month, and groups the results by month.
b. **Growth_Rate CTE**: This CTE calculates the monthly growth rate by comparing the total sales of the current month with the previous month using the LAG function. The growth rate is calculated as the percentage change from the previous month to the current month.
The growth rate is rounded to four decimal places for precision. The LAG function is used to access the total sales of the previous month, and the growth rate is calculated as (current_month_sales - previous_month_sales) / previous_month_sales.
therefore, the growth rate for the first month will be NULL since there is no previous month to compare with.
c. **Average_Growth_Rate CTE**: This CTE calculates the average monthly growth rate across all months in the year 2014. It uses the AVG function to compute the average of the monthly growth rates calculated in the Growth_Rate CTE.  
d. **Final SELECT Statement**: The final part of the query selects the month numbers, total sales, average monthly growth rate, and projected sales for the next month. 
The projected sales for the next month are calculated by applying the average growth rate to the total sales of the last month in the dataset. The results are ordered by month numbers to show the trend over time.'
Explaining each line of the SQL query in detail:
The WITH clause defines three Common Table Expressions (CTEs) that are used to structure the query and perform intermediate calculations:
1. **Sales_Projection CTE**:
   - `SELECT EXTRACT(MONTH FROM TO_DATE(date, 'DD/MM/YYYY'))::INTEGER AS month_numbers`: This line extracts the month from the date field, converts it to an integer, and aliases it as month_numbers.
   - `SUM(CAST(sales AS NUMERIC)) AS total_sales`: This line sums up the sales for each month and aliases it as total_sales. The sales are cast to NUMERIC to ensure accurate calculations.
   - `FROM Financials`: This specifies the source table for the data.
   - `WHERE EXTRACT(YEAR FROM TO_DATE(date, 'DD/MM/YYYY')) = 2014`: This filters the data to include only records from the year 2014.
   - `GROUP BY EXTRACT(MONTH FROM TO_DATE(date, 'DD/MM/YYYY'))`: This groups the results by month to calculate total sales for each month. 
2. **Growth_Rate CTE**:
   - `SELECT month_numbers, total_sales`: This selects the month numbers and total sales from the Sales_Projection CTE.
   - `ROUND((total_sales - LAG(total_sales) OVER (ORDER BY month_numbers)) * 1.0 / LAG(total_sales) OVER (ORDER BY month_numbers), 4)::NUMERIC AS Monthly_Growth_Rate`: This line calculates the monthly growth rate by comparing the total sales of the current month with the previous month using the LAG function. The growth rate is calculated as (current_month_sales - previous_month_sales) / previous_month_sales and rounded to four decimal places. The LAG function is used to access the total sales of the previous month, and the growth rate is calculated as (current_month_sales - previous_month_sales) / previous_month_sales. The growth rate for the first month will be NULL since there is no previous month to compare with.
3. **Average_Growth_Rate CTE**:
   - `SELECT ROUND(AVG(monthly_growth_rate), 4)::NUMERIC AS average_monthly_growth_rate`: This line calculates the average monthly growth rate across all months in the year 2014 by using the AVG function to compute the average of the monthly growth rates calculated in the Growth_Rate CTE. The result is rounded to four decimal places and aliased as average_monthly_growth_rate.
4. **Final SELECT Statement**:
   - `SELECT g.month_numbers, g.total_sales, a.average_monthly_growth_rate, a.average_monthly_growth_rate AS average_growth_rate`: This line selects the month numbers, total sales, and average monthly growth rate from the Growth_Rate and Average_Growth_Rate CTEs.
   - `CASE WHEN g.month_numbers = (SELECT MAX(month_numbers) FROM Growth_Rate) THEN ROUND(g.total_sales * (1 + a.average_monthly_growth_rate), 2)::NUMERIC ELSE NULL END AS projected_sales_for_next_month`: This line calculates the projected sales for the next month by applying the average growth rate to the total sales of the last month in the dataset. It uses a CASE statement to check if the current month is the last month in the Growth_Rate CTE. If it is, it calculates the projected sales as total_sales * (1 + average_monthly_growth_rate) and rounds it to two decimal places. If it is not the last month, it returns NULL for projected_sales_for_next_month.
   - `FROM Growth_Rate g CROSS JOIN Average_Growth_Rate a`: This line joins the Growth_Rate CTE with the Average_Growth_Rate CTE to access both sets of data in the final SELECT statement.
   - `ORDER BY g.month_numbers`: This line orders the results by month numbers to show the trend over time.***" WITH Sales_Projection AS (
    SELECT EXTRACT(
            MONTH
            FROM TO_DATE(date, 'DD/MM/YYYY')
        )::INTEGER AS month_numbers,
        SUM(CAST(sales AS NUMERIC)) AS total_sales
    FROM Financials
    WHERE EXTRACT(
            YEAR
            FROM TO_DATE(date, 'DD/MM/YYYY')
        ) = 2014
    GROUP BY EXTRACT(
            MONTH
            FROM TO_DATE(date, 'DD/MM/YYYY')
        )
),
Growth_Rate AS (
    SELECT month_numbers,
        total_sales,
        ROUND(
            (
                total_sales - LAG(total_sales) OVER (
                    ORDER BY month_numbers
                )
            ) * 1.0 / LAG(total_sales) OVER (
                ORDER BY month_numbers
            ),
            4
        )::NUMERIC AS Monthly_Growth_Rate
    FROM Sales_Projection
),
Average_Growth_Rate AS (
    SELECT ROUND(AVG(monthly_growth_rate), 4)::NUMERIC AS average_monthly_growth_rate
    FROM Growth_Rate
)
SELECT g.month_numbers,
    g.total_sales,
    a.average_monthly_growth_rate,
    a.average_monthly_growth_rate AS average_growth_rate,
    CASE
        WHEN g.month_numbers = (
            SELECT MAX(month_numbers)
            FROM Growth_Rate
        ) THEN ROUND(
            g.total_sales * (1 + a.average_monthly_growth_rate),
            2
        )::NUMERIC
        ELSE NULL
    END AS projected_sales_for_next_month
FROM Growth_Rate g
    CROSS JOIN Average_Growth_Rate a
ORDER BY g.month_numbers;
"Earning Before Interest, Taxes, Depreciation, Amortization (EBITDA) Analysis" "EBITDA is a financial metric that measures a company's operating performance by excluding non-operating expenses such as interest, taxes, depreciation, and amortization. It provides insight into the company's profitability from its core operations."
SELECT Country,
    SUM(
        sales::float - (manufacturing_pr::float * units_sold::float)
    ) AS Net_Income,
    SUM(
        (
            sales::float - (manufacturing_pr::float * units_sold::float)
        ) + 5000 + 3000 + 2000 + 1000
    ) AS EBITDA
FROM Financials
GROUP BY Country
ORDER BY EBITDA DESC;
"Operating Profit Analysis" "Operating profit, also known as operating income, is a financial metric that measures a company's profitability from its core business operations, excluding non-operating expenses such as interest and taxes. It is calculated by subtracting operating expenses (such as manufacturing costs, selling expenses, and administrative expenses) from gross profit."
SELECT Product,
    SUM(sales::float - cogs::float) AS Operating_Profit
FROM Financials
GROUP BY Product
ORDER BY Operating_Profit DESC;
