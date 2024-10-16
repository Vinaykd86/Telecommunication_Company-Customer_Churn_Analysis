CREATE DATABASE db_churn;
use db_churn;
SELECT * FROM customer_data;

SELECT Gender, COUNT(Gender) AS Totalcount, 
       COUNT(Gender)*100 / (SELECT COUNT(*) FROM customer_data) AS PERCENTAGE
FROM customer_data
GROUP BY Gender;

SELECT Contract, Count(Contract) as TotalCount,
Count(Contract) * 100 / (Select Count(*) from customer_data)  as Percentage
from customer_data
Group by Contract;

SELECT Customer_Status, Count(Customer_Status) as TotalCount, Sum(Total_Revenue) as TotalRev,
Sum(Total_Revenue) / (Select sum(Total_Revenue) from customer_data) * 100  as RevPercentage
from customer_data
Group by Customer_Status;

SELECT State, Count(State) as TotalCount,
Count(State) * 100 / (Select Count(*) from customer_data)  as Percentage
from customer_data
Group by State
Order by Percentage desc;

UPDATE customer_data
SET 
    Customer_ID = NULLIF(Customer_ID, ''),
    Gender = NULLIF(Gender, ''),
    Age = NULLIF(Age, ''),
    Married=NULLIF(Married,''),
    State=NULLIF(State,''),
    Number_of_Referrals = NULLIF(Number_of_Referrals, ''),
    Tenure_in_Months= NULLIF(Tenure_in_Months, ''),
    Phone_Service = NULLIF(Phone_Service, ''),
    Multiple_Lines = NULLIF(Multiple_Lines, ''),
    Internet_Service= NULLIF(Internet_Service, ''),
    Internet_Type = NULLIF(Internet_Type, ''),
    Online_Security = NULLIF(Online_Security, ''),
    Online_Backup = NULLIF(Online_Backup, ''),
    Device_Protection_Plan = NULLIF(Device_Protection_Plan, ''),
    Premium_Support= NULLIF(Premium_Support, ''),
    Streaming_TV = NULLIF(Streaming_TV, ''),
    Streaming_Movies = NULLIF(Streaming_Movies, ''),
    Streaming_Music = NULLIF(Streaming_Music, ''),
    Unlimited_Data= NULLIF(Unlimited_Data, ''),
    Contract = NULLIF(Contract, ''),
    Paperless_Billing= NULLIF(Paperless_billing, ''),
    Payment_Method=NULLIF(Payment_Method,''),
    Monthly_Charge= NULLIF(Monthly_Charge, ''),
    Total_Charges= NULLIF(Total_Charges, ''),
    Total_Refunds= NULLIF(Total_Refunds, ''),
    Total_Extra_Data_Charges= NULLIF(Total_Extra_Data_Charges, ''),
    Total_Long_Distance_Charges= NULLIF(Total_Long_Distance_Charges, ''),
	Customer_Status= NULLIF(Customer_Status, ''),
    Value_Deal = NULLIF(Value_Deal, ''),
    Churn_Category = NULLIF(Churn_Category, ''),
    Churn_Reason = NULLIF(Churn_Reason, '')
WHERE 
	Customer_ID ='' OR
    Gender ='' OR
    Age ='' OR
    Married='' OR 
    State='' OR 
    Number_of_Referrals ='' OR
    Tenure_in_Months='' OR
    Phone_Service ='' OR
    Multiple_Lines =''OR
    Internet_Service='' OR
    Internet_Type = '' OR
    Online_Security ='' OR
    Online_Backup ='' OR
    Device_Protection_Plan =''OR
    Premium_Support='' OR
    Streaming_TV ='' OR 
    Streaming_Movies ='' OR
    Streaming_Music = '' OR
    Unlimited_Data='' OR
    Contract ='' OR
    Paperless_Billing='' OR
    Payment_Method='' OR
     Monthly_Charge='' OR
    Total_Charges='' OR
    Total_Refunds='' OR
    Total_Extra_Data_Charges= '' OR
    Total_Long_Distance_Charges='' OR
	Customer_Status= ''OR
    Value_Deal = '' OR
    Churn_Category = '' OR
    Churn_Reason = '';
    SET sql_safe_updates=0;

