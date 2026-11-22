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
	or creditLimit > 150001
ORDER BY
	creditLimit desc;


