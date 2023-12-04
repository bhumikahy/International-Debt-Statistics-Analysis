-- Let's see the overview of our datasets --
SELECT *
FROM international_debt
LIMIT 10;

-- Exploratory Data Analysis (EDA)--

-- How many rows do we have in our dataset? --
SELECT COUNT(*) AS num_rows
FROM international_debt;

-- How many columns do we have in our dataset? --
SELECT COUNT(*) AS num_cols
FROM information_schema.columns
WHERE table_name = 'international_debt';

-- Number of distinct countries --
SELECT COUNT(DISTINCT country_name) AS total_distinct_countries
FROM international_debt;

-- Number of distinct debt indicators --
SELECT DISTINCT indicator_code AS distinct_debt_indicators
FROM international_debt
ORDER BY distinct_debt_indicators;

-- Total amount of debt owned by the countries --
SELECT ROUND(SUM(debt) / 1000000, 2) AS total_debt
FROM international_debt;

-- Country with the highest debt --
SELECT country_name, SUM(debt) AS total_debt
FROM international_debt
GROUP BY country_name
ORDER BY total_debt DESC
LIMIT 1;

-- Average amount of debt across indicators --
SELECT indicator_code AS debt_indicator, 
indicator_name, 
AVG(debt) AS average_debt
FROM international_debt
GROUP BY debt_indicator, indicator_name
ORDER BY average_debt DESC
LIMIT 10;

-- Which country has the highest amount of principal repayments --
SELECT country_name, indicator_name
FROM international_debt
WHERE debt = (SELECT MAX(debt)
			 FROM international_debt
			 WHERE indicator_code = 'DT.AMT.DLXF.CD');

-- Most common debt indicator --
SELECT indicator_code, COUNT(indicator_code) AS indicator_count
FROM international_debt
GROUP BY indicator_code
ORDER BY indicator_count DESC, indicator_code DESC
LIMIT 20;

-- Max amount of debt each country has --
SELECT country_name, MAX(debt) AS maximum_debt
FROM international_debt
GROUP BY country_name
ORDER BY maximum_debt DESC
LIMIT 10;