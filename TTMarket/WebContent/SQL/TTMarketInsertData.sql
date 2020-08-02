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

select*from ttdelivery
select*from ttstatus

update ttsale set status=1;