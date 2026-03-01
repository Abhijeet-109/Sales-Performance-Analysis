/*
Category-Level Analysis

We must answer:

1. Which category generates most revenue?

2.Which category has lowest margin?

3. Is Central’s weakness coming from specific category?
*/

Select 
    category,
    round(sum(sales),2)as Revenue,
    round(sum(profit),2)as profit,
    round(sum(profit) *100 / sum(sales),2) As profit_margin_percentage
from sales_data
Group by category
order by profit_margin_percentage desc;

/*
| Category        | Revenue | Profit | Margin |
| --------------- | ------- | ------ | ------ |
| Technology      | 836K    | 145K   | 17.40% |
| Office Supplies | 719K    | 122K   | 17.04% |
| Furniture       | 742K    | 18K    | 2.49%  |

*/

--Deep Dive — Furniture by Region

Select 
    region,
    round(sum(sales),2)as Revenue,
    round(sum(profit),2)as profit,
    round(sum(profit) *100 / sum(sales),2) As profit_margin_percentage
from sales_data
where category = 'Furniture'
Group by region
order by profit_margin_percentage desc;

/*
| Region  | Revenue | Profit | Margin |
| ------- | ------- | ------ | ------ |
| South   | 117K    | 6.7K   | 5.77%  |
| West    | 252K    | 11.5K  | 4.55%  |
| East    | 208K    | 3K     | 1.46%  |
| Central | 163K    | -2.8K  | -1.75% |

*/
/*
Major Strategic Insight

Furniture category overall margin = 2.49%

But:

Central Furniture is actually negative.

This means:

Central region weakness is strongly linked to Furniture.

Discount policy likely aggressive on bulky items.

Shipping/logistics may be high.

Pricing strategy flawed.
*/

--Now We Go One Level Deeper 
-- To find which sub-category is causing the problem 

Select 
    sub_category,
    round(sum(sales),2)as revenue,
    round(sum(profit),2)as profit,
    round(sum(profit) * 100 / Sum(sales),2)as margin
from sales_data
where category = 'Furniture'
Group by sub_category
order by margin asc;

/*
| Sub-Category  | Revenue | Profit | Margin     |
| ------------- | ------- | ------ | ---------- |
| **Tables**    | 206K    | -17.7K | **-8.56%** |
| **Bookcases** | 114K    | -3.4K  | **-3.02%** |
| Chairs        | 328K    | 26.6K  | 8.10%      |
| Furnishings   | 91K     | 13K    | 14.24%     |

*/
/*
Now We Test the Hypothesis

We must confirm:

👉 Are Tables heavily discounted?
*/

Select 
    sub_category,
    round(avg(discount) * 100,2)as avg_discount_percentage
from sales_data
where category = 'Furniture'
group by sub_category
order by avg_discount_percentage desc;

/*
| Sub-Category | Avg Discount | Margin |
| ------------ | ------------ | ------ |
| Tables       | 26.13%       | -8.56% |
| Bookcases    | 21.11%       | -3.02% |
| Chairs       | 17.02%       | 8.10%  |
| Furnishings  | 13.83%       | 14.24% |

This is a clear inverse relationship.

Higher discount → Lower margin → Negative profit.

No ambiguity.

🎯 Root Cause Identified

Furniture category is weak because:

Tables receive the highest discount (26%)

Tables generate negative margin (-8.56%)

Bookcases also over-discounted and negative

Chairs and Furnishings are healthy

So the structural issue is not the whole category.

It is specific product lines.

*/