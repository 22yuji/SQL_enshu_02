--1
CREATE TABLE sales_old(
    sales_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT NOT NULL REFERENCES customer(customer_id),
    amount DECIMAL);

--2
INSERT INTO sales_old VALUES
(6, '2018/09/02', 2, 20000),
(7, '2018/09/02', 1, 5000),
(8, '2018/09/02', 3, 6000),
(9, '2018/09/05', 1, 3000);

--3
INSERT INTO sales
SELECT * FROM sales_old;

--4
DROP TABLE sales_old;

--5
SELECT sales_id, ordre_date,
    (CASE WHEN ordre_date < '2018/10/01' THEN '〇'
          ELSE '' END) is_old
FROM sales
ORDER BY ordre_date;

--6
SELECT customer_id || ':' || customer_name as customer_id_name
FROM customer
ORDER BY customer_id;

--7
SELECT *
FROM sales
WHERE customer_id = 1
ORDER BY ordre_date DESC
LIMIT 2;

--8
SELECT ordre_date, sum(amount) sum_amount
FROM sales
WHERE ordre_date =
(
    SELECT min(ordre_date)
    FROM sales
)
GROUP BY ordre_date;

--9
SELECT s.customer_id, c.customer_name, TRUNC(avg(amount)) avg_amount
FROM sales s
JOIN customer c
ON s.customer_id = c.customer_id
GROUP BY s.customer_id, c.customer_name
ORDER BY customer_id;

--10
SELECT *
FROM sales
WHERE sales_id =
(
    SELECT sales_id
    FROM sales
    WHERE ordre_date BETWEEN '2018/09/01' AND '2018/09/30'
    ORDER BY amount DESC LIMIT 1
);