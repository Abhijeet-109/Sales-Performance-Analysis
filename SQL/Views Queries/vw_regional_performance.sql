Create View vw_regional_performance as 
    select 
        region,
        round(sum(sales),2) as total_revenue,
        round(sum(profit),2) as total_profit,
        round(sum(profit) / sum(sales),4) as profit_margin_percentage,
        round(avg(discount) *100,2) as avg_discount_percentage
    from sales_data
    group by region;


    select * from vw_regional_performance;