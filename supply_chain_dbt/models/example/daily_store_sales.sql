-- Daily sales which are aggregated by store with store attributes

SELECT 
    s.store_nbr,
    s.city,
    s.state,
    s.type,
    s.cluster,
    sal.date,
    SUM(sal.sales) as daily_revenue,
    COUNT(DISTINCT sal.family) as products_sold,
    SUM(sal.onpromotion) as promo_items
FROM {{ source('raw', 'sales') }} sal
JOIN {{ source('raw', 'stores') }} s 
    ON sal.store_nbr = s.store_nbr
GROUP BY s.store_nbr, s.city, s.state, s.type, s.cluster, sal.date