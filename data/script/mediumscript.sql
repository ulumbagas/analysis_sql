-- 1. Tampilkan daftar firstName dari tabel employees yang hanya dimiliki oleh tepat satu orang karyawan (tidak ada karyawan lain yang memiliki nama depan sama). Urutkan berdasarkan firstName menaik (A–Z).

SELECT
	firstName
FROM
	employees
GROUP BY
	firstName
HAVING
	COUNT (*)= 1
ORDER BY
	firstName ASC;

-- 2. Untuk setiap productLine pada tabel products, tampilkan productLine, jumlah produk (totalProducts), dan rata-rata harga MSRP yang dibulatkan 2 angka desimal (avgMSRP). Urutkan dari totalProducts terbanyak ke tersedikit, lalu productLine menaik.
SELECT
	productLine,
	COUNT(productLine) as TotalProduct,
	ROUND(AVG(MSRP), 2) as AvgMSRP
from
	products
GROUP BY
	productLine
ORDER BY
	COUNT(productLine) DESC,
	productLine ASC ;