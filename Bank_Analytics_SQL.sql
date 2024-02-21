-- Bank Analytics MySQL project --

-- Creating a database "Bank analytics"
create database bank_analytics;

-- Selecting all the columns from finance_1
select * from finance_1;
alter table finance_1 modify issue_d date;

-- Selecting all the columns from finance_2
select * from finance_2;

-- KPI1: Yearwise loan amount
select Year_issueD, sum(loan_amnt) as Total_loan_amount
from finance_1
group by Year_issueD
order by Year_issueD;

-- KPI2: Grade and sub-grade wise revol balance
select grade, sub_grade, sum(revol_bal) as Total_revol_bal
from finance_1 inner join finance_2 on(finance_1.id = finance_2.id)
group by grade,sub_grade
order by grade,sub_grade;


-- KPI3: Total payment for Verified status vs Total payment for Non-Verified status
select verification_status, round(sum(finance_2.total_pymnt),2) as Total_payment
from finance_1 inner join finance_2 on(finance_1.id = finance_2.id)
group by verification_status;

-- KPI4: State wise and month wise loan status
select addr_State, last_Credit_pull_D, loan_Status
from finance_1 inner join finance_2 on(finance_1.id = finance_2.id)
group by addr_State, last_Credit_pull_D, loan_Status
order by last_Credit_pull_D;

-- KPI5: Home ownership vs last payment date stats
select home_ownership, year(last_pymnt_d) as Year_of_last_payment, round(sum(last_pymnt_amnt),2) as Total_payment
from finance_1 inner join finance_2 on(finance_1.id = finance_2.id)
group by  home_ownership, last_pymnt_d
order by  home_ownership, last_pymnt_d;



