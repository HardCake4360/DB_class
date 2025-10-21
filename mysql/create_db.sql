use mysql;
drop user if exists 'madang'@'localhost';
create user 'madang'@'localhost' identified by 'madang';
flush privileges; 
drop database if exists madang;
select '' as '마당이라는 데이터베이스가 있는지 확인해주세요';
show databases;

create database madang;
grant all on madang.* to 'madang'@'localhost';
flush privileges;
commit;
select '' as 'show newly created databases';
show databases;

