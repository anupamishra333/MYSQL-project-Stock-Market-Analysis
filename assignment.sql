-- Create a database named as assignment--
-- import given data in schema "assignment"  with change of  the date column to datetime data type --

create database assignment;

-- Use of created database "assignment" --

use assignment;

-- create the new table names as 'bajaj1' containing the date, close price, 20 Day MA and 50 Day MA. --
-- ( This has to be done for all 6 stocks ) --

-- Tables are created with truncate so  used to limit decimal places upto 3 to make the data presentable and date is stored in DD-month-YY format --


create table bajaj1 as ( 
select DATE_FORMAT(date, "%d %M %Y") as date, `Close Price`,
truncate(AVG(`Close Price`) 
over (order by date rows 19 preceding), 3) as "20 DAY Moving Average",
truncate(AVG(`Close Price`) 
over (order by date rows 49 preceding), 3) as "50 DAY Moving Average"
FROM bajaj);


-- same for the second stock as we made for previous  stock --

create table eicher1 as(
select DATE_FORMAT(date, "%d %M %Y") as date,
 `Close Price`,
truncate(AVG(`Close Price`)
 over (order by date rows 19 preceding), 3) as "20 DAY Moving Average",
truncate(AVG(`Close Price`)
 over (order by date rows 49 preceding), 3) as "50 DAY Moving Average"
FROM eicher);


-- same for the third  stock as we made for previous  stock --

create table hero1 as(
select DATE_FORMAT(date, "%d %M %Y") as date, `Close Price`,
truncate(AVG(`Close Price`) 
over (order by date rows 19 preceding), 3) as "20 DAY Moving Average",
truncate(AVG(`Close Price`) 
over (order by date rows 49 preceding), 3) as "50 DAY Moving Average"
FROM hero);


-- same for the  fourth  as we made for previous  stock --

create table infosys1 as(
select DATE_FORMAT(date, "%d %M %Y") as date, `Close Price`,
truncate(AVG(`Close Price`)
 over (order by date rows 19 preceding), 3) as "20 DAY Moving Average",
truncate(AVG(`Close Price`)
 over (order by date rows 49 preceding), 3) as "50 DAY Moving Average"
FROM infosys);


-- same for the fifth stock as we made for previous  stock --

create table tcs1 as(
select DATE_FORMAT(date, "%d %M %Y") as date, `Close Price`,
truncate(AVG(`Close Price`) 
over (order by date rows 19 preceding), 3) as "20 DAY Moving Average",
truncate(AVG(`Close Price`) 
over (order by date rows 49 preceding), 3) as "50 DAY Moving Average"
FROM tcs);


-- same for the sixth stock as we made for previous  stock --

create table tvs1 as(
select DATE_FORMAT(date, "%d %M %Y") as date, `Close Price`,
truncate(AVG(`Close Price`) 
over (order by date rows 19 preceding), 3) as "20 DAY Moving Average",
truncate(AVG(`Close Price`)
 over (order by date rows 49 preceding), 3) as "50 DAY Moving Average"
FROM tvs);




-- Create a master table containing the date and close price of all the six stocks. --
-- (Column header for the price is the name of the stock). --


create table `master` as
select DATE_FORMAT(b.date, "%d %M %Y") as 'date', 
b.`Close Price` as 'Bajaj',
e.`Close Price` as 'Eicher',
i.`Close Price` as 'Infosys',
h.`Close Price` as 'Hero',
tcs.`Close Price` as 'TCS',
tvs.`Close Price` as 'TVS'
from bajaj b, eicher e, infosys i, hero h, tcs ,tvs;





-- Use the table created in Part(1) to generate buy and sell signal. 
-- Store this in another table named 'bajaj2'. Perform this operation for all stocks.

create table bajaj2 as
select date, `Close Price`,
case
    when `20 DAY Moving Average` > `50 DAY Moving Average` THEN "BUY"
    when `20 DAY Moving Average` < `50 DAY Moving Average` THEN "SELL"
    else "HOLD"
end as'Signal'
from bajaj1;


-- same operation for 2nd  stocks. --

create table eicher2 as
select date, `Close Price`,
case
    when `20 DAY Moving Average` > `50 DAY Moving Average` THEN "BUY"
    when `20 DAY Moving Average` < `50 DAY Moving Average` THEN "SELL"
    else "HOLD"
end as'Signal'
from eicher1;



-- same operation for 3rd stocks. --

create table hero2 as
select date, `Close Price`,
case
    when `20 DAY Moving Average` > `50 DAY Moving Average` THEN "BUY"
    when `20 DAY Moving Average` < `50 DAY Moving Average` THEN "SELL"
    else "HOLD"
end as'Signal'
from hero1;

-- same operation for 4th stocks. --

create table infosys2 as
select date, `Close Price`,
case
    when `20 DAY Moving Average` > `50 DAY Moving Average` THEN "BUY"
    when `20 DAY Moving Average` < `50 DAY Moving Average` THEN "SELL"
    else "HOLD"
end as'Signal'
from infosys1;

-- same operation for 5th stocks. --

create table tcs2 as
select date, `Close Price`,
case
    when `20 DAY Moving Average` > `50 DAY Moving Average` THEN "BUY"
    when `20 DAY Moving Average` < `50 DAY Moving Average` THEN "SELL"
    else "HOLD"
end as'Signal'
from tcs1;

-- same operation for 6th stocks. --

create table tvs2 as
select date, `Close Price`,
case
    when `20 DAY Moving Average` > `50 DAY Moving Average` THEN "BUY"
    when `20 DAY Moving Average` < `50 DAY Moving Average` THEN "SELL"
    else "HOLD"
end as'Signal'
from tvs1;

-- Create a User defined function,  which will takes the date as input and returns the signal  for that particular day (Buy/Sell/Hold) for the Bajaj stock. --
-- keep in mind that date is passed in datetime format. --

create function usdef (d datetime)
returns char(4) deterministic
return (select `signal` from bajaj2 where date = DATE_FORMAT(d, "%d %M %Y") );

-- End of the project --
-- thank you --






