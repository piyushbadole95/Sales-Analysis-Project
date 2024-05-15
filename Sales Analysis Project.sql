create database Sales ;
use sales;
create table Sales_Report as(
select *,"January" as "Sales_Month" from sales_january_2019
union all
select *,"February" as "Sales_Month" from sales_february_2019
union all
select *,"March" as "Sales_Month" from sales_march_2019
union all
select *,"April" as "Sales_Month" from sales_april_2019
union all
select *,"May" as "Sales_Month" from sales_may_2019
union all
select *,"June" as "Sales_Month" from sales_june_2019
union all
select *,"July" as "Sales_Month" from sales_july_2019
union all
select *,"August" as "Sales_Month" from sales_august_2019
union all
select *,"September" as "Sales_Month" from sales_september_2019
union all
select *,"October" as "Sales_Month" from sales_october_2019
union all
select *,"November" as "Sales_Month" from sales_november_2019
union all
select *,"december" as "Sales_Month" from sales_december_2019);

select * from sales_report;

-- Que 1 - What is the total sales?
select sum(`price each`) as Total_Sales from sales_report;

-- Que 2 - What is the average sales per month?

select sales_month, avg(`price each`) as average_sales
from sales_report
group by sales_month;

-- Que - 3 What is the monthly revenue?
select sales_month, sum(`price each`) as Monthly_Revenue
from sales_report
group by sales_month;

-- Que - 4 What are the key demographics of the customers?
SELECT distinct SUBSTRING_INDEX(SUBSTRING_INDEX(`purchase address`, ",",-2),",",1) as city from sales_report;

-- Que 5 - Which market (city) generated the most sales on average?

SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(`purchase address`, ",",-2),",",1) as market,
avg(`price each`) as average_sales
from sales_report
group by market
order by average_sales desc
limit 1;


-- Extract City Name from whole address
select * from sales_report;
SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(`purchase address`, ",",-2),",",1) from sales_report;

-- Que 6 - What were the profits by segment?
select SUBSTRING_INDEX(SUBSTRING_INDEX(`purchase address`, ",",-2),",",1) as market,
product, sum(`price each`) as Profits
from sales_report
group by market, product;


-- Que 7 - When were the best- and worst-selling periods?

select sales_month, sum(`price each`) as Best_Selling 
from sales_report 
group by sales_month 
order by Best_Selling desc limit 1 ;
select sales_month,sum(`price each`) as Worst_Selling 
from sales_report 
group by sales_month 
order by Worst_Selling asc limit 1 ;


-- Que 8 - Which products sell best?
select product, sum(`quantity ordered`) as Best_Product
from sales_report
group by product
order by Best_Product desc limit 1;

select * from sales_report;

-- Que 9 - Which products should the company order more or less of?
select product, sum(`price each`) as More_Order 
from sales_report 
group by product 
order by More_Order desc limit 1 ;

select product,sum(`price each`) as Less_Order 
from sales_report 
group by product 
order by Less_Order asc limit 1 offset 3 ;


-- Project Description
-- Technology Used - Excel, SQL
-- 1) 12 excel files loaded to SQl
-- 2) created a database and a table, all 12 files were merged into the table using union all clause and substring_index function.
-- 3) then performed some task to analyse the data like -

-- What is the total sales?
-- What is the average sales per month?
-- What is the monthly revenue?
-- What are the key demographics of the customers?
-- Which market (city) generated the most sales on average?
-- What were the profits by segment?
-- When were the best- and worst-selling periods?
-- Which products should the company order more or less of















