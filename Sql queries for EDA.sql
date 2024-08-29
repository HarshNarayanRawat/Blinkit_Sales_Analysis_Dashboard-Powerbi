--Make Backup of data so that raw data doesn't lose

--Checking if data is imported correctly
Select * from blinkit_data;

--Data Cleaning
Select distinct(item_fat_content)
from blinkit_data;

--Correcting the Spelling Mistakes
Update blinkit_data
set  item_fat_content = 'Low fat'
where item_fat_content = 'LF';

Update blinkit_data
set  item_fat_content = 'Low fat'
where item_fat_content = 'low fat';

Update blinkit_data
set  item_fat_content = 'Regular'
where item_fat_content = 'reg';


Select distinct(item_fat_content)
from blinkit_data;

--Item_Weight field have some null values but we don't want that field in our dashboard so we will not clean that field.

--Writng queries for EDA
--1.What are the overall revenue generated from all items?
Select sum(Sales) as Total_Sales from blinkit_data;

--2.What are the average revenue per sales?
Select avg(Sales) as Average_Sales from blinkit_data;

--3.How many different types of items were sold?
Select count(Item_type) as Number_of_Items from blinkit_data;

--4.What are the average ratings given by customer to the items sold?
Select avg(Rating) as Average_Rating from blinkit_data;

--5.Analyze the impact of fat content on total sales.
Select item_fat_content as Fat_Content,sum(Sales) as Total_Sales from blinkit_data group by item_fat_content;

--6.How different types of item perform in terms of total sales?
Select Item_type, sum(Sales) as Total_Sales from blinkit_data group by item_type;

--7.Compare total sales across different outlets segmented by fat content.
Select outlet_location_type as Outlet_Location, count(item_fat_content) as Fat_Content, sum(Sales) as Total_Sales from blinkit_data group by outlet_location_type order by outlet_location_type;

--8.How does sales vary by the age or type of outlet establlishment?
Select outlet_establishment_year as Outlet_Establishment, sum(Sales) as Total_Sales from blinkit_data group by outlet_establishment_year order by outlet_establishment_year;

--9.How does outlet size correlates with sales?
Select outlet_size as Outlet_Size, sum(Sales) as Total_Sales from blinkit_data group by outlet_size order by outlet_size desc;

--10.Assess the geographical distribution of sales across different location.
Select outlet_location_type as Outlet_Location, sum(Sales) as Total_Sales from blinkit_data group by outlet_location_type order by outlet_location_type 

--11.How are all key metrics broken down by different outlet types?
Select outlet_type as Outlet_Type, sum(Sales) as Total_Sales, avg(Sales) as Average_sales,count(Item_type) as Number_of_Items, avg(Rating) as Average_Rating, sum(item_visibility) as Item_Visibility from blinkit_data group by outlet_type order by outlet_type ;

