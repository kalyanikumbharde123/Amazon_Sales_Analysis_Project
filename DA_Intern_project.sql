SELECT TOP (1000) [index]
      ,[Order ID]
      ,[Date]
      ,[Status]
      ,[Fulfilment]
      ,[Sales Channel]
      ,[ship-service-level]
      ,[Category]
      ,[Size]
      ,[Courier Status]
      ,[Qty]
      ,[currency]
      ,[Amount]
      ,[ship-city]
      ,[ship-state]
      ,[ship-postal-code]
      ,[ship-country]
      ,[B2B]
      ,[fulfilled-by]
      ,[New]
      ,[PendingS]
  FROM [DA_INTERN_PROJECT].[dbo].[Amazon Sale Report]

  SP_HELP 'Amazon Sale Report'


  select Amount From [Amazon Sale Report]
 
 --UPDATE DATATYPES
   select Amount From [Amazon Sale Report]
   where TRY_CAST(Amount as DECIMAL(10,2)) is null
   AND Amount IS NOT NULL;

   UPDATE [Amazon Sale Report]
   set Amount= REPLACE(Amount,',','');

   update [Amazon Sale Report]
   set Amount=null
   where Amount='';

   select Amount,
   TRY_CAST(Amount as decimal(10,2)) as Amount_Decimal
   From [Amazon Sale Report];
   
   alter table [Amazon Sale Report]
alter column Amount Decimal(10,2);

--TOTAL SALES
select SUM(Amount)as Total_Revenue
   from [Amazon Sale Report]

 --TOTAL ORDERS
 select COUNT(DISTINCT [Order ID]) as Total_Orders
   from [Amazon Sale Report]

select Qty from [Amazon Sale Report]


select Qty from [Amazon Sale Report]
where TRY_CAST(Qty as int) is null
AND Qty is not null;

alter table [Amazon Sale Report]
alter column Qty INT;

--TOTAL QUANTITY
select SUM(Qty) as Total_quality_sold
from [Amazon Sale Report]

select Date from [Amazon Sale Report]

alter table [Amazon Sale Report]
alter column Date DATE;

select * from [Amazon Sale Report]

--TOP PRODUCT CATEGORIES
select 
year(Date) as Sales_year,
Month(Date) as Sales_Month,
SUM(Amount) as revenue
from [Amazon Sale Report]
group by year(Date),Month(Date)
Order by Sales_Year,Sales_Month;


--BEST-SELLING SIZES

select Size, 
SUM(Qty) as Total_Qauntity
from [Amazon Sale Report]
group by Size
order by Total_Qauntity DESC;


--TOP PRODUCT CATEGORIES
select category,
SUM(Amount) as Revenue,
SUM(Qty) as Quantity_sold
FROM [Amazon Sale Report]
Group by Category
Order by Revenue DESC;

--State Wise Sales
select[Order ID] from [Amazon Sale Report]

select [ship-state],
SUM(Amount) as Revenue,
COUNT(DISTINCT[Order ID] ) as Orders
from [Amazon Sale Report]
group by  [ship-state]
order by revenue DESC;

--TOP 10 CITIES BY REVENUE
select top 10 [ship-city], 
sum(Amount) as revenue
from [Amazon Sale Report]
group by [ship-city]
order by revenue DESC;

--Order status Analysis
select[Status],
COUNT(*) as Total_order
from [Amazon Sale Report]
group by [Status]
order by Total_order


