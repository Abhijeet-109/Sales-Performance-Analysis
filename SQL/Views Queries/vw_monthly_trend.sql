Create view vw_monthly_trend as 
    Select
        date_trunc('month' ,order_date)as month,
        round(sum(sales),2)as total_revenue,
        round(sum(profit),2)as total_profit
    from sales_data
    group by month
    order by month;
    
  

select * from vw_monthly_trend
limit 5;

/*
2014-01-01 00:00:00+05:30	14236.90	2450.18
2014-02-01 00:00:00+05:30	4519.92	862.30
2014-03-01 00:00:00+05:30	55691.04	498.72
2014-04-01 00:00:00+05:30	28295.35	3488.86
2014-05-01 00:00:00+05:30	23648.28	2738.74
*/