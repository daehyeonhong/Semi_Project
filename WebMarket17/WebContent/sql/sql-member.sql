/* 기존 테이블 삭제*/
drop table member;

/* 새 테이블 생성 */
create table member(
id varchar(10) not null,
password varchar(10) not null,
name varchar(10) not null,
gender varchar(4),
birth varchar(10),
mail varchar(30),
phone varchar(20),
postcode varchar(5),
address varchar(200),
detailAddress varchar(100),
extraAddress varchar(50),
regist_day varchar(50),
primary key(id)
)default charset=utf8;

select * from member where id='hong';
select count(*) from member where id='hong';

select * from member;
select * from category;
select * from sale;
select * from delivery;

drop table member
create table member(
   id varchar(20) not null ,
   password varchar(30) not null, 
   name varchar(50) not null,
   birthday varchar(15) , 
   gender   varchar(4) , 
   mail varchar(50) not null,
   phone varchar(13) not null,
   postcode varchar(5) not null,
   address varchar(200) not null,
   detailAddress varchar(100) not null,
   extraAddress varchar(50) not null,
   grade varchar(10) not null, 
   regist_day varchar(50),
   primary key(id)
   )default charset=utf8;

insert into sale(saleDate,sessionId,productId,unitPrice,saleQty,status) values("1","2","3","4","5",1)

select*from member

update member set password='1',phone='2'where id='12'

update category set categoryName=?,description=?where id=?

insert into category(categoryName,description) values('123','321');

desc category
delete from category where seq=4;

desc sale
desc member

insert into sale(saledate,sessionId,productId,unitprice,saleqty,status) values(?,?,?,?,?,1)