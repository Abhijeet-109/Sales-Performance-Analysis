create View vw_kpi_summary as 
select 
    round(sum(sales),2) as total_revenue,
    round(sum(profit),2) as total_profit,
    round(sum(profit) / Sum(sales),4) as profit_margin_percentage,
    count(distinct order_id) as total_orders
from sales_data;


select * from vw_kpi_summary;