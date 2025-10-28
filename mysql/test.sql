use madang;

--sql 개노삼 select(셀렉션과 프로젝션을 겸한다), from(어느 테이블에서 가져올거냐), where(조건 명세하는 부분)

select '' as '- - - - - - - - - - - - - - - - - - - - - - - - ';

select publisher, price
    from book
    where name like '축구%'; -- 축구로 시작하는 문자열

select '' as '- - - - - - - - - - - - - - - - - - - - - - - - ';

select publisher, price
    from book
    where name like '%구 %'; -- '구 '가 들어가는 문자열

select '' as '- - - - - - - - - - - - - - - - - - - - - - - - ';

select b.publisher as '출판사', b.price as '정가 (원)'
    from book b
    where name like '%구 %'; -- '구 '가 들어가는 문자열

select '' as '문제 3-2- - - - - - - - - - - - - - - - - - - - - - - - ';
-- 문제 3-2
select id,name,publisher,price
from book;

select '' as '문제 3-3- - - - - - - - - - - - - - - - - - - - - - - - ';
--문제 3-3
select count(distinct publisher) -- distinct: 중복결과 제거, count(): 튜플의 갯수 출력
from book;

select distinct count(publisher) -- 서순 -> 결과가 달라짐
from book;

select '' as '문제 3-4- - - - - - - - - - - - - - - - - - - - - - - - ';
--문제 3-4
select name
from book
where price<20000;

select '' as '문제 3-5- - - - - - - - - - - - - - - - - - - - - - - - ';
--문제 3-5
select name
from book
where price >10000 and price <30000;
select '' as 'or - - - - - - - - ';
select name
from book
where price between 10000 and 30000;

select '' as '문제 3-6 - - - - - - - - - - - - - - - - - - - - - - - - ';

select name
from book
where publisher in('굿스포츠', '대한미디어');

select '' as '문제 3-7 - - - - - - - - - - - - - - - - - - - - - - - - ';

select name, publisher
from book
where name like '축구의 역사';


select name, publisher
from book
where name like '_구%';

select '' as '문제 3-8 - - - - - - - - - - - - - - - - - - - - - - - - ';

select distinct publisher
from book
where name like '%축구%';

select '' as '문제 3-12 - - - - - - - - - - - - - - - - - - - - - - - - ';

select '' as '오름차순';
select *
from book
order by name asc; --asc(어센딩)은 생략해도 됨

select '' as '내림차순';
select *
from book
order by name desc;

select '' as '이름 내림차순 / 출판사 오름차순';
select *
from book
order by name desc, publisher asc;

select '' as ' - - - - - - - - - - - - - - - - - - - - - - - - ';
--중복 제외 갯수
select count(distinct price)
from book;
--중복된 것들의 갯수
select count(price) - count(distinct price) + 1
from book;

--가격의 평균
select sum(price), avg(price)
from book;

--평균보다 높은 가격의 도서(부속쿼리 이용)
select *
from book
where price >= (select avg(price) from book);
--3권 이상 출판한 출판사, 그런 출판사의 수
--아 모르겟다

--집계함수
select '' as '문제 3-15 - - - - - - - - - - - - - - - - - - - - - - - - ';
select sum(saleprice) as 'revenue'
from orders;

select '' as '문제 3-16 - - - - - - - - - - - - - - - - - - - - - - - - ';
select sum(saleprice) as '총 구매액'
from orders
where custid = (select id
                from customer
                where name like '김연아');

select orders.id, customer.name, book.name, book.price 
from customer, orders, book
where customer.id = orders.custid
    and orders.bookid = book.id
    and customer.name like '김연아';

select '' as '문제 3-19 - - - - - - - - - - - - - - - - - - - - - - - - ';
select custid, count(bookid) as '총 수량', sum(saleprice) as '총판매액'
from orders
group by custid;

select '' as '문제 3-20 - - - - - - - - - - - - - - - - - - - - - - - - ';
select custid, count(bookid) as '주문 도서의 총 수량'
from orders
where saleprice>=8000
group by custid
having count(bookid) >=2;

select '' as '문제 3-21 - - - - - - - - - - - - - - - - - - - - - - - - ';
select *
from customer
inner join orders
on customer.id = orders.custid
inner join book 
on book.id = orders.bookid;