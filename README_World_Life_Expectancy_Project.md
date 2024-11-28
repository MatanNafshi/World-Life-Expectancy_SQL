# **World Life Expectancy Analysis Project**

This project leverages **SQL** and **Python** to analyze and explore the World Life Expectancy dataset. The dataset provides metrics such as life expectancy, adult mortality, GDP, and various health indicators for countries worldwide, spanning multiple years. By combining SQL for data preprocessing and Python for advanced analysis and machine learning, this project offers a comprehensive approach to understanding global health trends.

---

## **Files Included**

- **`World_Life_Expectancy_SQL.sql`**: Contains SQL queries for data cleaning, exploratory data analysis (EDA), and deriving insights from the dataset.
- **`WorldLifeExpectancy.csv`**: The raw dataset, including life expectancy and health-related indicators, in CSV format.
- **`analysis.py`**: Python script implementing data exploration, machine learning models, and visualizations.

---

## **Dataset Overview**

The dataset includes the following columns:

- **Country**: Name of the country.
- **Year**: Year of the data point.
- **Status**: Development status of the country (Developed/Developing).
- **Life Expectancy**: Average life expectancy for the year in the country.
- **Adult Mortality**: Adult deaths per 1,000 people.
- **Infant Deaths**: Infant deaths per 1,000 live births.
- **Percentage Expenditure**: Percentage of government expenditure on health.
- **Measles**: Reported measles cases.
- **BMI**: Average body mass index of the population.
- **Under-Five Deaths**: Deaths of children under five per 1,000 people.
- **Polio**: Immunization coverage for polio (%).
- **Diphtheria**: Immunization coverage for diphtheria (%).
- **HIV/AIDS**: HIV/AIDS death rate per 1,000 adults aged 15–49.
- **GDP**: Gross Domestic Product per capita (in USD).
- **Thinness 1-19 years**: Percentage of thinness in the population aged 1-19.
- **Thinness 5-9 years**: Percentage of thinness in the population aged 5-9.
- **Schooling**: Average years of schooling.
- **Row_ID**: Unique identifier for each row.

---

## **SQL Analysis**

### **Data Cleaning**
- **Remove Duplicates**: Ensures each `Country-Year` pair is unique to avoid redundant analysis.
- **Handle Missing Values**: 
  - Fills missing `Life Expectancy` values using the average of adjacent years.
  - Resolves missing `Status` values based on other records for the same country.

### **Exploratory Data Analysis (EDA)**
- **Life Expectancy Trends**: Tracks changes in life expectancy over time for each country and identifies the top 10 countries with the largest improvements.
- **GDP vs Life Expectancy**: Evaluates how GDP correlates with life expectancy, highlighting differences between high- and low-GDP nations.
- **Status-Based Analysis**: Compares life expectancy between developed and developing countries.
- **Health Indicators**: Analyzes relationships between BMI, immunization rates, and life expectancy.

### **Rolling Totals**
- Computes cumulative metrics like Adult Mortality for better trend tracking.

---

## **Python Analysis**

### **Key Features**
- **Data Preprocessing**:
  - Handles missing values, applies log transformations to skewed features like GDP, and encodes categorical variables (e.g., `Status`).
- **Machine Learning**:
  - Implements a **Random Forest Regressor** for predicting life expectancy using features like GDP, BMI, schooling, and development status.
  - Hyperparameter optimization via `RandomizedSearchCV` ensures the best model performance.
- **Model Performance**:
  - **RMSE**: 4.89
  - **R²**: 0.76
  - These metrics demonstrate the model's effectiveness in predicting life expectancy.

### **Visualizations**
- Feature Importance: Highlights the most impactful factors on life expectancy.
- Predicted vs Actual: Validates the model's predictive power.
- Residual Analysis: Evaluates prediction accuracy.

---

## **How to Use**

### **Setup**
1. **Database Creation**:
   - Import the `WorldLifeExpectancy.csv` into a relational database (e.g., MySQL or SQLite) using tools like SQL Workbench or Python's `sqlite3`.
   - Ensure the table is named `world_life_expectancy`.

2. **Run SQL Queries**:
   - Use the `World_Life_Expectancy_SQL.sql` file to clean and analyze the dataset.

3. **Execute Python Analysis**:
   - Use the `analysis.py` script to:
     - Perform advanced machine learning and feature engineering.
     - Visualize results for deeper insights.

### **Dependencies**
- Install required Python libraries using:
  ```bash
  pip install -r requirements.txt
