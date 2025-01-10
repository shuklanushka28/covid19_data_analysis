# covid19_data_analysis
This project involves analyzing worldwide data on COVID-19 cases, vaccinations, and deaths spanning the period from January 28, 2020, to August 30, 2021. Using SQL, we aim to derive meaningful insights into the pandemic's progression, the impact of vaccination campaigns, and the global response to this unprecedented health crisis.

## Tools and Technologies
- Database Management System (DBMS): [Your DBMS, e.g., PostgreSQL, MySQL, SQLite]
- Programming Language: SQL
## Datase
The dataset contains the following key attributes:
- continent - Continent name.
- location - Country or region name.
- date - Date of the record.
- population - Population of the region.
- total_cases - Total confirmed COVID-19 cases.
- new_cases - Newly reported cases.
- total_deaths - Total COVID-19 deaths.
- new_deaths - Newly reported deaths.
- total_vaccinations - Total vaccine doses administered.
- tests_units - Units used for testing.

## Data Source 
<a href= https://ourworldindata.org/covid-deaths > Covid-19 DataBase </a>

## Key Objective 
-   Understand the Global Impact: Analyze trends in COVID-19 cases and deaths globally.
-   Assess Vaccination Campaigns: Examine the relationship between vaccination rates and the reduction of cases and deaths.
-   Identify Regional Disparities: Highlight differences in cases, deaths, and vaccinations across countries/regions.
-   Provide Actionable Insights: Generate data-driven insights to inform public health policies and strategies.

## Analysis Highlights
1. Global Trends
- Cases and Deaths:
   - Analysis of the progression of COVID-19 cases and deaths globally over time.
   - Identification of significant peaks, waves, and turning points.
  <img width="245" alt="total_cases" src="https://github.com/user-attachments/assets/16cc211b-288e-4dea-905c-b4e87760ad10" />

- Vaccination Progress:
   - Tracking the rollout of vaccines and their adoption rate across regions.
2. Regional Disparities
- mpact by Continent/Country:
   - Comparison of the total cases, deaths, and vaccination rates among continents and specific countries.
   - Highlighting countries with the highest and lowest case fatality rates (deaths per case).
- Population-Based Metrics:
   - Insights into cases, deaths, and vaccinations normalized per million population to identify regions most and least affected.
3. Correlation and Effectiveness of Vaccinations
- Analysis of the relationship between vaccination rates and the decline in new cases and deaths.
- Correlation between the number of vaccinations and the reduction in the severity of subsequent COVID-19 waves.
4. Mortality and Severity Indicators
- Case fatality rate (deaths per confirmed cases) trends over time and across countries.
- Identifying vulnerable regions by combining data on deaths, median age, and access to healthcare (e.g., hospital beds per thousand).
<img width="381" alt="worldwide_death_percentage_covid19" src="https://github.com/user-attachments/assets/b0722f1c-4622-4293-a4d9-08cc682e63c9" />






