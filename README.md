# creditcarddatasql
# data cleaning and analyzing credit card data using microsoft sql studio manager

# We first have to clean up and specify the data. For this example, let's say the client for our company wants to only analyze data on graduates, post-graduates, and single people. 
# To clean the rest of the data, we want to take out the "$" in income category (to make the column all values), the unknowns in marital status (because we want only single clients), and to reformat months on book to years. 

# Our script performs the following tasks:
# Filters the data to select existing customers with specific education and marital status, making the "Income_Category" column nullable.
# Updates the "Income_Category" values to NULL for entries with 'Unknown' income.
# Modifies the "Income_Category" by removing the dollar sign ($) for specific customer groups.
# Adds a new column "Yearsonbook" calculated from "Months_on_book."
# Calculates the average number of dependents for graduate clients.
# Analyzes whether clients with higher credit limits have a higher average transaction count.
# Determines the average age of selected clients meeting specific criteria.
# Compares the average total transaction amount between graduate and post-graduate clients.
# This script is designed for cleaning and extracting insights from the credit card customer dataset and can serve as a reference for similar data analysis projects.

# These questions help our client understand their target's demographics and spending amount. We also get to directly compare graduates and post graduates. The parameters of what we measure can be changed (for example if the client wants to focus on married instead of single, high school graduates instead of those with higher education, and specific income categories. 
