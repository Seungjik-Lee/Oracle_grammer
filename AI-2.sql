
--Foreign Key
--
--(이미 생성된 테이블간 FOREIGN KEY 지정할 때)
--(ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 FOREIGN KEY (TO 컬럼명) REFERENCES 참조할 테이블명(FROM 컬럼명))
create table FkTable (FKColumn varchar(20));

Alter Table FKTable Add Constraint ff Primary Key (FKColumn);

Create Table Ptable (Column1 varchar(20) Primary Key, Column2 constraint FKTest References FKTable (FKColumn));


alter table ptable add column3 varchar(20);
alter table Ptable add constraint fkfk foreign key (Column3) references fktable (fkcolumn);



--Unique
--
--(데이터의 중복 허용X , 빈 값(Null 값) 허용)
create table UniqueEx(colunm1 varchar2(20) constraint column1Unique Unique, column2 number(3) constraint colum2Unique Unique, column3 char(3));

insert into uniqueex values ('1', 2, '');
insert into uniqueex values ('2', 2, '');
insert into uniqueex values ('3', 4, '');



--Check
--
--(특정 범위 값만 지정, 특정 값만 지정)
create table checkex(column1 number(3) constraint column1check check(column1 between 1 and 10), column2 varchar2(20) constraint column2check check(column2 In('Y', 'N')), column3 varchar2(10));

insert into checkex values (2, 'Y', '');
insert into checkex values (20, 'PPP', '');

--(이미 생성된 테이블에 CHECK 지정할 때)
--(ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 CHECK (컬럼명 및 조건))

alter table checkex add constraint chk3 check (column3 in ('A','B','C','D','F'));



































