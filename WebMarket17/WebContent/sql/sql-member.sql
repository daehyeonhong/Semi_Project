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


update member set password='1',phone='2'where id='12'

update category set categoryName=?,description=?where id=?