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

drop table ttmember;
drop table ttmember;
desc ttmember;