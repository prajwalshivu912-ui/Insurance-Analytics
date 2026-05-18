create database Insurance_Analytics;
use Insurance_Analytics;
show tables;
drop table customer_data;
describe policy_data;

#1
select count(*) as Total_policies from policy_data ;

select status,count(*) as Total_policies from policy_data group by status;


#2
select count(distinct customer_id) 

as total_customers_with_policies

 from policy_data;
#3
select
case
when Age<=25 then "18-25"
when Age<=35 then "26-35"
when Age<=45 then "36-45"
when Age<=60 then "45-60"
else " 60 +" 
End as Age_group,
count(*) As Customer_count
 from Customer_info group by Age_Group;
 #4
 select Gender, count(*) as Policy_count From Customer_info group By Gender;
#5
select policy_Type, count(*) as Policy_Count from policy_data group by Policy_type;
#6
select count(*) AS Policy_Expire_This_year from policy_data where right(Policy_End_Date,4) = year(curdate());
#7
SELECT 
(SUM(CASE WHEN RIGHT(Policy_Start_Date,4) = '2024' THEN Premium_Amount END)
-
    SUM(CASE WHEN RIGHT(Policy_Start_Date,4) = '2023' THEN Premium_Amount END))
/
SUM(CASE WHEN RIGHT(Policy_Start_Date,4) = '2023' THEN Premium_Amount END) * 100 AS Premium_Growth_Rate FROM policy_data;

#8
Select claim_Status, count(*) as Policy_Count from Claim_data group by Claim_Status;
#9
Select Payment_Status, count(*) as Policy_Count From Payment_Status group by Payment_Status;
#10
select sum(Claim_Amount) as Total_claim_amount from claim_data;


