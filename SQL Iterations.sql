SELECT store.store_id, SUM(payment.amount) AS total_sales
FROM store
JOIN staff ON staff.store_id = store.store_id
JOIN payment ON payment.staff_id = staff.staff_id
GROUP BY store.store_id;

CREATE PROCEDURE GetTotalSalesByStore
AS
BEGIN
  SELECT store.store_id, SUM(payment.amount) AS total_sales
  FROM store
  JOIN staff ON staff.store_id = store.store_id
  JOIN payment ON payment.staff_id = staff.staff_id
  GROUP BY store.store_id;
END.

REATE PROCEDURE GetTotalSalesByStoreID
  (store_ID) INT
AS
BEGIN
  SELECT store.store_id, SUM(payment.amount) AS total_sales
  FROM store
  JOIN staff ON staff.store_id = store.store_id
  JOIN payment ON payment.staff_id = staff.staff_id
  WHERE store.store_id = @storeID
  GROUP BY store.store_id;
END.

DECLARE total_sales_value FLOAT;
EXEC GetTotalSalesByStoreID storeID = 1, total_sales = total_sales_value OUTPUT;
select 'Total sales for store 1: ' + CONVERT(VARCHAR, total_sales_value);

