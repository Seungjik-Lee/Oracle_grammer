
--Foreign Key
--
--(이미 생성된 테이블간 FOREIGN KEY 지정할 때)
--(ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 FOREIGN KEY (TO 컬럼명) REFERENCES 참조할 테이블명(FROM 컬럼명))
create table FkTable (FKColumn varchar(20));

Alter Table FKTable Add Constraint ff Primary Key (FKColumn);

Create Table Ptable (Column1 varchar(20) Primary Key, Column2 constraint FKTest References FKTable (FKColumn));


alter table ptable add column3 varchar(20);
alter table Ptable add constraint fkfk foreign key (Column3) references fktable (fkcolumn);






























