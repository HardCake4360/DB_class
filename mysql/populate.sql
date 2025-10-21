-- mysql -u madang -pmadang madang < populate.sql

use madang;

drop table if exists orders;
drop table if exists customer;
drop table if exists book;

create table book (
    id integer not null,
    name varchar(255) not null,
    publisher varchar(255) not null,
    price integer,

    primary key (id)
);

create table customer (
    id integer not null,
    name varchar(255) not null,
    address varchar(255),
    phone varchar(20),

    primary key (id)
);

create table orders (
    id integer not null,
    custid integer not null,
    bookid integer not null,
    orderdate date,
    saleprice integer not null,

    primary key (id),

    foreign key (custid) references customer (id),
    foreign key (bookid) references book (id)
);

select '' as 'show all tables in madang';
show tables;

select '' as 'describe book, customer, orders';
desc book;
desc customer;
desc orders;

insert into book (id, name, publisher, price)
    values  (1, '축구의 역사', '굿스포츠', 7000),
            (2, '축구 아는 여자', '나무수', 13000),
            (3, '축구의 이해', '대한미디어', 22000),
            (4, '골프 바이블', '대한미디어', 35000),
            (5, '피겨 교본', '굿스포츠', 8000),
            (6, '배구 단계별기술', '굿스포츠', 6000),
            (7, '야구의 추억', '이상미디어', 20000),
            (8, '야구를 부탁해', '이상미디어', 13000),
            (9, '올림픽 이야기', '삼성당', 7500),
            (10,'Olympic Champions', 'Pearson',13000);

insert into customer(id, name, address, phone) values 
            (1, '박지성', '영국 맨체스터',  '000-5000-0001'),
            (2, '김연아', '대한민국 과천',  '000-6000-0001'),
            (3, '김연경', '대한민국 경기도',  '000-7000-0001'),
            (4, '추신수', '미국 텍사스',  '000-8000-0001'),
            (5, '박세리', '대한민국 대전',  null) ;


select '' as '도서 테이블 보기';
select * from book;

select '' as '고객 테이블 보기';
select * from customer;

insert into orders (id, custid, bookid, saleprice, orderdate) values
    (1, 1, 1, 6000, '2024-07-01'),
    (2, 1, 3, 21000, '2024-07-03'),
    (3, 2, 5, 8000, '2024-07-03'),
    (4, 3, 6, 6000, '2024-07-04'),
    (5, 4, 7, 20000, '2024-07-05'),
    (6, 1, 2, 12000, '2024-07-07'),
    (7, 4, 8, 13000, '2024-07-07'),
    (8, 3, 10, 12000, '2024-07-08'),
    (9, 2, 10, 7000, '2024-07-09'),
    (10,3, 8, 13000, '2024-07-10');

select '' as '주문 테이블 보기';
select * from orders;
