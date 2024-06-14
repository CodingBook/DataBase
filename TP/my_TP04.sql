// 4-1. Food에 20개의 음식 정보 구축
-- 과일
INSERT INTO Food VALUES ('apple', '2000');
INSERT INTO Food VALUES ('orange', '1500');
INSERT INTO Food VALUES ('grape', '5000');
INSERT INTO Food VALUES ('strawberry', '8000');
INSERT INTO Food VALUES ('mango', '4000');

-- 서양식
INSERT INTO Food VALUES ('pizza', '15000');
INSERT INTO Food VALUES ('pasta', '12000');
INSERT INTO Food VALUES ('steak', '25000');
INSERT INTO Food VALUES ('sandwich', '6000');
INSERT INTO Food VALUES ('burgers', '8000');

-- 한식
INSERT INTO Food VALUES ('bibimbap', '8000');
INSERT INTO Food VALUES ('bulgogi', '18000');
INSERT INTO Food VALUES ('japchae', '10000');
INSERT INTO Food VALUES ('samgyeopsal', '15000');
INSERT INTO Food VALUES ('galbitang', '12000');

-- 아시안식
INSERT INTO Food VALUES ('pho', '9000');
INSERT INTO Food VALUES ('pad thai', '12000');
INSERT INTO Food VALUES ('curry', '10000');

-- 일식
INSERT INTO Food VALUES ('ramen', '7000');
INSERT INTO Food VALUES ('sushi', '25000');



// 4-2. Category, contain 테이블 구축
INSERT INTO Category VALUES ('과일', '5');
INSERT INTO Category VALUES ('서양식', '5');
INSERT INTO Category VALUES ('한식', '5');
INSERT INTO Category VALUES ('아시안식', '3');
INSERT INTO Category VALUES ('일식', '2');


INSERT INTO Contain VALUES ('apple', '과일');
INSERT INTO Contain VALUES ('orange', '과일');
INSERT INTO Contain VALUES ('grape', '과일');
INSERT INTO Contain VALUES ('strawberry', '과일');
INSERT INTO Contain VALUES ('mango', '과일');

INSERT INTO Contain VALUES ('pizza', '서양식');
INSERT INTO Contain VALUES ('pasta', '서양식');
INSERT INTO Contain VALUES ('steak', '서양식');
INSERT INTO Contain VALUES ('sandwich', '서양식');
INSERT INTO Contain VALUES ('burgers', '서양식');

INSERT INTO Contain VALUES ('bibimbap', '한식');
INSERT INTO Contain VALUES ('bulgogi', '한식');
INSERT INTO Contain VALUES ('japchae', '한식');
INSERT INTO Contain VALUES ('samgyeopsal', '한식');
INSERT INTO Contain VALUES ('galbitang', '한식');

INSERT INTO Contain VALUES ('pho', '아시안식');
INSERT INTO Contain VALUES ('pad thai', '아시안식');
INSERT INTO Contain VALUES ('curry', '아시안식');

INSERT INTO Contain VALUES ('ramen', '일식');
INSERT INTO Contain VALUES ('sushi', '일식');



// 4-3. Customer 테이블 구축
INSERT INTO Customer VALUES ('c0', 'juinjang', 'password', '010-1234-1234');
INSERT INTO Customer VALUES ('01', 'customer01', 'qwerty', '010-2345-2345');
INSERT INTO Customer VALUES ('02', 'customer02', 'bimil',  '010-4444-2323');
INSERT INTO Customer VALUES ('03', 'customer03', 'beonho', '010-1212-6666');
INSERT INTO Customer VALUES ('04', 'customer04', 'pretty', '010-6385-0982');
INSERT INTO Customer VALUES ('05', 'customer05', 'close',  '010-7654-6453');



// 4-4. Cart 테이블 구축
INSERT INTO Cart VALUES ('00001', STR_TO_DATE('2024-05-15 15:30:00', '%Y-%m-%d %H:%i:%s'), '01');
INSERT INTO Cart VALUES ('00002', STR_TO_DATE('2024-05-16 10:15:22', '%Y-%m-%d %H:%i:%s'), '02');
INSERT INTO Cart VALUES ('00003', STR_TO_DATE('2024-05-17 08:45:10', '%Y-%m-%d %H:%i:%s'), '03');
INSERT INTO Cart VALUES ('00004', STR_TO_DATE('2024-05-24 16:35:10', '%Y-%m-%d %H:%i:%s'), '03');
INSERT INTO Cart VALUES ('00005', STR_TO_DATE('2024-06-01 10:23:00', '%Y-%m-%d %H:%i:%s'), '02');



// 4-5. OrderDetail 테이블 구축
INSERT INTO OrderDetail VALUES (1, '00001', 1, 18000, 'bulgogi');
INSERT INTO OrderDetail VALUES (2, '00001', 3, 6000, 'apple');
INSERT INTO OrderDetail VALUES (3, '00002', 1, 12000, 'pasta');
INSERT INTO OrderDetail VALUES (4, '00002', 1, 4000, 'mango');
INSERT INTO OrderDetail VALUES (5, '00003', 2, 18000, 'pho');
INSERT INTO OrderDetail VALUES (6, '00004', 1, 25000, 'steak');
INSERT INTO OrderDetail VALUES (7, '00005', 2, 20000, 'japchae');


