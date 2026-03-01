create view vw_category_performance as 
    select
        category,
        round(sum(sales),2) as total_revenue,
        round(sum(profit),2) as total_profit,
        round(sum(profit) / sum(sales),4) as profit_margin_percentage,
        round(Avg(discount) *100,2) as avg_discount_percentage
    from sales_data
    group by category;

    

    select * from vw_category_performance
    order by total_revenue desc;