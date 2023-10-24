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

-- What is the average amount of dependents the graduate clients have?
SELECT AVG(CAST(Dependent_count AS INT)) AS Average_Dependents
From [dbo].[creditcarddata]
Where Education_Level = 'Graduate'

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

-- What is the average age of the selected clients?
SELECT AVG(customer_age) AS Average_Age
FROM [dbo].[creditcarddata]
WHERE Attrition_Flag = 'Existing Customer'
AND Education_Level IN ('Graduate', 'Post-Graduate')
AND Marital_Status = 'Single';

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