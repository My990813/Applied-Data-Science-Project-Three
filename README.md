# Applied-Data-Science-Project-Three
Research question: Does red color for sales affect people's choice of buying clothes?

Motivations: In a world filled with countless choices, marketing strategies—such as those used during major sales events like Black Friday—are crafted to influence consumer decisions. It is interesting to see the consistent use of the color red in advertisements across different countries. This widespread practice raises a compelling question: does the color red actually increase urgency in consumer behavior, encouraging quicker or more impulsive purchases?

# Experimental Design & Methodology

We have two websites–Website A and Website B. On the website, we have three T-shirts--Plain Black Shirt, Code Shirt, and Graphic Shirt. The Plain Black Shirt is $100 with 25% discount. The Code Shirt is $75. The Graphic Shirt is $50. You have $75 in balance to buy the T-shirt. You can buy any T-shirt. But the balance is only sufficent for you to buy one T-shirt. If you already buy one and want to buy another. The website will pop up "Insufficient funds to buy this item". The Plain Black Shirt has no figures or anything on it. But the sales button is in red and it has a sale for website A, but in color similar to other items for website B to see if red color and sales affect user click rates. The Plain Black Shirt and Code Shirt have same prices of $75, but the code shirt doesn't use sale strategy and simply state the final price. Graphic Shirt is cheaper at $50 and is used to be a comparison. You can also Rate the Super Graphic Store or leave comments.

# Website A: app1
- Website A uses red to highlight the sale item—a plain black shirt—while other items, such as the coded shirt and graphic shirt, are shown in mint green. 
- Click the link for Website A here: https://ruangkawprc.shinyapps.io/app1/

# Website B: app2
- Website B uses mint green for the sale item, matching the color used for the other items in the store.
- Click the link for Website B here: https://ruangkawprc.shinyapps.io/app2/

# A/B Test Experiment
In this project, we are designing and conducting an A/B Test experiment. A/B Test plays an important role in data science, especially for decision-making and user experience optimization. The idea behind A/B Testing is you have two group–A and B, and Group A is the original version and Group B is the modified version. You are comparing how each group behaves. By comparing the outcome for Group A and Group B, you will find out which one is better for you to use.

# Cookie-Based Assignment URL for A/B Testing
- We created an index.html page on GitHub to serve as a redirect link that randomly sends users—with a 50% probability—to either Website A or Website B. The assigned group is stored in a cookie for 30 days to ensure consistent redirection on future visits.
- The link is generated from here: https://github.com/ruangkawprc/project3_ab_test
- Click this link to redirect to your version of the app: https://ruangkawprc.github.io/project3_ab_test

# Data Collection
- We sent the two website randomly to two stats students groups and our classmates. In total, 69 students entered Website A and 57 students entered Website B. They clicked on the website and left us valuable data.
- We analyzed the data via Google Analytics. In Google Analytics–View user engagement & retention tab, we are able to download the datasets for different events such as different kinds of purchase on three T-shirts. In User Explorer, we are able to download the datasets for individual users behaviors.

# Statistical Analysis & Results
- We use different statistical methods, including, t-test, chi-square test, Fisher's Exact Test, XGBoost feature importance, Partial Dependence Plots (PDP) and SHAP values.
- Please click the file data_ana_pj3.qmd to see the full detail of our statistical analysis.

# Conclusion
In conclusion, the group difference—namely the use of a red color for the sales button—does not appear to have a statistically significant impact on users' tendency to click the purchase button. Instead, features such as average session duration, user engagement, and click number show stronger predictive power in influencing user behavior.

However, slight variations in SHAP values for user engagement and click number between the two groups suggest that the red color might still have a subtle effect on user interaction. This implies that while the red button alone is not a dominant factor, it may contribute marginally to the overall clicking behavior.
