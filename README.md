# creditcarddatasql
# data cleaning and analyzing credit card data using microsoft sql studio manager

# We first have to clean up and specify the data. For this example, let's say the client for our company wants to only analyze data on graduates, post-graduates, and single people. This becomes our first 8 lines of code.
# To clean the rest of the data, we want to take out the "$" in income category (to make the column all values), the unknowns in marital status (because we want only single clients), and to reformat months on book to years. This becomes our next 11 lines of code.

# We then want to find out answers from the data that our client will be interested in, such as:
# 1) What is the average amount of dependents the graduate clients have?
# 2) Do clients with higher credit limit have higher total average transaction count? (higher credit limit being above 10000)
# 3) What is the average age of the selected clients?
# 4) What is the difference of average total transaction amount between graduate and post graduate level clients?

# These questions help our client understand their target's demographics and spending amount. We also get to directly compare graduates and post graduates. The parameters of what we measure can be changed (for example if the client wants to focus on married instead of single, high school graduates instead of those with higher education, and specific income categories. 
# 
