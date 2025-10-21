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

select '' as '- - - - - - - - - - - - - - - - - - - - - - - - ';
