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

insert into checkex values (1, 'N', 'A');
insert into checkex values (1, 'N', 'K');
insert into checkex values (1, 'N', 'A');

--(�⺻���� �����Ѵ�)
create table defaultex(column1 varchar(30), column2 varchar2(20) default '�⺻��' , column3 number(8) Default 1234 );

insert into defaultex (column1) values ('����');
--insert into defaultex values ('����', default, default);
insert into defaultex values ('���', null, null);

--(�̹� ������ ���̺� DEFAULT ������ ��)
--(ALTER TABLE ���̺�� MODIFY �÷��� DEFAULT ������;)
alter table defaultex modify column3 default 123;

--(�̹� ������ ���̺� NOT NULL ����)
--(ALTER TABLE ���̺�� MODIFY �÷��� NOT NULL;)
create table NotNullEx(column1 varchar2(20) constraint column1NotNull not null , column2 number(3) constraint column2NotNull not null);

alter table notnullex modify column2 constraint column2NotNull not null;

insert into notnullex values ('101', '222');
insert into notnullex values ('102', Null);
insert into notnullex values ('103', '333');

--���� ���� ����
--(�̹� �����ϴ� COLUMN�� ���� ���� ���� ��)
--(ALTER TABLE [���̺��] DROP CONSTRAINT CONSTRAINT_NAME;)
alter table notnullex drop constraint column2notnull;


--294.P
--
set serveroutput on;

DECLARE
    var1 Number(5);
BEGIN
    var1 := 100;
IF
    var1 = 100 then
    DBMS_OUTPUT.PUT_LINE('100�Դϴ�.');
ELSE
    DBMS_OUTPUT.PUT_LINE('100�� �ƴմϴ�.');
END IF;
END;



--295.P
--
DECLARE
hireDate DATE;
curDate DATE;
wDays NUMBER(5);
BEGIN
SELECT hire_date INTO hireDate
FROM employees
WHERE employee_id = 200;
curDate := CURRENT_DATE();
wDays := curDate - hireDate;
IF(wDays/365) >= 5 THEN
DBMS_OUTPUT.PUT_LINE('�Ի����� ' || wDays || '���̳� �������ϴ�. �����մϴ�!');
ELSE
DBMS_OUTPUT.PUT_LINE('�Ի����� ' || wDays || '�Ϲۿ� �ȵǾ��׿�. ������ ���ϼ���.');
END IF;
END;



--296.P
--
DECLARE
pNumber NUMBER(3); --����
credit char(1); --����
BEGIN
pNumber := 77;
IF pNumber >= 90 THEN
credit := 'A';
ELSIF pNumber >= 80 THEN
credit := 'B';
ELSIF pNumber >= 70 THEN
credit := 'C';
ELSIF pNumber >= 60 THEN
credit := 'D';
ELSE
credit := 'F';
END IF;
DBMS_OUTPUT.PUT_LINE('������� ==> ' || pNumber || ', ���� ==>' || credit);
END;


DECLARE
pNumber NUMBER(3); --����
credit char(1); --����
BEGIN
pNumber := 77;
CASE
WHEN pNumber >= 90 THEN
credit := 'A';
WHEN pNumber >= 80 THEN
credit := 'B';
WHEN pNumber >= 70 THEN
credit := 'C';
WHEN pNumber >= 60 THEN
credit := 'D';
ELSE
credit := 'F';
END CASE;
DBMS_OUTPUT.PUT_LINE('������� ==> ' || pNumber || ', ���� ==>' || credit);
END;


--�ǽ� 8

SELECT U.userid, U.username, SUM(price*amount) AS "�ѱ��ž�",
CASE
WHEN (SUM(price*amount) >= 1500) THEN '�ֿ����'
WHEN (SUM(price*amount) >= 1000) THEN '�����'
WHEN (SUM(price*amount) >= 1) THEN '�Ϲݰ�'
ELSE '���ɰ�'
END AS "�����"
FROM buytbl B RIGHT OUTER JOIN usertbl U On B.userid = U.userid
GROUP BY U.userid, U.username ORDER BY SUM(price*amount) DESC NULLS LAST;


--303.p
SET SERVEROUT ON;

DECLARE
iNum NUMBER(4);
hap NUMBER(8);
BEGIN
iNum := 1;
hap := 0;
WHILE iNum <=1000
LOOP
IF MOD(iNum, 3) = 0 THEN
iNum := iNum + 1;
CONTINUE;
END IF;
IF MOD(iNum, 8) = 0 THEN
iNum := iNum + 1;
CONTINUE;
END IF;
IF iNum > 1001 THEN
EXIT;
END IF;
hap := hap + iNum;
END LOOP;
DBMS_OUTPUT.PUT_LINE(hap);
END;


SET SERVEROUT ON;
DECLARE
iNum NUMBER(4);
p_Num NUMBER(8);
BEGIN
p_Num := 0;
for iNum in 1..1000
LOOP
CASE
WHEN MOD(iNum, 3) = 0 THEN
p_Num := iNum+p_Num;
WHEN MOD(iNum, 8) = 0 THEN
p_Num := iNum+p_Num;
ELSE
CONTINUE;
END CASE;
END LOOP;
DBMS_OUTPUT.PUT_LINE(p_Num);
END;

























