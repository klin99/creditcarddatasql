# Data Cleaning and Analysis with Microsoft SQL Server Management Studio
# Data Cleaning and Specification
# In this analysis using Microsoft SQL Server Management Studio, we focus on cleaning and specifying the data to meet specific client requirements. The objective is to analyze data for individuals with graduate or post-graduate education levels who are single. The data cleaning tasks include removing the dollar sign ($) from the income, eliminating records with unknown marital statuses, and reformatting the "Months_on_book" column into years.

# SQL Queries for Data Analysis
# Our SQL queries serve to gain insights into the client's target demographics and spending patterns. They enable direct comparisons between graduate and post-graduate clients while remaining flexible to adjust parameters according to the client's preferences.

# Data Cleaning Tasks
# Filter the data to select existing customers with specific education and marital status, while making the "Income_Category" column nullable.
# Update "Income_Category" values to NULL for entries with 'Unknown' income.
# Modify "Income_Category" by removing the dollar sign ($) for specific customer groups.
# Add a new column, "Yearsonbook," calculated from "Months_on_book."
# Data Analysis Queries
# Analyze if clients with higher credit limits have a higher average transaction count.
# Determine the difference in average total transaction amounts between graduate and post-graduate clients.
# Calculate the average credit limit for each card category (e.g., Blue, Silver, Gold, Platinum) among existing customers.
# Investigate whether customers with higher total relationship counts tend to have higher credit limits.
# Explore potential correlations between the average total transaction amount and the average total transaction count.
# Examine the distribution of average utilization ratios among customers with different education levels and marital statuses.
# Find the average number of dependents for graduate clients.
# Calculate the average age of selected clients who meet specific criteria.
# These SQL queries are designed for cleaning and extracting meaningful insights from the credit card customer dataset. They can serve as a valuable reference for similar data analysis projects, providing a foundation for informed decision-making and strategy development.
