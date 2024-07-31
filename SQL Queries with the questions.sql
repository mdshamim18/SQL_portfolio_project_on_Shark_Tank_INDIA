-- 1. Retrieve all data from the table
SELECT * FROM sti;

-- 2. Total episodes in the Shark Tank India
SELECT COUNT(DISTINCT episode_number) FROM sti;

-- 3. Total pitches pitched by the startups
SELECT COUNT(DISTINCT startup_number) FROM sti;

-- 4. Total male contestants in the Shark Tank India
SELECT SUM(male) FROM sti;

-- 5. Total female contestants in the Shark Tank India
SELECT SUM(female) FROM sti;

-- 6. Success rate of the startups
SELECT 
    COUNT(*) AS total_startups,
    SUM(deal_offered) AS startups_with_deals,
    (SUM(deal_offered) * 100.0 / COUNT(*)) AS success_rate
FROM sti;

-- 7. Top 5 sectors with the most investment
SELECT TOP 5 sector, SUM(deal_amount_lakhs) AS TotalInvestment
FROM sti
GROUP BY sector
ORDER BY TotalInvestment DESC;

-- 8. Average amount asked vs average amount invested
SELECT 
    AVG(startup_ask_amount_lakhs) AS average_ask_amount,
    AVG(deal_amount_lakhs) AS average_invested_amount
FROM sti
WHERE deal_offered = 1;

-- 9. Total investment of the individual sharks
SELECT 
    'Aman' AS shark, SUM(aman_invested) AS total_investments_in_lakhs FROM sti
UNION
SELECT 
    'Anupam', SUM(anupam_invested) FROM sti
UNION
SELECT 
    'Ashneer', SUM(ashneer_invested) FROM sti
UNION
SELECT 
    'Ghazal', SUM(ghazal_invested) FROM sti
UNION
SELECT 
    'Namita', SUM(namita_invested) FROM sti
UNION
SELECT 
    'Peyush', SUM(peyush_invested) FROM sti
UNION
SELECT 
    'Vineeta', SUM(vineeta_invested) FROM sti;


-- 10. Total invested amount and average deal size by sector-wise
SELECT 
    sector,
    COUNT(*) AS total_startups,
    SUM(deal_amount_lakhs) AS total_invested_amount,
    AVG(deal_amount_lakhs) AS average_deal_size
FROM sti
GROUP BY sector
ORDER BY total_invested_amount DESC;

-- 11. Geographical analysis
SELECT 
    location,
    COUNT(*) AS total_startups,
    SUM(deal_offered) AS startups_with_deals,
    (SUM(deal_offered) * 100.0 / COUNT(*)) AS success_rate
FROM sti
GROUP BY location;

-- 12. Episode-wise trends
SELECT 
    episode_number,
    COUNT(*) AS total_deals,
    SUM(deal_amount_lakhs) AS total_investments
FROM sti
WHERE deal_offered = 1
GROUP BY episode_number
ORDER BY total_investments DESC;

-- 13. Deals made by multiple sharks
SELECT 
    brand_name, sector, deal_amount_lakhs, sharks_offering
FROM sti
WHERE sharks_offering > 1;

-- 14. Identify episodes where deals were made with more than 3 team members
SELECT episode_number, brand_name, (male + female) AS team_members
FROM sti
WHERE (male + female) > 3;

-- 15. Number of deals and total investment per sector
SELECT 
    sector,
    COUNT(*) AS total_deals,
    SUM(deal_amount_lakhs) AS total_investment
FROM sti
WHERE deal_offered = 1
GROUP BY sector
ORDER BY total_deals DESC;

-- 16. Calculate the average asked amount by all entrepreneurs
SELECT 
    AVG(startup_ask_amount_lakhs) AS AvgAmountAsked
FROM sti;

-- 17. Calculate the total number of male and female contestants without considering their average age
SELECT 
    SUM(male) AS TotalMaleContestants,
	SUM(female) AS TotalFemaleContestants
FROM sti;

-- 18. Retrieve the episode number and brand name for episodes where deals were made
SELECT episode_number, brand_name
FROM sti
WHERE deal_offered IS NOT NULL;

