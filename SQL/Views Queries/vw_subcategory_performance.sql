Create view vw_subcategory_performance as 
    Select 
        category,
        sub_category,
        round(sum(sales),2)as total_revenue,
        round(sum(profit),2)as total_profit,
        round(sum(profit) / sum(sales),4) as profit_margin_percentage,
        round(Avg(discount) *100 ,2) as avg_discount_percentage
    from sales_data
    group by category,sub_category;

    Select * from vw_subcategory_performance
    where category = 'Furniture'
    order by profit_margin_percentage asc;

    