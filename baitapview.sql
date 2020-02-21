create database product;
use product;
create table products(
ID int,
productCode varchar(30),
productName varchar(40),
productPrice int ,
productAmount int,
productDescription varchar(100),
productStatus bit,
constraint ID_PK primary key (ID)
);

insert products values
(1,'p01','lenovo',10,12,'i7',0),
(2,'p02','dell',11,15,'i3',1),
(3,'p03','acer',12,124,'i3',0),
(4,'p04','lenovo',105,122,'i5',1);

create unique index productCode_index
on products(productCode);

create unique index Products_index
on products(productName,productPrice);

select * from products 
where productCode='p03';

explain select * from products 
where productCode='p03';
create view product_view as
select productCode, productName, productPrice, productStatus from products;
select* from product_view;

update product_view set productCode='sdf';

delimiter //
create procedure showAll()
begin
select * from products;
end;
//

call showAll();
delimiter //
create procedure addProduct(ID int,
productCode varchar(30),
productName varchar(40),
productPrice int ,
productAmount int,
productDescription varchar(100),
productStatus bit)
begin
insert products values
(ID,productCode,productName,productPrice,productAmount,productDescription,productStatus);
end;
//

call addProduct;

delimiter //
create procedure editProduct()
begin
update products set productAmount=55 where ID=4;
end;
//

call editProduct();

drop procedure deleteProduct;
delimiter //
create procedure deleteProduct( IDin int)
begin
delete from products where ID=IDin;
end;
//

call deleteProduct(2);
select * from products;




