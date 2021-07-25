# SQL REVIEW
# 1. Write a SELECT statement that lists the customer id along with their account number, type, the city the customer lives in and their postalcode.

# exploring the tables
select * from address; #postal code and city
select * from customer; #customer id and type and account
select * from customeraddress; #joining fields-cust id, addr id

# exploring customer info
select * from customer c
join customeraddress ca using(CustomerID)
join address a using(AddressID);

# final approach
select c.CustomerID, c.CustomerType,c.AccountNumber,a.City, a.PostalCode
from customer c 
join customeraddress ca using(CustomerID)
join address a using(AddressID);


# 2. Write a SELECT statement that lists the 20 most recently launched products, their name and colour
select Name, ProductNumber, Color from product
order by SellStartDate DESC
LIMIT 20;


# 3. Write a SELECT statement that shows how many products are on each shelf on 2/5/98
select Shelf, count(distinct ProductID)
from productinventory
where ModifiedDate = '1998-05-02 00:00:00'
group by Shelf;


# 4. I am trying to track down a vendor email address, his name is Stuart and he works at G&K Bicycle Corp. Can you help?
select * from contact c 
join vendorcontact vc using(ContactID)
join vendor v using(VendorID)
where FirstName = 'Stuart'
and v.Name = 'G & K Bicycle Corp.';


# 5. What’s the total sales tax amount for sales to Germany? What’s the top region in Germany by sales tax?

# first part
select sum(TaxAmt) as sales_tax_amount
from salesorderheader
join salesterritory using(TerritoryID)
where Name = 'Germany';

# other approach for first part
select sum(TaxAmt),cr.Name from salesorderheader
join salesterritory st using (TerritoryID)
join countryregion cr using (CountryRegionCode)
where CountryRegionCode= 'DE';

# second part
SELECT sp.Name as RegionName, sum(s.TaxAmt) as taxtotal
FROM salesorderheader s # amounts
join salesterritory st using(TerritoryID) # country - filter
join address a on s.BillToAddressID = a.AddressID # ship address - to get region
join stateprovince sp using(StateProvinceID) # region 
where st.Name = 'Germany'
Group by sp.Name
order by sum(s.TaxAmt) DESC;


# 6. Summarise the distinct # transactions by month
select distinct(count(TransactionID)) as number_transactions, date_format(TransactionDate, '%Y%m') as date_month
from transactionhistory
group by date_format(TransactionDate, '%Y%m');

