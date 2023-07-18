create database pivot;
use pivot;

create table sales_data
    (
        sales_date      date,
        customer_id     varchar(30),
        amount          varchar(30)
    );
insert into sales_data 
values
(str_to_date('01-Jan-2021','%d-%b-%Y'), 'Cust-1', '50$'),
(str_to_date('02-Jan-2021','%d-%b-%Y'), 'Cust-1', '50$'),
(str_to_date('03-Jan-2021','%d-%b-%Y'), 'Cust-1', '50$'),
(str_to_date('01-Jan-2021','%d-%b-%Y'), 'Cust-2', '100$'),
(str_to_date('02-Jan-2021','%d-%b-%Y'), 'Cust-2', '100$'),
(str_to_date('03-Jan-2021','%d-%b-%Y'), 'Cust-2', '100,$'),
 (str_to_date('01-Feb-2021','%d-%b-%Y'), 'Cust-2', '-100$'),
 (str_to_date('02-Feb-2021','%d-%b-%Y'), 'Cust-2', '-100$'),
 (str_to_date('03-Feb-2021','%d-%b-%Y'), 'Cust-2', '-100$'),
 (str_to_date('01-Mar-2021','%d-%b-%Y'), 'Cust-3', '1$'),
 (str_to_date('01-Apr-2021','%d-%b-%Y'), 'Cust-3', '1$'),
 (str_to_date('01-May-2021','%d-%b-%Y'), 'Cust-3', '1$'),
(str_to_date('01-Jun-2021','%d-%b-%Y'), 'Cust-3', '1$'),
(str_to_date('01-Jul-2021','%d-%b-%Y'), 'Cust-3', '-1$'),
 (str_to_date('01-Aug-2021','%d-%b-%Y'), 'Cust-3', '-1$'),
 (str_to_date('01-Sep-2021','%d-%b-%Y'), 'Cust-3', '-1$'),
 (str_to_date('01-Oct-2021','%d-%b-%Y'), 'Cust-3', '-1$'),
 (str_to_date('01-Nov-2021','%d-%b-%Y'), 'Cust-3', '-1$'),
 (str_to_date('01-Dec-2021','%d-%b-%Y'), 'Cust-3', '-1$');

select * from sales_data;

WITH cte AS(
SELECT customer_id AS Customer
, DATE_FORMAT(sales_date,'%b-%y') AS SALES_DATE
, REPLACE(amount,'$','') as AMOUNT
FROM sales_data),
CTE2 as 
(
SELECT Customer
   , sum(CASE WHEN SALES_DATE='Jan-21' THEN amount ELSE 0 END) AS Jan_21
   , sum(CASE WHEN SALES_DATE='Feb-21' THEN amount ELSE 0 END) AS Feb_21
   , sum(CASE WHEN SALES_DATE='Mar-21' THEN amount ELSE 0 END) AS Mar_21
   , sum(CASE WHEN SALES_DATE='Apr-21' THEN amount ELSE 0 END) AS Apr_21
   , sum(CASE WHEN SALES_DATE='May-21' THEN amount ELSE 0 END) AS May_21
   , sum(CASE WHEN SALES_DATE='Jun-21' THEN amount ELSE 0 END) AS Jun_21
   , sum(CASE WHEN SALES_DATE='Jul-21' THEN amount ELSE 0 END) AS Jul_21
   , sum(CASE WHEN SALES_DATE='Aug-21' THEN amount ELSE 0 END) AS Aug_21
   , sum(CASE WHEN SALES_DATE='Sep-21' THEN amount ELSE 0 END) AS Sep_21
   , sum(CASE WHEN SALES_DATE='Oct-21' THEN amount ELSE 0 END) AS Oct_21
   , sum(CASE WHEN SALES_DATE='Nov-21' THEN amount ELSE 0 END) AS Nov_21
   , sum(CASE WHEN SALES_DATE='Dec-21' THEN amount ELSE 0 END) AS Dec_21
   , sum(amount) as Total
FROM cte
GROUP BY Customer
UNION 
SELECT 'Total' Customer
   , sum(CASE WHEN SALES_DATE='Jan-21' THEN amount ELSE 0 END) AS Jan_21
   , sum(CASE WHEN SALES_DATE='Feb-21' THEN amount ELSE 0 END) AS Feb_21
   , sum(CASE WHEN SALES_DATE='Mar-21' THEN amount ELSE 0 END) AS Mar_21
   , sum(CASE WHEN SALES_DATE='Apr-21' THEN amount ELSE 0 END) AS Apr_21
   , sum(CASE WHEN SALES_DATE='May-21' THEN amount ELSE 0 END) AS May_21
   , sum(CASE WHEN SALES_DATE='Jun-21' THEN amount ELSE 0 END) AS Jun_21
   , sum(CASE WHEN SALES_DATE='Jul-21' THEN amount ELSE 0 END) AS Jul_21
   , sum(CASE WHEN SALES_DATE='Aug-21' THEN amount ELSE 0 END) AS Aug_21
   , sum(CASE WHEN SALES_DATE='Sep-21' THEN amount ELSE 0 END) AS Sep_21
   , sum(CASE WHEN SALES_DATE='Oct-21' THEN amount ELSE 0 END) AS Oct_21
   , sum(CASE WHEN SALES_DATE='Nov-21' THEN amount ELSE 0 END) AS Nov_21
   , sum(CASE WHEN SALES_DATE='Dec-21' THEN amount ELSE 0 END) AS Dec_21
   , '' Total
FROM cte
)
SELECT Customer
, case when Jan_21 < 0 then concat('(', Jan_21 * -1 , ')$') else concat(Jan_21, '$') end as "Jan-21"
, case when Feb_21 < 0 then concat('(', Feb_21 * -1 , ')$') else concat(Feb_21, '$') end as "Feb-21"
, case when Mar_21 < 0 then concat('(', Mar_21 * -1 , ')$') else concat(Mar_21, '$') end as "Mar-21"
, case when Apr_21 < 0 then concat('(', Apr_21 * -1 , ')$') else concat(Apr_21, '$') end as "Apr-21"
, case when May_21 < 0 then concat('(', May_21 * -1 , ')$') else concat(May_21, '$') end as "May-21"
, case when Jun_21 < 0 then concat('(', Jun_21 * -1 , ')$') else concat(Jun_21, '$') end as "Jun-21"
, case when Jul_21 < 0 then concat('(', Jul_21 * -1 , ')$') else concat(Jul_21, '$') end as "Jul-21"
, case when Aug_21 < 0 then concat('(', Aug_21 * -1 , ')$') else concat(Aug_21, '$') end as "Aug-21"
, case when Sep_21 < 0 then concat('(', Sep_21 * -1 , ')$') else concat(Sep_21, '$') end as "Sep-21"
, case when Oct_21 < 0 then concat('(', Oct_21 * -1 , ')$') else concat(Oct_21, '$') end as "Oct-21"
, case when Nov_21 < 0 then concat('(', Nov_21 * -1 , ')$') else concat(Nov_21, '$') end as "Nov-21"
, case when Dec_21 < 0 then concat('(', Dec_21 * -1 , ')$') else concat(Dec_21, '$') end as "Dec-21"
, case when Total ='' then '' else 
              case when Total < 0 then concat('(', Total * -1 , ')$') else concat(Total, '$') end 
end as  Total

FROM CTE2

