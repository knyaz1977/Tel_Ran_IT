CREATE TABLE goods (
	id integer UNIQUE,
	title VARCHAR(30) NOT NULL,
	color VARCHAR(10) NOT NULL,
	quantity NUMERIC(5) CHECK(quantity > 0),
	price NUMERIC(7,2) CHECK(price <100000),
	in_stock CHAR(1) CHECK(in_stock in ('Y', 'N'))
);
INSERT INTO goods VALUES (1,'shoulder bag woman Art.9458','brown',5,19900,'Y'),
						(2,' Cross-body bag woman Art.8749','black',1,26800,'N'),
                        (3, 'Handbag woman Art.4218','grey', 7, 16890,'Y'),
                        (4, 'Backpack woman Art.1978','green',10, 26890.00,'Y'),
                        (5, 'Wallet woman Art.2943','dk.brown', 3, 6490.99,	'Y');

select * from goods;

ALTER TABLE goods
ADD city varchar(20) default 'Berlin';

ALTER TABLE goods
DROP COLUMN city;

set sql_safe_updates = 0;

UPDATE goods
SET country = 'Berl'
WHERE title = 'Handbag woman Art.4218';

UPDATE goods
SET city = 'Ber'; -- комментарий--

ALTER TABLE goods
MODIFY COLUMN city char(3);

UPDATE goods SET city = null;

ALTER TABLE goods
CHANGE city country VARCHAR(20);

DELETE FROM goods
WHERE city = '';

CREATE TABLE students (
	name VARCHAR(10) NOT NULL,
    lastname VARCHAR(15) NOT NULL,
    avg_mark NUMERIC(2,1) CHECK(avg_mark BETWEEN  0 and 5),
    gender varchar(128) CHECK(gender in ('M', 'F'))
    );