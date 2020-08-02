INSERT INTO TTCategory(categoryName,description)VALUES('Smart Phone','Smart Phone');
INSERT INTO TTCategory(categoryName,description)VALUES('Notebook','Notebook');
INSERT INTO TTCategory(categoryName,description)VALUES('Tablet','Tablet');

INSERT INTO TTProduct(P_ID,P_NAME,P_UNITPRICE,P_DESCRIPTION,P_CATEGORY,P_MANUFACTURER,P_UNITSINSTOCK,P_CONDITION,P_FILENAME)
				VALUES('P1234','IPhone6',1000,'IPhone6','Smart Phone','APPLE',1000,'NEW','P1234.png');
INSERT INTO TTProduct(P_ID,P_NAME,P_UNITPRICE,P_DESCRIPTION,P_CATEGORY,P_MANUFACTURER,P_UNITSINSTOCK,P_CONDITION,P_FILENAME)
				VALUES('P1235','Gram',5000,'Gram','Notebook','LG',140,'NEW','P1235.png');
INSERT INTO TTProduct(P_ID,P_NAME,P_UNITPRICE,P_DESCRIPTION,P_CATEGORY,P_MANUFACTURER,P_UNITSINSTOCK,P_CONDITION,P_FILENAME)
				VALUES('P1236','Galaxy Tab S',12000,'Galaxy Tab','Tablet','Samsung',220,'NEW','P1236.png');

INSERT INTO TTStatus()VALUES();
INSERT INTO TTStatus()VALUES();
INSERT INTO TTStatus()VALUES();
INSERT INTO TTStatus()VALUES();
INSERT INTO TTStatus()VALUES();

DESC TTPRODUCT
DESC TTSTATUS

select*from ttmember

insert into ttmember values('1','1','1','1','남자',' ew@naver.com','1','1','1','1','1','새싹','1')
select*from ttmember where id='2'and password='2';