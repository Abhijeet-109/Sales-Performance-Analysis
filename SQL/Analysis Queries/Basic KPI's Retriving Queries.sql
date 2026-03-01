--Extracting Basic KPI's 

--Total Revenue 
select ROUND(sum(sales),2) As Total_revenue
from sales_data;

--Total Revenue 2297201.07 ( 2.29M)




--Total Profit 
select ROUND(sum(profit),2) As Total_profit
from sales_data;

-- Total Profit 286397.79 ( 286K)

    

--Total Profit Margin ( Actual Profit )
Select 
    Round(sum(profit) / sum(sales) *100 ,2) As Profit_margin_percentage
from sales_data;

--Profit Margin = 12.47%


--KPI's Insights 
/* Interpretation

For retail / superstore-type businesses:

5–10% → weak

10–15% → moderate

15–25% → strong

25%+ → very strong

So 12.47% means:

✔ Business is profitable
✔ But margin is not very high
✔ Discount strategy might be affecting profit

This tells us:

We must investigate:

1. Which regions reduce margin?

2. Which categories drag profit?

3. Is discount killing margin?
*/
