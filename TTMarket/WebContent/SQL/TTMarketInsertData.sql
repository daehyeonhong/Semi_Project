INSERT INTO TTCategory(categoryName,description)VALUES('Smart Phone','Smart Phone');
INSERT INTO TTCategory(categoryName,description)VALUES('Notebook','Notebook');
INSERT INTO TTCategory(categoryName,description)VALUES('Tablet','Tablet');

INSERT INTO TTProduct(P_ID,P_NAME,P_UNITPRICE,P_DESCRIPTION,P_CATEGORY,P_MANUFACTURER,P_UNITSINSTOCK,P_CONDITION,P_FILENAME)
				VALUES('P1234','IPhone6',1000,'IPhone6','Smart Phone','APPLE',1000,'NEW','P1234.png');
INSERT INTO TTProduct(P_ID,P_NAME,P_UNITPRICE,P_DESCRIPTION,P_CATEGORY,P_MANUFACTURER,P_UNITSINSTOCK,P_CONDITION,P_FILENAME)
				VALUES('P1235','Gram',5000,'Gram','Notebook','LG',140,'NEW','P1235.png');
INSERT INTO TTProduct(P_ID,P_NAME,P_UNITPRICE,P_DESCRIPTION,P_CATEGORY,P_MANUFACTURER,P_UNITSINSTOCK,P_CONDITION,P_FILENAME)
				VALUES('P1236','Galaxy Tab S',12000,'Galaxy Tab','Tablet','Samsung',220,'NEW','P1236.png');

INSERT INTO TTStatus (Status)VALUES('주문 완료');
INSERT INTO TTStatus (Status)VALUES('배송 접수');
INSERT INTO TTStatus (Status)VALUES('배송 중');
INSERT INTO TTStatus (Status)VALUES('배송 완료');
INSERT INTO TTStatus (Status)VALUES('수령 완료');

DESC TTSALE
DESC TTMEMBER
DESC TTPRODUCT
DESC TTDELIVERY
DESC TTSTATUS
select*from ttSALE

insert into ttmember values('1','1','1','1','남자',' ew@naver.com','1','1','1','1','1','새싹','1')
select*from ttmember where id='2'and password='2';
select d.sessionId,s.saleDate,s.productId,s.saleQty,d.name,d.deliveryDate,d.nation,d.zipCode,d.address,st.status from ttsale s,ttdelivery d,ttstatus st where s.sessionId=d.sessionId and s.status=st.statusNumber
select d.sessionId,s.saleDate,s.productId,s.saleQty,d.name,d.deliveryDate,d.nation,d.zipCode,d.address,st.status from ttsale s,ttdelivery d,ttstatus st where s.sessionId=d.sessionId and s.status=st.statusNumber
select d.sessionId,s.saleDate,s.productId,s.saleQty,d.name,d.deliveryDate,d.nation,d.zipCode,d.address, s.status from ttsale s,ttdelivery d where s.sessionId=d.sessionId and s.status not in (5) order by s.seq

select*from ttmember
select*from ttproduct
select*from ttSALE
select*from ttdelivery
select*from ttstatus
select*from ttdelivery d, ttsale s group by s.seq order by d.seq 

update ttsale set status=1;

select d.seq,s.saleDate,s.sessionId,s.productId,s.unitPrice,s.saleQty,s.status,d.name,d.zipCode,d.address
from ttsale s, ttdelivery d 
where s.sessionId=d.sessionid 
and s.sessionId='1' 
;

update ttmember set mail='1' where id='1'
update ttsale set status='2'

select*from ttmember
desc ttmember

select * from ttsale;
select * from ttdelivery;

select distinct s.deliveryseq,s.saleDate,s.productId,s.saleQty,s.status,d.name
			 from ttsale s,ttdelivery d where s.sessionId=d.sessionId
			and s.deliveryseq=d.seq and s.status not in (5) and s.sessionid='1' group by s.seq
			 order by s.seq

select s.deliveryseq,s.saleDate,s.productId,s.saleQty,d.name,
			 d.deliveryDate,d.nation,d.zipCode,d.address, s.status
			 from ttsale s,ttdelivery d where s.sessionId=d.sessionId
			 and s.status not in (5) group by s.deliveryseq
			 order by s.seq
			 
select ifnull(max(seq),0) from ttdelivery
insert into ttdelivery(sessionId,name,deliverydate,nation,zipcode,address) values('1','1','1','1','1','1');
insert into ttsale(saledate,sessionId,productId,unitprice,saleqty,deliveryseq,status) values ('123','1','1','1','1',1,1)

SELECT DISTINCT S.DELIVERYSEQ,S.SALEDATE,S.PRODUCTID,S.SALEQTY,D.NAME,D.NATION,D.ZIPCODE,D.ADDRESS,S.STATUS FROM TTSALE S, TTDELIVERY D WHERE S.DELIVERYSEQ=D.SEQ AND S.STATUS NOT IN(5) GROUP BY S.SEQ ORDER BY S.SEQ,S.PRODUCTID
SELECT DISTINCT S.DELIVERYSEQ,S.SALEDATE,S.PRODUCTID,S.SALEQTY,D.NAME,D.NATION,D.ZIPCODE,D.ADDRESS,S.STATUS FROM TTSALE S, TTDELIVERY D WHERE S.DELIVERYSEQ=D.SEQ GROUP BY S.SEQ ORDER BY S.SEQ,S.PRODUCTID;

SELECT*FROM TTPRODUCT WHERE p_id LIKE upper('%P%')ORDER BY P_ID DESC
select p_unitsinstock from ttproduct where p_id='P1237'
alter table ttproduct change p_unitsinstock p_unitsinstock int

drop table ttstatus
insert into ttstatus (status) values(6);

UPDATE TTSALE SET STATUS=3 WHERE PRODUCTID='P1235' AND SEQ='2;'