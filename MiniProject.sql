create table reservations
(
orderId number,
tableNo number,
custId number,
resDate date,
resTime varchar2(40),
orderDate date default sysdate,
progress varchar2(40),
headcount number,
msg varchar2(100),
CONSTRAINT pk_code primary key (orderId),
CONSTRAINT fk_code foreign key (custId) references Customers(custId)
);

create table Customers
(
custId number,
userName varchar2(40),
phoneNo varchar2(40),
email varchar2(40),
CONSTRAINT pk_codeC primary key (custId)
);

create table Reviews
(
rateMsg varchar2(40),
rateStar number,
rateGender varchar2(20),
rateAge varchar2(20),
rateDate Date default(sysdate)
);

create table Gallery(
pictureNo varchar(50),
pictureName varchar(50)
);

select * from Gallery;
select * from reservations;
select * from Customers;
SELECT * from reviews;

drop table Gallery;
drop table orders;
drop table Customers;
drop table Reviews;

--시퀀스
create sequence ord_seq
start with 1
increment by 1
nomaxvalue;

create sequence cust_seq
start with 1000
increment by 1
nomaxvalue;

create sequence pic_seq
minvalue 1
maxvalue 10
increment by 1
start with 1
nocache
nocycle;


select * from USER_sequences;

drop sequence ord_seq;
drop sequence cust_seq;


--customers, reservations db생성기
begin
for i in 1..100 loop
insert into Customers values (cust_seq.nextval,dbms_random.string('l',5),'010-'||round(dbms_random.value(1000,9999),0) ||'-'||round(dbms_random.value(1000,9999),0),
dbms_random.string('x',3)||'@gmail.com');
insert into reservations (orderId, tableNo, custId, resDate, resTime, orderDate, progress, headcount, msg) values (ord_seq.nextval,round(dbms_random.value(1,5),0),
cust_seq.currval,to_char(sysdate- dbms_random.value(1,800),'YYYY-MM-DD'),'17:00',sysdate,'in',round(dbms_random.value(1,8),0),dbms_random.string('l',20));
end loop;
end;

commit;

--리뷰db생성기
begin
for i in 1..8 loop
insert into reviews values (dbms_random.string('l',10),round(dbms_random.value(1,5),0),'여','50대 이상');
end loop;
end;

begin
for i in 1..6 loop
insert into reviews values (dbms_random.string('l',10),round(dbms_random.value(1,5),0),'남','50대 이상');
end loop;
end;

commit;







--Test
create sequence CustRegion_seq
start with 1000
increment by 1
nomaxvalue;

create sequence orderRegion_seq
start with 1000
increment by 1
nomaxvalue;

select * from Test1;
select * from Test2;

drop sequence orderRegion_seq;
drop table Test1;
drop table Test2;

create table Test2
(
ortestId number,
testtableNo number,
testId number,
testresDate date,
testresTime varchar2(40),
testorderDate date default sysdate,
testprogress varchar2(40),
testheadcount number,
testmsg varchar2(100),
CONSTRAINT pk_code3 primary key (ortestId),
CONSTRAINT fk_code3 foreign key (testId) references Test1(testId)
);

begin
for i in 1..10 loop
insert into Test1 values (cust_seq.nextval,dbms_random.string('l',5),'010-'||round(dbms_random.value(1000,9999),0) ||'-'||round(dbms_random.value(1000,9999),0),
dbms_random.string('x',3)||'@gmail.com');
insert into Test2 (orderId, tableNo, custId, resDate, resTime, orderDate, progress, headcount, msg) values (ord_seq.nextval,round(dbms_random.value(1,5),0),
cust_seq.currval,to_char(sysdate- dbms_random.value(1,800),'YYYY-MM-DD'),'17:00',sysdate,'in',round(dbms_random.value(1,8),0),dbms_random.string('l',20));
end loop;
end;

commit;

select to_char(resdate,'MM') res_month, count(*) res_count from reservations where to_char(resdate,'YYYY')=2019 group by to_char(resdate,'MM') order by to_char(resdate,'MM');
select to_char(resdate,'YYYY') from reservations group by to_char(resdate,'YYYY')order by to_char(resdate,'YYYY') desc;
select ltrim(to_char(resdate,'YYYY'),'0') from reservations group by ltrim(to_char(resdate,'YYYY'),'0') order by ltrim(to_char(resdate,'YYYY'),'0') desc;

