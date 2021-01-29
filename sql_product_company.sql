-- Drop table if it exists to create a new one
DROP TABLE IF EXISTS Product CASCADE;
DROP TABLE IF EXISTS company CASCADE;

-- Create 2 tables, 1 to many relationship
create table Company(
	id SERIAL primary key,
	company_name varchar(50) not null,
	company_address varchar(200) null,
	company_size integer
	);

create table Product (
	id SERIAL primary key,
	product_name varchar(100) not null,
	quantity integer not null,
	company_id SERIAL,
	constraint fk_company foreign key (company_id) references Company(id) 
);


-- Insert data to 2 tables
insert into
	Company(company_name,
	company_address,
	company_size)
values 
	('Homes','123 Baker Street AZ 11022',100),
	('Kaiba Corp',null,3)

insert into
	Product(product_name,
	Quantity,
	company_id)
values 
	('The Dancing Stickman',3,1),
	('Duel Disk System',1000,2);

-- Show all data in 2 tables
select * from Company;
select * from Product;


-- INNER JOIN
select
	p.product_name,
	c.company_name
from
	product as p
inner join Company as c on
	c.id = p.company_id;