-- 19. Find the top 5 locations with the highest average amount invested (in lakhs)
SELECT TOP 5 location, AVG(deal_amount_lakhs) AS AvgInvestment
FROM sti
GROUP BY location
ORDER BY AvgInvestment DESC;

-- 20. List the brands that received investments from all the sharks (Ashneer, Namita, Anupam)
SELECT brand_name
FROM sti
WHERE ashneer_invested IS NOT NULL
AND namita_invested IS NOT NULL
AND anupam_invested IS NOT NULL;

-- 21. Calculate the average equity taken by each sector
SELECT sector, AVG(deal_equity) AS AvgEquityTaken
FROM sti
GROUP BY sector
ORDER BY AvgEquityTaken DESC;

-- 22. Calculate the total investment amount made by each shark individually
SELECT SharkName, SUM(amount_invested_lakhs) AS TotalInvestment
FROM
    (
        SELECT episode_number, brand_name, 'Ashneer' AS SharkName, ashneer_invested AS amount_invested_lakhs FROM sti WHERE ashneer_invested IS NOT NULL
        UNION ALL
        SELECT episode_number, brand_name, 'Namita' AS SharkName, namita_invested AS amount_invested_lakhs FROM sti WHERE namita_invested IS NOT NULL
        UNION ALL
        SELECT episode_number, brand_name, 'Anupam' AS SharkName, anupam_invested AS amount_invested_lakhs FROM sti WHERE anupam_invested IS NOT NULL
        UNION ALL
        SELECT episode_number, brand_name, 'Ghazal' AS SharkName, ghazal_invested AS amount_invested_lakhs FROM sti WHERE ghazal_invested IS NOT NULL
        UNION ALL
        SELECT episode_number, brand_name, 'Peyush' AS SharkName, peyush_invested AS amount_invested_lakhs FROM sti WHERE peyush_invested IS NOT NULL
        UNION ALL
        SELECT episode_number, brand_name, 'Vineeta' AS SharkName, vineeta_invested AS amount_invested_lakhs FROM sti WHERE vineeta_invested IS NOT NULL
    ) AS CombinedInvestments
GROUP BY SharkName;

-- 23. Find episodes where the amount invested by Ashneer is more than the total amount invested by all other sharks combined
SELECT episode_number, brand_name
FROM sti
WHERE ashneer_invested > (namita_invested + anupam_invested);

-- 24. Determine the average equity asked by entrepreneurs from different locations, excluding episodes where no deals were made
SELECT location, AVG(deal_equity) AS AvgEquityAsked
FROM sti
WHERE deal_offered IS NOT NULL
GROUP BY location;

-- 25. Ranking deals by the investment wise taken from the sharks

SELECT episode_number,
       brand_name,
	   deal_amount_lakhs,
	   sector,
       DENSE_RANK() over (ORDER BY deal_amount_lakhs desc) as investment_ranking
FROM sti;

-- 26. Third highest investment taken from the shark

SELECT 
    episode_number,
    brand_name,
    deal_amount_lakhs,
	sector
FROM (
    SELECT 
        episode_number,
        brand_name,
        deal_amount_lakhs,
		sector,
        DENSE_RANK() OVER (ORDER BY deal_amount_lakhs DESC) AS rnk
    FROM sti
) AS ranked
WHERE rnk=3;

-- 27. Gender based analysis

SELECT 
    CASE 
        WHEN male > 0 AND female = 0 THEN 'Male Only'
        WHEN male = 0 AND female > 0 THEN 'Female Only'
        WHEN male > 0 AND female > 0 THEN 'Mixed'
        ELSE 'Unknown'
    END AS gender,
    COUNT(*) AS total_startups,
    SUM(deal_offered) AS startups_with_deals,
    (SUM(deal_offered) * 100.0 / COUNT(*)) AS success_rate
FROM sti
GROUP BY 
    CASE 
        WHEN male > 0 AND female = 0 THEN 'Male Only'
        WHEN male = 0 AND female > 0 THEN 'Female Only'
        WHEN male > 0 AND female > 0 THEN 'Mixed'
        ELSE 'Unknown'
    END;
