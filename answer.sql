### Customer Analysis - using Bills Table 
-- Question 1: Top 5 customers with the highest total bill amount
SELECT CustomerID, SUM(TotalAmount) AS TotalSpent
FROM bills
GROUP BY CustomerID
ORDER BY TotalSpent DESC
LIMIT 5;

-- Question 2: Average time taken to pay a bill for each customer
SELECT CustomerID, 
       AVG(DATEDIFF(DueDate, BillDate)) AS AvgPaymentTime
FROM bills
WHERE Status = 'Paid'
GROUP BY CustomerID;

-- Question 3: Customers who have never made a late payment
SELECT DISTINCT CustomerID
FROM bills
WHERE DATEDIFF(DueDate, BillDate) >= 0;

### Bill Analysis - using Bill_Items Table

-- Question 1: Total amount generated from bills
SELECT SUM(TotalAmount) AS TotalRevenue
FROM bills;
-- Question 2: Item with the highest LineTotal
SELECT *
FROM bill_items
ORDER BY LineTotal DESC
LIMIT 1;
-- Question 3: Item with the minimum LineTotal
SELECT *
FROM bill_items
ORDER BY LineTotal ASC
LIMIT 1;
### Payment Analysis - using Payment Table
-- Question 1: Most popular payment method

SELECT PaymentMethod, COUNT(*) AS MethodCount
FROM payments
GROUP BY PaymentMethod
ORDER BY MethodCount DESC
LIMIT 1;

-- Question 2: Total revenue by payment method
SELECT PaymentMethod, SUM(Amount) AS TotalRevenue
FROM payments
GROUP BY PaymentMethod;

-- Question 3: Average payment amount
SELECT AVG(Amount) AS AvgPayment
FROM payments;

### Data Analysis and Insights - using Bills Table
-- Question 1: Top 3 categories with the highest total revenue
SELECT CategoryID, SUM(TotalAmount) AS TotalRevenue
FROM bills
GROUP BY CategoryID
ORDER BY TotalRevenue DESC
LIMIT 3;
-- Question 2: Customer with the highest number of unpaid bills
SELECT CustomerID, COUNT(*) AS UnpaidBills
FROM bills
WHERE Status = 'Unpaid'
GROUP BY CustomerID
ORDER BY UnpaidBills DESC
LIMIT 1;
