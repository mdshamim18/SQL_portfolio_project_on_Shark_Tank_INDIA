# Project: Analyzing Shark Tank India Data Using SQL

## Introduction
"Shark Tank India" is a popular television show where entrepreneurs pitch their business ideas to a panel of investors, or "sharks," in the hope of securing investment. The show provides a fascinating insight into the startup ecosystem and investor behavior. This project aims to analyze the data from Season 1 of "Shark Tank India" to extract valuable insights into startup success rates, investment patterns, sector preferences, and more.

## Objective
The primary goal of this project is to perform a comprehensive analysis of the data from "Shark Tank India" Season 1 using SQL. By doing so, we aim to uncover trends and patterns that can be valuable for entrepreneurs, investors, and researchers interested in the dynamics of startup funding.

## Data Overview
The dataset contains detailed information about the startups that appeared on "Shark Tank India" Season 1. Key attributes include:
1. Episode and startup numbers
2. Brand name and location
3. Description and sector
4. Gender of founders
5. Deal details, including the amount asked, deal offered, and specific investments by each shark
6. Information on the sharks involved in the deals

## Problem Statement
### Challenges:
1. **Data Volume:** With multiple episodes and numerous startups, managing and analyzing the data can be complex.
2. **Investment Patterns:** Understanding the investment behavior of each shark requires detailed analysis.
3. **Sector Analysis:** Identifying which sectors are most attractive to investors involves aggregating and summarizing data effectively.
4. **Geographical Insights:** Analyzing the success rates of startups based on their location requires proper segmentation.

## Project Objectives

### Startup Success Analysis
- **Success Rate:** Identify the success rate of startups in securing deals, providing insights into which factors contribute to a startup's ability to attract investment.
- **Funding Dynamics:** Analyze the average amount asked by entrepreneurs versus the amount invested by sharks, highlighting discrepancies and potential negotiation trends.

### Shark Investment Patterns
- **Frequency of Investments:** Determine which sharks (investors) invest most frequently, offering a perspective on their investment strategies and preferences.
- **Equity Analysis:** Calculate the average equity taken by each shark, helping to understand the cost of capital from different investors.

### Sector-Wise Investment Analysis
- **Sector Popularity:** Analyze which sectors attract the most investment, guiding startups on potential high-interest areas.
- **Deal Size:** Determine the average deal size per sector, providing benchmarks for entrepreneurs.

### Geographical Analysis
- **Location Trends:** Identify the most common locations of startups, highlighting geographic hotspots for entrepreneurial activity.
- **Location Success Rate:** Analyze the success rate of startups based on their location, offering insights into regional investment climates.

### Gender-Based Analysis
- **Gender Comparison:** Compare the success rates of male vs. female-founded startups, contributing to discussions on gender diversity in entrepreneurship.
- **Investment Amounts:** Analyze the average investment amounts for startups with different gender compositions, providing data on gender-related funding dynamics.

### Episode-Wise Trends
- **Deal and Investment Tracking:** Track the number of deals and total investments across different episodes, identifying patterns over time.
- **Investment Trends:** Identify any trends in investment amounts over time, providing insights into changing investor behavior and market conditions.

## Analysis and Results

### Startup Success Analysis
- **Success Rate:** 58% of startups secured deals, indicating a healthy investment climate.
- **Funding Dynamics:** On average, startups asked for average 60,00,000 but received 56,00,000, showing a 7% reduction from ask to actual investment.

### Shark Investment Patterns
- **Frequent Investors:** Shark 'Aman' invested in 29 deals, the highest among all.
- **Equity Taken:** On average, Shark 'Vineeta' took 10% equity, which is higher than the average of 7% taken by others.

### Sector-Wise Investment Analysis
- **Popular Sectors:** Lifestyle sector attracted 40% of total investments.
- **Deal Size:** Average deal size in the lifestyle sector was 10,06,00,000, the highest among all sectors.

### Geographical Analysis
- **Location Trends:** 50% of startups were based in Ahmedabad, Bengalore, Kolkata.
- **Location Success Rate:** Startups in these cities had an 60% success rate, the highest among all regions.

### Gender-Based Analysis
- **Gender Comparison:** Female-founded startups had a 65% success rate, compared to 70% for male-founded startups.

### Episode-Wise Trends
- **Deal and Investment Tracking:** Episodes 1-10 had 50 deals with 2cr 80lakhs total investments.

## Conclusion
This project demonstrates the power of SQL in extracting actionable business insights from investment data. By understanding the dynamics of startup funding, investment patterns of sharks, and sector-wise trends, entrepreneurs and investors can make more informed decisions. The analyses also shed light on geographical and gender-based disparities, providing a comprehensive overview of the startup investment landscape.

### Future Work
- Extend the analysis to subsequent seasons for a longitudinal study.
- Incorporate additional data sources, such as market trends or financial performance of funded startups, for a more holistic view.
- Develop predictive models to forecast the success of future pitches based on historical data.

## Data
- **Source:** Shark Tank India Data from Wikipedia and Google.
- **Data Analysis & Extraction:** MS SQL Server

---

## Questions :

-- 1. Retrieve all data from the table
-- 2. Total episodes in the Shark Tank India
-- 3. Total pitches pitched by the startups
-- 4. Total male contestants in the Shark Tank India
-- 5. Total female contestants in the Shark Tank India
-- 6. Success rate of the startups
-- 7. Top 5 sectors with the most investment
-- 8. Average amount asked vs average amount invested
-- 9. Total investment of the individual sharks
-- 10. Average equity taken by shark sector-wise
-- 11. Geographical analysis
-- 12. Episode-wise trends
-- 13. Deals made by multiple sharks
-- 14. Identify episodes where deals were made with more than 3 team members
-- 15. Number of deals and total investment per sector
-- 16. Calculate the average asked amount by all entrepreneurs
-- 17. Calculate the total number of male and female contestants without considering their average age
-- 18. Retrieve the episode number and brand name for episodes where deals were made
-- 19. Find the top 5 locations with the highest average amount invested (in lakhs)
-- 20. List the brands that received investments from all the sharks (Ashneer, Namita, Anupam)
-- 21. Calculate the average equity taken by each sector
-- 22. Calculate the total investment amount made by each shark individually
-- 23. Find episodes where the amount invested by Ashneer is more than the total amount invested by all other sharks combined
-- 24. Determine the average equity asked by entrepreneurs from different locations, excluding episodes where no deals were made

