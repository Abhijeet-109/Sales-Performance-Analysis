--Group Analysis

-- Revenue by Region 

Select 
    region, 
    ROUND(sum(sales),2) As revenue
from sales_data
Group BY region 
order by revenue desc;

/*
region  revenue     
West	725457.93
East	678781.36
Central	501239.88
South	391721.90
*/

--Finding which region contribute how much revenue in percentage 
Select 
    region,
    Round(sum(sales),2) As revenue,
    Round(sum(sales) * 100 / (Select sum(sales) from sales_data),2) As Revenue_percentage
from sales_data
Group by region
order by revenue desc;

/*
region  revenue     Revenue_percentage
West	725457.93	31.58
East	678781.36	29.55
Central	501239.88	21.82
South	391721.90	17.05
*/


--Profit by Region 

Select 
    region,
    Round(sum(profit),2) As Total_profit,
    Round(sum(profit) *100 / Sum(sales),2) as profit_margin_percentage
from sales_data

group by region 
order by Total_profit desc;

/*
West	108418.79	14.94
East	91522.84	13.48
South	46749.71	11.93
Central	39706.45	7.92
*/


--Overall analysis 
/*
Key Observations
1️⃣ West is Strongest Region

Highest revenue

Highest profit

Highest margin
→ This is your best-performing region.

2️⃣ Central is the Weak Region

Mid-level revenue

Lowest profit

Margin only 7.92%

This is significantly below overall margin (12.47%).

Central region is dragging overall performance.

3️⃣ Revenue ≠ Profit

Central revenue = 501K
South revenue = 391K

But:

South profit > Central profit

That means:

Central likely has:

High discounting

High-cost products

Poor pricing strategy

This is exactly why we analyze margin.
*/


--Investigating if Discount is the problem 

Select
    region,
    Round(AVG(discount)*100 ,2) as Discount_percentage
from sales_data
Group by region 
order by Discount_percentage desc;

/*
Central	24.04
South	14.73
East	14.54
West	10.93
*/

-- Now We Quantify Damage 

select 
    region,
    count(*) As total_orders,
    count(*) filter (where profit < 0 ) as loss_orders,
    round( count(*) filter (where profit < 0 ) *100 /count(*),2) As loss_order_percentage
from sales_data
group by region
order by loss_order_percentage desc;

/*
region  Ttl_odr L_ord %
Central	2323	741	31.00
East	2848	553	19.00
South	1620	259	15.00
West	3203	318	9.00
*/