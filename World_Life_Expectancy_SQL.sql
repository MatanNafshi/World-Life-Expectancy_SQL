# World Life Expectancy Project

# ----------------------------
# Setup and Initial Inspection
# ----------------------------

USE world_life_expectancy;

# Preview the data to understand its structure
SELECT * FROM world_life_expectancy;

# -----------------------
# Data Cleaning
# -----------------------

# 1. Remove Duplicate Records
# Check for duplicates based on Country and Year and delete them
SELECT *
FROM (
    SELECT Row_ID,
           CONCAT(Country, Year),
           ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS Row_Num
    FROM world_life_expectancy
) AS Row_table
WHERE Row_Num > 1;

DELETE FROM world_life_expectancy
WHERE Row_ID IN (
    SELECT Row_ID
    FROM (
        SELECT Row_ID,
               CONCAT(Country, Year),
               ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS Row_Num
        FROM world_life_expectancy
    ) AS Row_table
    WHERE Row_Num > 1
);

# 2. Check for Missing or Inconsistent Status Values
# Look for rows where status is empty
SELECT *
FROM world_life_expectancy
WHERE status = '';

# Confirm available status types and ensure consistency
SELECT DISTINCT(status)
FROM world_life_expectancy
WHERE status <> '';

# Update missing status values based on other rows with the same Country
UPDATE world_life_expectancy t1
INNER JOIN world_life_expectancy t2
    ON t1.Country = t2.Country
SET t1.Status = 'Developing'
WHERE t1.Status = ''
  AND t2.Status = 'Developing';

UPDATE world_life_expectancy t1
INNER JOIN world_life_expectancy t2
    ON t1.Country = t2.Country
SET t1.Status = 'Developed'
WHERE t1.Status = ''
  AND t2.Status = 'Developed';

# Re-check for any remaining empty status rows
SELECT *
FROM world_life_expectancy
WHERE Status = '' OR Status IS NULL;

# 3. Handle Missing Life Expectancy Data
# Identify records where Life Expectancy is missing
SELECT *
FROM world_life_expectancy
WHERE `Life expectancy` = '';

# Calculate and update missing Life Expectancy using the average of adjacent years
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
    ON t1.Country = t2.Country
    AND t1.Year = t2.Year - 1
JOIN world_life_expectancy t3
    ON t1.Country = t3.Country
    AND t1.Year = t3.Year + 1
SET t1.`Life expectancy` = ROUND((t2.`Life expectancy` + t3.`Life expectancy`) / 2, 1)
WHERE t1.`Life expectancy` = '';

# -----------------------------
# Exploratory Data Analysis
# -----------------------------

# 1. General Overview
# Preview the cleaned dataset
SELECT * FROM world_life_expectancy;

# 2. Life Expectancy Trends by Country
# Determine max and min life expectancy and increase over 15 years for each country
SELECT Country,
       MIN(`Life Expectancy`) AS Min_Life_Exp,
       MAX(`Life Expectancy`) AS Max_Life_Exp,
       ROUND(MAX(`Life Expectancy`) - MIN(`Life Expectancy`), 1) AS Life_Exp_Change
FROM world_life_expectancy
GROUP BY Country
HAVING Min_Life_Exp <> 0 AND Max_Life_Exp <> 0
ORDER BY Life_Exp_Change ASC;

# 3. Global Life Expectancy Trends
# Find average life expectancy over time
SELECT Year, ROUND(AVG(`Life Expectancy`), 2) AS Avg_Life_Exp
FROM world_life_expectancy
WHERE `Life Expectancy` <> 0
GROUP BY Year
ORDER BY Year;

# 4. GDP Correlation Analysis
# Explore life expectancy in relation to GDP and status

# GDP vs. Life Expectancy by Country
SELECT Country,
       ROUND(AVG(`Life Expectancy`), 1) AS Avg_Life_Exp,
       ROUND(AVG(GDP), 1) AS Avg_GDP
FROM world_life_expectancy
GROUP BY Country
HAVING Avg_Life_Exp > 0 AND Avg_GDP > 0
ORDER BY Avg_GDP DESC;

# Compare life expectancy for countries with high and low GDP
SELECT
    SUM(CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) AS High_GDP_Count,
    AVG(CASE WHEN GDP >= 1500 THEN `Life Expectancy` ELSE NULL END) AS High_GDP_Life_Exp,
    SUM(CASE WHEN GDP < 1500 THEN 1 ELSE 0 END) AS Low_GDP_Count,
    AVG(CASE WHEN GDP < 1500 THEN `Life Expectancy` ELSE NULL END) AS Low_GDP_Life_Exp
FROM world_life_expectancy;

# 5. Status-based Analysis
# Explore life expectancy averages by development status
SELECT Status,
       ROUND(AVG(`Life Expectancy`), 1) AS Avg_Life_Exp
FROM world_life_expectancy
GROUP BY Status;

# 6. Rolling Totals for Adult Mortality
# Calculate cumulative sum of Adult Mortality by country and year
SELECT Country,
       Year,
       `Life Expectancy`,
       `Adult Mortality`,
       SUM(`Adult Mortality`) OVER (PARTITION BY Country ORDER BY Year) AS Rolling_Total
FROM world_life_expectancy
WHERE Country LIKE '%United%';

# End of Exploratory Data Analysis