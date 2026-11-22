-- Soal 1: Pelanggan dari Negara France Tampilkan customerNumber, customerName, city, dan country dari tabel customers   untuk semua pelanggan yang berasal dari negara 'France'.   Urutkan hasil berdasarkan customerName secara menaik (A–Z).

SELECT
    customerNumber,
    customerName,
    city,
    country
FROM customers
WHERE country = 'France'
ORDER BY customerName ASC;


-- Soal 2 Tampilkan customerName, city, dan country dari tabel customers untuk pelanggan yang kolom state-nya kosong (NULL). Urutkan berdasarkan country menaik, lalu customerName menaik.

SELECT
	customerName,
	city,
	country,
FROM
	customers
WHERE
	state is NULL
order BY
	country ASC,
	customerName asc;

-- soal 3 Tampilkan customerNumber, customerName, dan creditLimit dari tabel customers bagi pelanggan yang memiliki creditLimit sama dengan 0 ATAU creditLimit minimal 150000. Urutkan dari creditLimit terbesar ke terkecil, lalu customerName menaik.

SELECT
	customerNumber,
	customerName,
	creditLimit
from
	customers
WHERE
	creditLimit = 0
	or creditLimit > 150000
ORDER BY
	creditLimit desc;


-- 4. Tampilkan productCode, productName, productLine, dan buyPrice dari tabel products untuk produk dengan buyPrice di antara 50 sampai 70 (inklusif). Urutkan berdasarkan buyPrice menurun, lalu productCode menaik.
SELECT
	productCode,
	productName,
	productLine,
	buyPrice
FROM
	products
WHERE
	buyPrice BETWEEN 50 and 70
ORDER BY
	buyPrice DESC,
	productCode ASC;

-- 5. Tampilkan productCode, productName, dan productScale dari tabel products untuk produk yang namanya (productName) diawali dengan '196'. Urutkan berdasarkan productName secara menaik.

SELECT
	productCode,
	productName,
	productScale
FROM
	products
WHERE
	productName LIKE '196%'
ORDER BY
	productName ASC ;

-- 6. Tampilkan productName, productLine, dan quantityInStock dari tabel products untuk produk yang mengandung kata 'Ford' di dalam productName dan memiliki quantityInStock lebih dari 5000. Urutkan dari quantityInStock terbesar ke terkecil, lalu productCode menaik.

SELECT
	productName,
	productLine,
	quantityInStock
FROM
	products
WHERE
	productName LIKE '%Ford%'
	AND quantityInStock > 5000
ORDER BY
	quantityInStock DESC,
	productCode ASC;


-- 7. Tampilkan daftar seluruh negara (country) yang unik (tanpa duplikasi) dari tabel customers. Urutkan secara alfabetis (A–Z).

SELECT
	DISTINCT(country) AS NEGORO
FROM
	customers
ORDER BY
	country ASC;

-- 8. Tampilkan officeCode, city, country, dan territory dari tabel offices untuk kantor yang lokasinya BUKAN di negara 'USA' maupun 'UK'. Urutkan berdasarkan country menaik, lalu officeCode menaik

SELECT
	officeCode,
	city,
	country,
	territory
FROM
	offices
WHERE
	country NOT IN ('USA', 'UK')
	ORDER BY country ASC;

-- 9. Tampilkan orderNumber, orderDate, requiredDate, dan status dari tabel orders untuk semua pesanan yang statusnya bukan 'Shipped'. Urutkan dari orderDate terbaru ke terlama, lalu orderNumber menurun.
SELECT
	orderNumber,
	orderDate,
	requiredDate,
	status
FROM
	orders
WHERE
	status is NOT 'Shipped'
ORDER BY
	orderDate DESC,
	orderNumber DESC ;

-- 10. Tampilkan orderNumber, orderDate, dan status dari tabel orders untuk seluruh pesanan yang terjadi pada tahun 2005. Urutkan berdasarkan orderDate menaik, lalu orderNumber menaik.

SELECT
	orderNumber,
	orderDate,
	status
from
	orders
WHERE
	orderDate >= '2005-01-01'
	AND orderDate <= '2005-12-31'
ORDER BY
	orderDate ASC,
	orderNumber DESC;


SELECT
	orderNumber,
	orderDate,
	status
from
	orders
WHERE
	strftime('%Y',orderDate) ='2005'
ORDER BY
	orderDate ASC,
	orderNumber DESC;

-- 11. Tampilkan employeeNumber, nama lengkap karyawan dengan alias fullName (gabungan firstName, spasi, dan lastName), serta jobTitle dari tabel employees. Urutkan berdasarkan lastName menaik, lalu firstName menaik.

SELECT
	employeeNumber,
	CONCAT(firstName, ' ', lastName) AS 'Full Name',
	jobTitle
FROM
	employees;

-- 12. Tampilkan 10 produk teratas dengan selisih antara MSRP dan buyPrice terbesar. Kolom hasil: productCode, productName, buyPrice, MSRP, dan potentialProfit (MSRP - buyPrice dibulatkan 2 angka desimal). Urutkan dari potentialProfit terbesar ke terkecil, lalu productCode menaik.
SELECT
	productCode,
	productName,
	buyPrice,
	MSRP,
	ROUND(MSRP-buyPrice) as 'PotensialProfit'
FROM
	products
ORDER BY
	ROUND(MSRP-buyPrice) DESC,
	productCode ASC;

-- 13. Hitung total jumlah pesanan yang masuk pada tahun 2004 dari tabel orders dan tampilkan sebagai satu kolom bernama totalOrders.
SELECT
	COUNT(*) AS TOTALORDERS
FROM
	orders
WHERE
	strftime('%Y', orderDate) = '2004';

-- 14. Dari tabel payments, tampilkan nilai pembayaran terkecil (minPayment), nilai pembayaran terbesar (maxPayment), serta rata-rata nominal pembayaran yang dibulatkan 2 angka desimal (avgPayment).
SELECT
	min(amount) minpayment,
	MAX(amount) maxpayment,
	AVG(amount) avgpayment
from
	payments;

-- 15. Tampilkan productCode, productName, productLine, dan buyPrice dari tabel products untuk kategori (productLine) 'Planes' atau 'Ships' yang memiliki buyPrice kurang dari 40. Urutkan berdasarkan buyPrice menaik, lalu productCode menaik.

select
	productCode,
	productName,
	productLine,
	buyPrice
FROM
	products
WHERE
	productline IN ('Planes', 'Ships')
	AND buyPrice <40
ORDER BY
	buyPrice ASC ;























