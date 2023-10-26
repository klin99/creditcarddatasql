USE [CreditCardCustomersDataCleaning];

SELECT *
FROM [dbo].[creditcarddata]
WHERE Attrition_Flag = 'Existing Customer'
AND Education_Level IN ('Graduate', 'Post-Graduate')
AND Marital_Status = 'Single'
ALTER TABLE [dbo].[creditcarddata]
ALTER COLUMN Income_Category VARCHAR(255) NULL;
UPDATE [dbo].[creditcarddata]
SET Income_Category = NULL
WHERE Income_Category = 'Unknown';
UPDATE [dbo].[creditcarddata]
SET Income_Category = REPLACE(Income_Category, '$', '')
WHERE Attrition_Flag = 'Existing Customer'
AND Education_Level IN ('Graduate', 'Post-Graduate')
AND Marital_Status = 'Single';
ALTER TABLE [dbo].[creditcarddata]
ADD Yearsonbook as CAST(Months_on_book / 12.0 as DECIMAL(10, 2));

-- Do clients with higher credit limit have higher total average transaction count? 
Select
Case When Credit_Limit > 10000 then 'high credit limit'
Else 'low credit limit'
End as credit_limit_group, 
AVG(Total_Trans_Ct) AS Average_Transaction_Count
From [dbo].[creditcarddata]
Group by
Case When Credit_Limit > 10000 then 'high credit limit'
Else 'low credit limit'
End;

-- What is the difference of average total transaction amount between graduate and post graduate level clients?
SELECT AVG(Total_Trans_Amt) AS AVG_Trans_Amt_Graduate
FROM [dbo].[creditcarddata]
WHERE Education_Level = 'Graduate';

SELECT AVG(Total_Trans_Amt) AS AVG_Trans_Amt_PostGraduate
FROM [dbo].[creditcarddata]
WHERE Education_Level = 'Post-Graduate';


SELECT 
    (SELECT AVG(Total_Trans_Amt) FROM [dbo].[creditcarddata] WHERE Education_Level = 'Graduate') -
    (SELECT AVG(Total_Trans_Amt) FROM [dbo].[creditcarddata] WHERE Education_Level = 'Post-Graduate') AS Difference_AVG_Transaction_Amount;

-- What is the average credit limit for each card category (e.g., Blue, Silver, Gold, Platinum) among existing customers?
SELECT Card_Category, AVG(Credit_Limit) AS Avg_Credit_Limit
FROM [dbo].[creditcarddata]
WHERE Attrition_Flag = 'Existing Customer'
GROUP BY Card_Category;

-- Do customers with higher total relationship counts tend to have higher credit limits?
SELECT Total_Relationship_Count, AVG(Credit_Limit) AS Avg_Credit_Limit
FROM [dbo].[creditcarddata]
WHERE Attrition_Flag = 'Existing Customer'
GROUP BY Total_Relationship_Count;

-- Is there a correlation between the average total transaction amount and the average total transaction count?
SELECT AVG(Total_Trans_Amt) AS Avg_Transaction_Amount, AVG(Total_Trans_Ct) AS Avg_Transaction_Count
FROM [dbo].[creditcarddata]
GROUP BY Attrition_Flag;
-- (You can perform a correlation analysis if you want to find the correlation coefficient)

-- What is the distribution of average utilization ratios among customers with different education levels and marital statuses?**
SELECT Education_Level, Marital_Status, AVG(Avg_Utilization_Ratio) AS Avg_Utilization_Ratio
FROM [dbo].[creditcarddata]
GROUP BY Education_Level, Marital_Status;

-- What is the average amount of dependents the graduate clients have?
SELECT AVG(CAST(Dependent_count AS INT)) AS Average_Dependents
From [dbo].[creditcarddata]
Where Education_Level = 'Graduate'

-- What is the average age of the selected clients?
SELECT AVG(customer_age) AS Average_Age
FROM [dbo].[creditcarddata]
WHERE Attrition_Flag = 'Existing Customer'
AND Education_Level IN ('Graduate', 'Post-Graduate')
AND Marital_Status = 'Single';
