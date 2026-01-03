--1. Which transactions are missing in System B but present in System A?

SELECT A.Transaction_ID, B.Transaction_ID FROM System_a_records AS A
LEFT JOIN System_b_records AS B
ON A.Transaction_ID = B.Transaction_ID
WHERE B.Transaction_ID IS NULL


--2. Which transactions are missing in System A but present in System B?

SELECT A.Transaction_ID, B.Transaction_ID FROM System_a_records AS A
RIGHT JOIN System_b_records AS B
ON A.Transaction_ID = B.Transaction_ID
WHERE A.Transaction_ID IS NULL


--3. Which transactions exist in both systems but are marked as Unmatched in either system?

SELECT * FROM System_a_records AS A
JOIN  System_b_records AS B
ON A.transaction_ID = B.transaction_ID
WHERE A.record_status = 'Unmatched'
OR B.record_status = 'Unmatched'


--4. Which transactions have amount mismatches between System A and System B?

SELECT A.transaction_ID, A.amount, B.amount FROM System_a_records AS A
JOIN System_b_records as B
ON A.Transaction_ID = B.Transaction_ID
WHERE A.amount <> B.amount


--5. What is the total count and percentage of unmatched transactions?

SELECT COUNT(*) AS Unmatched_count, COUNT(*)*100/(SELECT COUNT(*) FROM Transactions) AS percentage
FROM System_a_records AS A
WHERE Record_status = 'Unmatched'


--6. Which transactions were posted after the settlement date?

SELECT T.Transaction_ID, T.settlement_date, A.posted_date FROM Transactions AS T
JOIN system_a_records AS A
ON T.transaction_ID = A.transaction_ID
WHERE T.Settlement_date < A.posted_date


--7. How many days late were delayed transactions posted by each system?

SELECT T.transaction_ID, T.settlement_date, A.posted_date, (A.posted_date - T.settlement_date) AS Days_delayed FROM transactions AS T
JOIN system_a_records AS A
ON T.Transaction_ID = A.Transaction_ID
WHERE T.settlement_date < A.posted_date


--8. What is the total financial exposure from unmatched transactions?

SELECT SUM(amount) AS total_financial_exposure FROM system_a_records
WHERE record_status = 'Unmatched'


--9. Which counterparties contribute the highest unmatched amount?

SELECT T.counterparty, SUM(A.amount) AS unmatched_amount FROM transactions AS T 
JOIN system_a_records AS A 
ON T.transaction_ID = A.transaction_ID
WHERE A.record_status='Unmatched' 
GROUP BY T.counterparty 
ORDER BY unmatched_amount DESC


--10. Which transaction types (Buy/Sell) have higher break rates?

SELECT T.transaction_type, COUNT(*) AS breaks FROM transactions AS T 
JOIN system_a_records AS A 
ON T.transaction_id = A.transaction_id 
WHERE A.record_status= 'Unmatched' 
GROUP BY T.transaction_type


--11. What is the reconciliation break trend by trade date?

SELECT trade_date, COUNT(*) as break_count FROM Transactions AS T
JOIN system_a_records AS A
ON T.transaction_ID = A.transaction_ID
WHERE A.record_status = 'Unmatched'
GROUP BY T.trade_date


--12. Which currency has the highest amount mismatch rate?

SELECT T.currency, COUNT(*) AS Mismatch_count FROM transactions AS T
JOIN system_a_records AS A
ON T.transaction_ID = A.Transaction_ID
JOIN system_b_records AS B
ON A.transaction_ID = B.Transaction_ID
WHERE A.amount <> B.amount
GROUP BY T.currency
ORDER BY MismatcH_count DESC


--13. What percentage of failed transactions also result in reconciliation breaks?

SELECT COUNT(*)*100/(SELECT COUNT(*) FROM transactions WHERE status='Failed') AS Failed_percentage_Brk FROM Transactions AS T
JOIN system_a_records AS A
ON T.transaction_ID = A.Transaction_ID
WHERE T.status = 'Failed' 
AND A.record_status = 'Unmatched'


--14. Which counterparties consistently appear in breaks across both systems?

SELECT T.counterparty, COUNT(*) AS brk_count FROM Transactions T
JOIN system_a_records AS A
ON T.transaction_ID = A.transaction_ID
JOIN system_b_records AS B
ON A.transaction_ID = B.transaction_ID
WHERE A.record_status = 'Unmatched'
OR B.record_status = 'Unmatched'
GROUP BY T.counterparty
HAVING COUNT(*) > 1
ORDER BY (COUNT(A.record_status), COUNT(B.record_status)) DESC


--15. Which transactions are high-amount (top 10%) and unmatched?

SELECT t.* FROM Transactions AS T
JOIN system_a_records AS A
ON T.transaction_ID = A.transaction_ID
JOIN system_b_records AS B
ON A.transaction_ID = B.transaction_ID
WHERE A.record_status = 'Unmatched'
OR B.record_status = 'Unmatched'
ORDER BY T.amount DESC
LIMIT (SELECT COUNT(*)*10/100 FROM Transactions)