--Top 10 Customers by Revenue

select
    customer_name,
    Round(sum(sales),2)as Revenue,
    Round(sum(sales) * 100 / (select sum(sales) from sales_data),2) as Revenue_percentage,
    Round(sum(profit),2)as Profit,
    Round(sum(profit) *100 / Sum(sales),2)as margin
from sales_data
group by customer_name
order by Revenue desc
limit 10;

/*
| Customer           | Revenue | Profit | Margin |
| ------------------ | ------- | ------ | ------ |
| Sean Miller        | 25,043  | -1,980 | -7.91% |
| Tamara Chand       | 19,052  | 8,981  | 47.14% |
| Raymond Buch       | 15,117  | 6,976  | 46.15% |
| Tom Ashbrook       | 14,595  | 4,703  | 32.23% |
| Adrian Barton      | 14,473  | 5,444  | 37.62% |
| Ken Lonsdale       | 14,175  | 806    | 5.69%  |
| Sanjit Chand       | 14,142  | 5,757  | 40.71% |
| Hunter Lopez       | 12,873  | 5,622  | 43.68% |
| Sanjit Engle       | 12,209  | 2,650  | 21.71% |
| Christopher Conant | 12,129  | 2,177  | 17.95% |

*/


--Calculating Revenue percentage of Top 10 customer 

With customer_revenue as(
    Select 
        customer_name,
        sum(sales) as total_revenue
    from sales_data
    group by customer_name
),
top_10 as (
    select total_revenue
    from customer_revenue
    order by total_revenue desc
    limit 10
)
Select 
    round( sum (total_revenue),2)as top_10_revenue,
    Round(sum(total_revenue) *100 / (select sum(sales) from sales_data),2)as percentage_of_total
from top_10;

--153811.22	6.70
/*
Result:

Top 10 Revenue = 153,811

% of Total Revenue = 6.70%

📊 Interpretation

Top 10 customers contribute only 6.7% of total revenue.

That is very low concentration.

🔎 What This Means
1️⃣ Business is NOT dependent on few customers

If top 10 were contributing:

40% → high risk

60% → extremely dangerous

80% → catastrophic concentration

But 6.7% means:

Revenue is widely distributed.

That is structurally healthy.

2️⃣ Revenue Base is Broad

This is typical of:

Retail businesses

Consumer-heavy models

Not enterprise B2B concentration

Low dependency risk.

🎯 Strong Business Insight

Revenue is well diversified, with top 10 customers contributing only 6.7% of total sales, indicating low customer concentration risk.
*/


Select 
    customer_name,
    round(sum(sales),2)as total_revenue,
    rank() over (order by sum(sales) desc)as revenue_rank
from sales_data
group by customer_name
order by revenue_rank
limit 15;

/*| Customer Name      | Total Revenue | Revenue Rank |
| ------------------ | ------------- | ------------ |
| Sean Miller        | 25,043.07     | 1            |
| Tamara Chand       | 19,052.22     | 2            |
| Raymond Buch       | 15,117.35     | 3            |
| Tom Ashbrook       | 14,595.62     | 4            |
| Adrian Barton      | 14,473.57     | 5            |
| Ken Lonsdale       | 14,175.23     | 6            |
| Sanjit Chand       | 14,142.34     | 7            |
| Hunter Lopez       | 12,873.30     | 8            |
| Sanjit Engle       | 12,209.44     | 9            |
| Christopher Conant | 12,129.08     | 10           |
| Todd Sumrall       | 11,891.75     | 11           |
| Greg Tran          | 11,820.12     | 12           |
| Becky Martin       | 11,789.64     | 13           |
| Seth Vernon        | 11,470.94     | 14           |
| Caroline Jumper    | 11,164.97     | 15           |
*/

/*
Top 15 customers range from:

25K → 11K revenue.

Given total revenue ≈ 2.29M:

Even rank 1 customer contributes only:

25043 / 2297201 ≈ 1.09%

Extremely low dependency.

That confirms:

✔ Broad customer base
✔ No major single-customer risk

🔥 Now Let’s Add One More Layer

Revenue ranking is incomplete without profit ranking.

We must check:

👉 Are high-revenue customers also high-profit customers?
*/

--Calculating profit ranks 

Select
    customer_name,
    round(sum(sales),2)as revenue,
    round(sum(profit),2)as profit,
    rank() Over (order by sum(profit) desc) as profit_rank
from sales_data
group by customer_name
order by profit_rank
limit 15;

/*| Customer Name        | Total Revenue | Total Profit | Profit Rank |
| -------------------- | ------------- | ------------ | ----------- |
| Tamara Chand         | 19,052.22     | 8,981.32     | 1           |
| Raymond Buch         | 15,117.35     | 6,976.09     | 2           |
| Sanjit Chand         | 14,142.34     | 5,757.42     | 3           |
| Hunter Lopez         | 12,873.30     | 5,622.43     | 4           |
| Adrian Barton        | 14,473.57     | 5,444.81     | 5           |
| Tom Ashbrook         | 14,595.62     | 4,703.80     | 6           |
| Christopher Martinez | 8,954.01      | 3,899.91     | 7           |
| Keith Dawkins        | 8,181.24      | 3,038.58     | 8           |
| Andy Reiter          | 6,608.45      | 2,884.61     | 9           |
| Daniel Raglin        | 8,350.87      | 2,869.08     | 10          |
| Tom Boeckenhauer     | 9,133.99      | 2,798.37     | 11          |
| Nathan Mautz         | 6,459.34      | 2,751.69     | 12          |
| Sanjit Engle         | 12,209.44     | 2,650.67     | 13          |
| Bill Shonely         | 10,501.65     | 2,616.06     | 14          |
| Harry Marie          | 8,236.76      | 2,437.97     | 15          |
*/


--Identify High-Revenue but Low-Margin Customers

Select 
    customer_name,
    round(sum(sales),2)as total_revenue,
    round(sum(profit),2)as total_profit,
    round( sum(profit) *100 / sum(sales),2)as profit_margin
from sales_data
group by customer_name
having sum(sales) > 10000
order by profit_margin asc;

/*
| Customer     | Revenue | Profit | Margin      |
| ------------ | ------- | ------ | ----------- |
| Becky Martin | 11,789  | -1,659 | **-14.08%** |
| Sean Miller  | 25,043  | -1,980 | **-7.91%**  |

*/
/*
These are high-spend customers generating losses.

Sean Miller is:

Revenue Rank 1

Profit negative

That is a structural pricing failure.

⚠️ Very Low Margin Customers
Customer	Margin
Ken Lonsdale	5.69%
Caroline Jumper	7.69%
Seth Vernon	10.46%

These are borderline weak.

✅ Healthy High-Margin Customers

Margins above 30%:

Tamara Chand (47%)

Raymond Buch (46%)

Hunter Lopez (43%)

Sanjit Chand (40%)

These are high-quality customers.

🎯 Strategic Conclusion

Customer profitability is highly uneven.

Business is:

Losing money on top revenue customer

Profitable on mid-tier customers

Over-discounting certain high buyers

This indicates:

Revenue growth may be driven by aggressive pricing.

Margin discipline is inconsistent.

🔥 Strong Executive Insight

Two of the top revenue customers operate at negative margins, indicating potential over-discounting or unprofitable deal structuring, especially with the highest spending customer.
*/


