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
	productLine ASC;


-- 3. Tampilkan country dan jumlah pelanggan (customerCount) dari tabel customers hanya untuk negara yang memiliki minimal 5 pelanggan. Urutkan dari customerCount terbesar ke terkecil, lalu country menaik.

SELECT
	country,
	COUNT(customerName) AS CustomerCount
FROM
	customers
GROUP BY
	country
HAVING
	COUNT(*) >5
ORDER BY
	CustomerCount DESC;

-- 4. Tampilkan bulan pesanan (orderMonth, format 2 digit '01' sampai '12') dan jumlah pesanan (totalOrders) selama tahun 2004 dari tabel orders. Urutkan berdasarkan orderMonth secara menaik.

SELECT 
    strftime('%m', orderDate) AS orderMonth, 
    COUNT(*) AS TotalOrder  
FROM orders
WHERE strftime('%Y', orderDate) = '2004'
GROUP BY orderMonth;

-- 5. Tampilkan employeeNumber, nama lengkap karyawan (fullName = firstName || ' ' || lastName), jobTitle, serta city dan country kantor tempatnya bekerja (dari tabel offices). Urutkan berdasarkan country menaik, city menaik, lalu employeeNumber menaik.

SELECT
	e.employeeNumber,
	concat(e.firstName, ' ', e.lastName) as FullName,
	jobTitle,
	o.city,
	o.country
from
	employees e
JOIN offices o ON
	e.officeCode = o.officeCode
ORDER BY
	o.country ASC,
	o.city ASC,
	e.employeeNumber ASC ; 

-- 6. Tampilkan customerNumber, customerName, country, dan nama lengkap Sales Rep (salesRepName = e.firstName || ' ' || e.lastName) untuk SELURUH pelanggan di tabel customers, termasuk pelanggan yang belum memiliki salesRepEmployeeNumber (tampilkan NULL). Urutkan berdasarkan customerNumber menaik.

SELECT
	c.customerNumber,
	c.customerName,
	c.country,
	concat(e.firstName, ' ', e.lastName ) as fullname
FROM
	customers c
LEFT  JOIN employees e ON
	c.salesRepEmployeeNumber = e.employeeNumber
ORDER by c.customerNumber ASC;

-- 7. Tampilkan employeeNumber, nama lengkap karyawan (employeeName), jobTitle, dan nama lengkap atasannya (managerName) dari tabel employees. Karyawan teratas yang tidak memiliki atasan (reportsTo IS NULL) tetap harus muncul dengan managerName bernilai NULL. Urutkan berdasarkan employeeNumber menaik.
SELECT
    a.employeeNumber,
    CONCAT(a.firstName, ' ', a.lastName) AS FULL,
    a.jobTitle,
    CONCAT(b.firstName, ' ', b.lastName) AS manager,
    b.jobTitle,
    a.reportsTo
FROM
    employees a 
LEFT JOIN employees b 
    ON a.reportsTo = b.employeeNumber;

-- 8. Hitung total nilai penjualan tiap pesanan (totalAmount = ROUND(SUM(quantityOrdered * priceEach), 2)) dengan menggabungkan orders dan orderdetails. Tampilkan 10 pesanan dengan totalAmount terbesar, berisi kolom: orderNumber, orderDate, status, dan totalAmount. Urutkan dari totalAmount terbesar ke terkecil, lalu orderNumber menaik
SELECT
	o.orderNumber,
	o.orderDate,
	o.status,
	ROUND(SUM(o2.quantityOrdered * o2.priceEach), 2)as total
FROM
	orders o
JOIN orderdetails o2 ON
	o.orderNumber = o2.orderNumber
GROUP BY o.orderNumber
ORDER BY total DESC
LIMIT 10;  

-- 9. Temukan produk dari tabel products yang belum pernah muncul dalam pesanan mana pun di tabel orderdetails. Tampilkan productCode, productName, productLine, dan quantityInStock, urutkan berdasarkan productCode menaik.
SELECT
	o.productCode,
	p.productName,
	p.productLine,
	p.quantityInStock
FROM
	products p
LEFT JOIN orderdetails o ON
	p.productCode = o.productCode
WHERE
	o.orderNumber IS NULL
ORDER BY
	o.productCode ASC; 
