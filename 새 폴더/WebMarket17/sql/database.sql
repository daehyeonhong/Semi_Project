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

select * from member;
drop table member;

delete table delivery;
truncate delivery;
truncate sale;
select * from sale;
select * from delivery;


select d.name from sale s, delivery d where s.sessionId='홍길동12' and s.seq=d.seq ;




















select * from member;



update sale set status=1
alter table delivery drop id;

select * from sale s, delivery d where s.sessionId=d.sessionId and d.name

select * from sale s, delivery d where s.sessionId=d.sessionId and d.name='123홍길동';

select * from delivery;

select * from member where id='홍길동12';
select * from sale;
select * from sale s, delivery d where s.sessionId=d.sessionId ;

select*from sale s,delivery d, member m where s.sessionId=d.sessionId and m.name=d.name and d.name='홍ㄱㄹㄷ';



select *  from sale s,delivery d,product p where s.productId=p.p_id and s.sessionId=d.sessionId order by s.seq and d.name="길동ㅇ"
select*from sale s,delivery d where s.sessionId=d.sessionId and d.sessionId='F48B06A0E182FCF4E6F241FD661452CD'