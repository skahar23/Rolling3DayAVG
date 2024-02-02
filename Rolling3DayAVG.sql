SELECT
transaction_date,avg_day,
AVG(avg_day) OVER(
  	ORDER BY transaction_date
  	ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  )AS rolling_avg_3day
  
  from
  (
    
    SELECT 
	transaction_date,
    AVG(transaction_amount) AS avg_day
FROM
	(	
      SELECT
      	DATE_TRUNC('day',transaction_time)AS transaction_date,
      	transaction_amount
      FROM
      	transactions
      WHERE 
      	transaction_time>='2021-01-01' AND transaction_time< '2021-02-01'
      ) AS A
 GROUP BY
 	transaction_date
    )AS B
 ORDER BY
  	transaction_date; 
