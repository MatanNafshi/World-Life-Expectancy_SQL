
**World Life Expectancy SQL Project**

This project contains SQL queries designed for analyzing and exploring the World Life Expectancy dataset. The dataset includes various metrics such as life expectancy, adult mortality, GDP, and health indicators for different countries over multiple years.

---

**Files Included**

- **World_Life_Expectancy_SQL.sql**: This file contains all the SQL queries used for data cleaning, exploratory data analysis (EDA), and deriving insights from the dataset.
- **WorldLifeExpectancy.csv**: The dataset in CSV format that includes life expectancy data and additional health-related indicators.

---

**Dataset Overview**

The dataset contains the following columns:

- **Country**: Name of the country.
- **Year**: Year of the data point.
- **Status**: The development status of the country (Developed/Developing).
- **Life Expectancy**: The life expectancy for that year in the country.
- **Adult Mortality**: The number of adult deaths per 1,000 people.
- **Infant Deaths**: The number of infant deaths per 1,000 live births.
- **Percentage Expenditure**: The percentage of government expenditure on health.
- **Measles**: The number of reported measles cases.
- **BMI**: The average body mass index of the population.
- **Under-Five Deaths**: The number of deaths for children under five per 1,000 people.
- **Polio**: Immunization coverage for polio (percentage).
- **Diphtheria**: Immunization coverage for diphtheria (percentage).
- **HIV/AIDS**: HIV/AIDS death rate (per 1,000 adults aged 15–49).
- **GDP**: Gross Domestic Product per capita (in US dollars).
- **Thinness 1-19 years**: Percentage of thinness in the population aged 1-19 years.
- **Thinness 5-9 years**: Percentage of thinness in the population aged 5-9 years.
- **Schooling**: Average number of years of schooling.
- **Row_ID**: Unique identifier for each row.

---

**SQL Queries**

**Data Cleaning**

- **Remove Duplicates**: Identifies and removes duplicate rows based on Country and Year to ensure no repeated entries.
- **Handle Missing Data**: Fills in missing values for Life Expectancy using the average of surrounding years and ensures the Status field is consistent.

**Exploratory Data Analysis (EDA)**

- **Life Expectancy Trends**: Computes the minimum and maximum life expectancy for each country and calculates the increase in life expectancy over time.
- **GDP vs Life Expectancy**: Analyzes the correlation between GDP and life expectancy, showing how life expectancy trends differ in countries with high versus low GDP.
- **Status-based Analysis**: Computes the average life expectancy for developed and developing countries.
- **Health Indicators**: Looks into metrics such as BMI, infant mortality, and immunization coverage.

**Rolling Totals**

- Calculates rolling totals for specific metrics, such as Adult Mortality, to track cumulative data over time for each country.

---

**How to Use**

1. **Import the Dataset**:
   - Load the `WorldLifeExpectancy.csv` dataset into your database using appropriate tools or SQL commands.

2. **Run the SQL Queries**:
   - The `World_Life_Expectancy_SQL.sql` file contains SQL queries that can be run in any SQL environment (e.g., MySQL, PostgreSQL) for analysis and exploration.

3. **Required Table Schema**:
   - The queries assume the table is named `world_life_expectancy` and includes the columns described above. Make sure the dataset is loaded correctly before running the queries.

---

**License**

This project is for educational purposes. Feel free to modify and adapt it to your own use cases.
