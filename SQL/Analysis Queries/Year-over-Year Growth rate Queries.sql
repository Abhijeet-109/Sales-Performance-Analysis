--Year-over-Year Growth Rate %

with yearly as (
    select 
        Extract (year from order_date) as year,
        sum(sales)as revenue
    from sales_data
    group by year
)
select 
    year,
        round(revenue,2)as revenue,
        round(
            (revenue - Lag(revenue) over(order by year))
            *100 / lag(revenue) over (order by year),2
        ) as growth_percentage
from yearly
order by year;

/*
| Year | Revenue | Growth % |
| ---- | ------- | -------- |
| 2014 | 484K    | —        |
| 2015 | 470K    | -2.83%   |
| 2016 | 609K    | +29.47%  |
| 2017 | 733K    | +20.36%  |
*/

/*
Interpretation
1️⃣ 2015 Decline

Revenue dropped slightly (-2.83%).

But earlier we saw profit increased.

That means margin efficiency improved that year.

2️⃣ 2016 Strong Expansion

+29.47% growth.

Major scale-up phase.

Likely:

Increased demand

Strong product mix

Possibly aggressive sales push

3️⃣ 2017 Stable High Growth

+20.36%

Still strong.

Business is expanding sustainably post-2015.

🎯 Final Growth Insight

After a minor contraction in 2015, the business entered a strong growth phase, achieving 29% and 20% revenue growth in consecutive years, indicating successful scaling and market expansion.
*/


