create TABLE Customer (
    cno         varchar(16) primary key,
    name        varchar(16) not null,
    password    varchar(40) not null,
    phoneNumber varchar(13) not null
); 

describe Customer;

create TABLE Food (
    foodName    varchar(30) primary key,
    price       int         not null
);

describe Food;

create TABLE Category (
    categoryName    varchar(20) primary key,
    noOfFood        int default 0
);

describe Category;


create TABLE Cart (
    cid         varchar(10) primary key,
    cdate       date        not null,
    ctime       date        not null,
    cno         varchar(16) not null,
    foreign key (cno) references Customer(cno)
);

describe Cart;

create TABLE Contains (
    foodName        varchar(30),
    categoryName    varchar(20),
    primary key (foodName, categoryName),
    foreign key (foodName) references Food(foodName),
    foreign key (categoryName) references Category(categoryName)
);

describe Contains;

create TABLE OrderDetail (
    itemNo      int,
    cid         varchar(10),
    quantity    int default 0,
    totalPrice  int default 0,
    foodName    varchar(30),
    primary key (itemNo, cid),
    foreign key (cid) references Cart(cid),
    foreign key (foodName) references Food(foodName)
);

describe OrderDetail;

drop Table OrderDetail;
drop Table Contains;
drop Table Cart;
drop Table Category; 
drop Table Food;
drop Table Customer;
