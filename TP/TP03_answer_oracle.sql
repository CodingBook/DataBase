CREATE TABLE Customer (
cno VARCHAR(10),
name VARCHAR(100) NOT NULL,
passwd VARCHAR(100) NOT NULL,
phoneno VARCHAR(20) NOT NULL,
CONSTRAINT pk_customer PRIMARY KEY(cno)
);

CREATE TABLE Food (
foodName VARCHAR(100),
price NUMBER NOT NULL,
CONSTRAINT pk_food PRIMARY KEY(foodName)
);

CREATE TABLE Category (
categoryName VARCHAR(100),
noOfFood NUMBER NOT NULL,
CONSTRAINT pk_category PRIMARY KEY(categoryName)
);

CREATE TABLE Contain (
foodName VARCHAR(100),
categoryName VARCHAR(100) NOT NULL,
CONSTRAINT pk_contain PRIMARY KEY(foodName, categoryName),
CONSTRAINT fk_contain1 FOREIGN KEY(foodName) REFERENCES Food(foodName),
CONSTRAINT fk_contain2 FOREIGN KEY(categoryName) REFERENCES
Category(categoryName)
);

CREATE TABLE Cart (
id VARCHAR(5),
-- Surrogate Key를 사용할수도 있음
-- Surrogate Key 사용 방법 : https://www.youtube.com/watch?v=WBu9-eT9LcM
orderDateTime TIMESTAMP,
-- Oracle에서는 TIMESTAMP Datatype으로 Date와 Time을 한꺼번에 표시 가능함
cno VARCHAR(10),
CONSTRAINT pk_cart PRIMARY KEY (id),
CONSTRAINT fk_cart FOREIGN KEY(cno) REFERENCES Customer(cno)
);

CREATE TABLE OrderDetail (
itemNo NUMBER,
id VARCHAR(5),
quantity NUMBER,
totalPrice NUMBER,
foodName VARCHAR(100),
CONSTRAINT pk_orderdetail PRIMARY KEY(itemNo, id),
CONSTRAINT fk_orderdetail1 FOREIGN KEY(id) REFERENCES Cart(id),
CONSTRAINT fk_orderdetail2 FOREIGN KEY(foodName) REFERENCES
Food(foodName)
);