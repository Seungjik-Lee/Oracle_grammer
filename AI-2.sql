
--Foreign Key
--
--(�̹� ������ ���̺� FOREIGN KEY ������ ��)
--(ALTER TABLE ���̺�� ADD CONSTRAINT �������Ǹ� FOREIGN KEY (TO �÷���) REFERENCES ������ ���̺��(FROM �÷���))
create table FkTable (FKColumn varchar(20));

Alter Table FKTable Add Constraint ff Primary Key (FKColumn);

Create Table Ptable (Column1 varchar(20) Primary Key, Column2 constraint FKTest References FKTable (FKColumn));


alter table ptable add column3 varchar(20);
alter table Ptable add constraint fkfk foreign key (Column3) references fktable (fkcolumn);






























