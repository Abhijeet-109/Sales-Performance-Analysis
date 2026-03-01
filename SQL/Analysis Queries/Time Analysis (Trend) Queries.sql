/*
Time Analysis (Trend)

We must answer:

Is revenue growing yearly?

Which month has peak sales?

Is seasonality visible?

Start with yearly trend.
*/

Select 
    extract(year from order_date)as Year,
    round(sum (sales),2)as revenue,
    round(sum (profit),2)as profit,
    round(sum(profit) *100 / sum(sales),2)as margin_percentage 
from sales_data
group by year 
order by year  ;

/*
| Year | Revenue | Profit |
| ---- | ------- | ------ |
| 2014 | 484K    | 49K    |
| 2015 | 470K    | 61K    |
| 2016 | 609K    | 81K    |
| 2017 | 733K    | 93K    |

*/

--This give us the analysis that 
/*
Observations
1️⃣ 2015 Revenue Dropped Slightly

484K → 470K
Small dip (~-2.8%)

But profit increased.

That means:
Margin improved in 2015.

2️⃣ Strong Growth After 2015

Revenue Growth:

2015 → 2016 ≈ +29%

2016 → 2017 ≈ +20%

Clear upward trend.

Business scaled aggressively after 2015.

3️⃣ Profit Also Growing Consistently

49K → 61K → 81K → 93K

Profit trend is stable and increasing.

No structural decline.

That’s healthy.

🎯 Key Insight

Business shows strong post-2015 expansion with consistent profit growth, indicating improved operational efficiency and revenue scaling.
*/

--Now let's move on to the monthly analysis 
Select 
    Extract(month from order_date)as month,
    round(sum(sales),2)as revenue,
    round(sum(profit),2)as profit
from sales_data
group by month
order by month;

/*
| Month | Revenue | Profit | Margin     |
| ----- | ------- | ------ | ---------- |
| Feb   | 59,751  | 10,294 | **17.22%** |
| Nov   | 352,461 | 35,468 | **10.06%** |
| Dec   | 325,293 | 43,369 | **13.33%** |

*/

/*
Important Observations
1️⃣ February — Low Revenue, High Margin

Revenue lowest.
But margin strongest (~17%).

This suggests:

Lower discounting

More profitable product mix

Possibly fewer bulk promotions

2️⃣ November — Highest Revenue, Weak Margin

Revenue peak.
Margin drops to ~10%.

This indicates:

Heavy discounting

Promotional campaigns

Volume-driven strategy

Classic Black Friday pattern.

3️⃣ December — Strong Balance

Revenue high.
Profit highest.
Margin healthier than November.

December seems more controlled compared to November.

🎯 Strong Business Insight

Revenue spikes in Q4 are volume-driven, but November profitability weakens due to aggressive discounting, while December achieves better profit efficiency.
*/