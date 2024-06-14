/* 5-1. group function */
/* ROLLUP() in food, category */
SELECT
    CASE
        WHEN grouping(c.categoryName) = 1 THEN '종합'
        ELSE c.categoryName
    END as "카테고리",
    SUM(f.price) as "가격 합산"
FROM    Food f
JOIN    Contains c ON f.foodName = c.foodName
GROUP BY ROLLUP(categoryName);



/* 5-1. group function */
/* CUBE() in orderdetail */
SELECT
    CASE
        WHEN grouping(od.foodName) = 1 THEN '종합'
        ELSE od.foodName
    END as "음식",
    SUM(totalPrice) as "가격 합산"
FROM    OrderDetail od
JOIN    Contain c ON od.foodName = c.foodName
GROUP BY CUBE(od.foodName);





/* 5-2. WINDOW FUNCTION */
/* RANK() OVER in orderdetail */
SELECT
    categoryName as "카테고리",
    totalSales as "총액수",
    RANK() OVER (ORDER BY totalSales DESC) as "랭킹"
FROM (
    SELECT  c.categoryName, SUM(od.totalPrice) as totalSales
    FROM    OrderDetail od
    JOIN    Contain c ON od.foodName = c.foodName
    GROUP BY c.categoryName);
    
    

/* 5-2. WINDOW FUNCTION  */
/* SUM(), MAX() over (partition by ~) in orderdetail */
SELECT
    categoryName as "카테고리",
    sumInCategory as "카테고리 내 총합",
    maxInCategory as "카테고리 내 최고"
FROM (
    SELECT  c.categoryName,
            SUM(od.totalPrice) OVER (PARTITION BY c.categoryName) as sumInCategory,
            MAX(od.totalPrice) OVER (PARTITION BY c.categoryName) as maxInCategory
    FROM    OrderDetail od
    JOIN    Contain c ON od.foodName = c.foodName) 
GROUP BY categoryName, sumInCategory, maxInCategory;