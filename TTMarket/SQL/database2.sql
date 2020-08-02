select distinct s.s_date, s.상품,  from sale s, delivery d where s.sessionId=d.sessionId and d.sessionId='admin' ;
selecet * from delivery where sessionId='admin';

select * from delivery where  seq='10';

select * from sale where sessionId='홍길동12' and seq=10;

select * from delivery;

select d.name from sale s, delivery d where s.sessionId=d.sessionId and d.sessionId='홍길동12';


desc sale;

select * from delivery;
select * from sale;


update sale set status=4 where seq=1;


