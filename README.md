# Microsoft SQL studio manager data cleaning and analysis

# Clean and specify data: In this example, let's say the client for our company wants to ONLY analyze data for graduates, post-graduates, and singles. In addition, to properly use data, we need to remove "$" from income, remove unknown marital statuses, and reformat book months to years.

# Our code script performs the following tasks:
# Filters the data to select existing customers with specific education and marital status, making the "Income_Category" column nullable.
# Updates the "Income_Category" values to NULL for entries with 'Unknown' income.
# Modifies the "Income_Category" by removing the dollar sign ($) for specific customer groups.
# Adds a new column "Yearsonbook" calculated from "Months_on_book."
# Calculates the average number of dependents for graduate clients.
# Analyzes whether clients with higher credit limits have a higher average transaction count.
# Determines the average age of selected clients meeting specific criteria.
# Compares the average total transaction amount between graduate and post-graduate clients.
# This script is designed for cleaning and extracting insights from the credit card customer dataset and can serve as a reference for similar data analysis projects.

# These inquiries facilitate a comprehension of our client's target demographics and expenditure patterns. Additionally, they allow for a direct comparison between graduates and postgraduates. It's important to note that we can adjust the parameters of our measurements as per the client's preferences, such as shifting the focus from singles to married individuals, transitioning from higher education to high school graduates, and specifying income categories.
