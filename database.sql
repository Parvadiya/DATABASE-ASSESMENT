-- Create a Bank table,

CREATE TABLE Bank (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(50),
    branch_city VARCHAR(50)
);

-- Dumping data for table `bank`

INSERT INTO `BANK` (`branch_id`, `branch_name`, `branch_city`) VALUES
(850, 'HDFC thane', 'mumbai'),
(1024, 'bank of baroda adajan', 'surat'),
(1080, 'bank of baroda piplod', 'surat'),
(2450, 'yes bank borivalli', 'mumbai');

-- Create a Loan table

CREATE TABLE Loan (
    loan_no INT PRIMARY KEY,
    branch_id INT,
    account_holder_id INT,
    loan_amount DECIMAL(10,2),
    loan_type VARCHAR(50),
);

-- Dumping data for table `loan`

INSERT INTO `loan`(`loan_no`, `branch_id`, `account_holder_id`, `loan_amount`, `loan_type`) VALUES 
(124221, 1024, 2451, 100000, 'study loan'),
(245011, 1080, 14870, 2500000, 'home loan'),
(421547, 1080, 20004, 5000000, 'personal loan'),
(264012, 850, 24770, 7500000, 'business loan'),
(147589, 850, 32401, 1500000, 'home loan'),
(124587, 1024, 45726, 150000, 'study loan');

-- Create a table named as Account holder

CREATE TABLE AccountHolder (
    account_holder_id INT PRIMARY KEY,
    account_no INT,
    account_holder_name VARCHAR(50),
    city VARCHAR(50),
    contact VARCHAR(15),
    date_created DATE,
    account_status VARCHAR(20),
    account_type VARCHAR(20),
    balance DECIMAL(10,2)
);

-- Dumping data for table `AccountHolder`

INSERT INTO `accountholder`(`account_holder_id`, `account_no`, `account_holder_name`, `city`, `contact`, `date_created`, `account_status`, `account_type`, `balance`) VALUES
(45726, '2044871', 'vipul sapra', 'mumbai', 2147483647, '24/8/21', 'active', 'current account', 1800000),
(2451, '2459788', 'kashyap patel', 'surat', 2147483647, '20/1/20', 'active', 'current account', 1500000),
(32401, '2647701', 'harish chauhan', 'mumbai', 2147483647, '01/3/21', 'active', 'saving account', 500000),
(14870, '3014780', 'himesh rana', 'mumbai', 2147483647, '15/2/19', 'active', 'saving account', 700000),
(20004, '5214000', 'harsh patel', 'surat', 2147483647, '02/8/22', 'active', 'current account', 2500000);


-- Transaction

CREATE TABLE bankaccounts(accountno varchar(20) PRIMARY KEY NOT NULL, funds decimal(8,2));


INSERT INTO `bankaccounts`(`accountno`, `funds`) VALUES 
("ACC1", 1000),("ACC2", 1000);


START TRANSACTION;
UPDATE bankaccounts SET funds=funds-100 WHERE accountno='ACC1';
UPDATE bankaccounts SET funds=funds+100 WHERE accountno='ACC2';
COMMIT;


-- Also fetch the details of the account holder who are related from the same city

SELECT *FROM AccountHolder a1 JOIN AccountHolder a2 ON a1.city = a2.city AND a1.account_holder_id <> a2.account_holder_id;

-- Write a query to fetch account number and account holder name, whose accounts were created after 15th of any month

SELECT account_no, account_holder_name
FROM AccountHolder
WHERE DAY(date_created) > 15;

-- Write a query to display the city name and count the branches in that city.
-- Give the count of branches an alias name of Count_Branch

SELECT branch_city, COUNT(*) AS Count_Branch
FROM Bank
GROUP BY branch_city;

-- Write a query to display the account holder’s id, account holder’s name,
-- branch id, and loan amount for people who have taken loans. 

SELECT ah.account_holder_id, ah.account_holder_name, l.branch_id, l.loan_amount
FROM AccountHolder ah
JOIN Loan l ON ah.account_holder_id = l.account_holder_id;