
--Foreign Key
--
--(�̹� ������ ���̺� FOREIGN KEY ������ ��)
--(ALTER TABLE ���̺�� ADD CONSTRAINT �������Ǹ� FOREIGN KEY (TO �÷���) REFERENCES ������ ���̺��(FROM �÷���))
create table FkTable (FKColumn varchar(20));

Alter Table FKTable Add Constraint ff Primary Key (FKColumn);

Create Table Ptable (Column1 varchar(20) Primary Key, Column2 constraint FKTest References FKTable (FKColumn));


alter table ptable add column3 varchar(20);
alter table Ptable add constraint fkfk foreign key (Column3) references fktable (fkcolumn);



--Unique
--
--(�������� �ߺ� ���X , �� ��(Null ��) ���)
create table UniqueEx(colunm1 varchar2(20) constraint column1Unique Unique, column2 number(3) constraint colum2Unique Unique, column3 char(3));

insert into uniqueex values ('1', 2, '');
insert into uniqueex values ('2', 2, '');
insert into uniqueex values ('3', 4, '');



--Check
--
--(Ư�� ���� ���� ����, Ư�� ���� ����)
create table checkex(column1 number(3) constraint column1check check(column1 between 1 and 10), column2 varchar2(20) constraint column2check check(column2 In('Y', 'N')), column3 varchar2(10));

insert into checkex values (2, 'Y', '');
insert into checkex values (20, 'PPP', '');

--(�̹� ������ ���̺� CHECK ������ ��)
--(ALTER TABLE ���̺�� ADD CONSTRAINT �������Ǹ� CHECK (�÷��� �� ����))

alter table checkex add constraint chk3 check (column3 in ('A','B','C','D','F'));



































