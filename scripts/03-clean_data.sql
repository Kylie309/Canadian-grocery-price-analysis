CREATE TABLE cleaned_data AS SELECT nowtime, vendor, product_id, product_name, brand, current_price, old_price, units, price_per_unit, other 
	FROM raw 
	INNER JOIN product 
	ON raw.product_id = product.id 
	WHERE
		(product.product_name LIKE '%original%' AND product.brand LIKE '%miss vick%') OR
		(product.product_name LIKE '%miss vick%original%');