SELECT 
    SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Customer_ID_Null_Count,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Gender_Null_Count,
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Age_Null_Count,
    SUM(CASE WHEN Married IS NULL THEN 1 ELSE 0 END) AS Married_Null_Count,
    SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END) AS State_Null_Count,
    SUM(CASE WHEN Number_of_Referrals IS NULL THEN 1 ELSE 0 END) AS Number_of_Referrals_Null_Count,
    SUM(CASE WHEN Tenure_in_Months IS NULL THEN 1 ELSE 0 END) AS Tenure_in_Months_Null_Count,
    SUM(CASE WHEN Value_Deal IS NULL THEN 1 ELSE 0 END) AS Value_Deal_Null_Count,
    SUM(CASE WHEN Phone_Service IS NULL THEN 1 ELSE 0 END) AS Phone_Service_Null_Count,
    SUM(CASE WHEN Multiple_Lines IS NULL THEN 1 ELSE 0 END) AS Multiple_Lines_Null_Count,
    SUM(CASE WHEN Internet_Service IS NULL THEN 1 ELSE 0 END) AS Internet_Service_Null_Count,
    SUM(CASE WHEN Internet_Type IS NULL THEN 1 ELSE 0 END) AS Internet_Type_Null_Count,
    SUM(CASE WHEN Online_Security IS NULL THEN 1 ELSE 0 END) AS Online_Security_Null_Count,
    SUM(CASE WHEN Online_Backup IS NULL THEN 1 ELSE 0 END) AS Online_Backup_Null_Count,
    SUM(CASE WHEN Device_Protection_Plan IS NULL THEN 1 ELSE 0 END) AS Device_Protection_Plan_Null_Count,
    SUM(CASE WHEN Premium_Support IS NULL THEN 1 ELSE 0 END) AS Premium_Support_Null_Count,
    SUM(CASE WHEN Streaming_TV IS NULL THEN 1 ELSE 0 END) AS Streaming_TV_Null_Count,
    SUM(CASE WHEN Streaming_Movies IS NULL THEN 1 ELSE 0 END) AS Streaming_Movies_Null_Count,
    SUM(CASE WHEN Streaming_Music IS NULL THEN 1 ELSE 0 END) AS Streaming_Music_Null_Count,
    SUM(CASE WHEN Unlimited_Data IS NULL THEN 1 ELSE 0 END) AS Unlimited_Data_Null_Count,
    SUM(CASE WHEN Contract IS NULL THEN 1 ELSE 0 END) AS Contract_Null_Count,
    SUM(CASE WHEN Paperless_Billing IS NULL THEN 1 ELSE 0 END) AS Paperless_Billing_Null_Count,
    SUM(CASE WHEN Payment_Method IS NULL THEN 1 ELSE 0 END) AS Payment_Method_Null_Count,
    SUM(CASE WHEN Monthly_Charge IS NULL THEN 1 ELSE 0 END) AS Monthly_Charge_Null_Count,
    SUM(CASE WHEN Total_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Charges_Null_Count,
    SUM(CASE WHEN Total_Refunds IS NULL THEN 1 ELSE 0 END) AS Total_Refunds_Null_Count,
    SUM(CASE WHEN Total_Extra_Data_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Extra_Data_Charges_Null_Count,
    SUM(CASE WHEN Total_Long_Distance_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Long_Distance_Charges_Null_Count,
    SUM(CASE WHEN Total_Revenue IS NULL THEN 1 ELSE 0 END) AS Total_Revenue_Null_Count,
    SUM(CASE WHEN Customer_Status IS NULL THEN 1 ELSE 0 END) AS Customer_Status_Null_Count,
    SUM(CASE WHEN Churn_Category IS NULL THEN 1 ELSE 0 END) AS Churn_Category_Null_Count,
    SUM(CASE WHEN Churn_Reason IS NULL THEN 1 ELSE 0 END) AS Churn_Reason_Null_Count
FROM customer_data;

UPDATE customer_data
SET 
    Value_Deal = IFNULL(Value_Deal, 'None'),
    Multiple_Lines = IFNULL(Multiple_Lines, 'No'),
    Internet_Type = IFNULL(Internet_Type, 'None'),
    Online_Security = IFNULL(Online_Security, 'No'),
    Online_Backup = IFNULL(Online_Backup, 'No'),
    Device_Protection_Plan = IFNULL(Device_Protection_Plan, 'No'),
    Premium_Support = IFNULL(Premium_Support, 'No'),
    Streaming_TV = IFNULL(Streaming_TV, 'No'),
    Streaming_Movies = IFNULL(Streaming_Movies, 'No'),
    Streaming_Music = IFNULL(Streaming_Music, 'No'),
    Unlimited_Data = IFNULL(Unlimited_Data, 'No'),
    Churn_Category = IFNULL(Churn_Category, 'Others'),
    Churn_Reason = IFNULL(Churn_Reason, 'Others');
    select* from customer_data;
    




