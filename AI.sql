--���� �Լ�

select price from buyTBL;

select sum(price) from buyTBL;

--(�Ҽ��� 3�ڸ����� ǥ��)
select cast(avg(price) as number(8,3)) from buyTBL;

select min(price) from buyTBL;

select max(price) from buyTBL;

--(ǥ������)
select cast(STDDEV(price) as number(8,2)) from buyTBL;

--(�л�)
select cast(variance(price) as number(20,3)) from buyTBL;



--Group by
--
Select userID, Sum(amount) from buyTBL Group BY userID;

Select userID as "����� ���̵�", Sum(price*amount) as "�ѱ��ž�" from buyTBL Group BY userID;

--(Group by���� where���� ����� �� ����)
Select userID as "����� ���̵�", Sum(price*amount) as "�ѱ��ž�" from buyTBL Group BY userID where userID = BBK;

--(HAVING���� �� GROUP BY ������ ���;� �Ѵ�)
Select userID as "����� ���̵�", Sum(price*amount) as "�ѱ��ž�" from buyTBL Group BY userID having sum(price * amount) > 1000;



--Rollup
--
Select idNum, groupName, Sum(price*amount) as "���" from buyTbl Group by RollUp(groupName, idNum);

Select groupName, Sum(price*amount) as "���" from buyTbl Group by RollUp(groupName);



--Grouping_ID
--
select groupname, sum(price*amount) as "���", grouping_id(groupname) as "�߰��� ����" from buyTbl group by rollup(Groupname);

select idnum, groupname, sum(price*amount) as "���", grouping_id(idnum) as "�߰��� ����" from buyTbl group by rollup(Groupname, idnum);



--��������
--
--1��
Select deptno as "�μ�", count(deptno) as "�ο�", avg(sal) as "��ձ޿�", sum(sal) as "�޿��� ��" from emp Group BY deptno;
select deptno, count(*), avg(sal), sum(sal) from emp group by deptno;

--2��
Select job as "����", count(job) as "�ο�", cast(avg(sal) as number(8,2)) as "��ձ޿�", max(sal) as "�ְ�޿���", min(sal) as "�����޿���", sum(sal) as "�հ�" from emp Group BY job;
select job, count(*), avg(sal), max(sal), min(sal), sum(sal) from emp group by job;

--3��
Select job as "����", SUM(sal) as "���޿��հ�" from emp Group BY job HAVING sum(sal) > 5000;
select job, sum(sal) from emp group by job having sum(sal) > 5000;

--4��
Select job_id, employee_id, Sum(salary), grouping_id(employee_id) from employees Group by rollup (job_id, employee_id);
select job_id as "����", employee_id as "����ID", sum(salary) as "�޿��հ�", grouping_id(employee_id) as "�հ迭 ����"from employees group by rollup(job_id, employee_id);

--5��
select addr, username, avg(height), grouping_id(height) as "�߰��� ����" from usertbl group by rollup(addr, username);
select addr, username, avg(height), grouping_id(username) as "�߰��� ����" from usertbl group by rollup(addr, username);



--Union
select empno, ename, sal, deptno from emp where deptno=10 union select empno, ename, sal, deptno from emp where deptno=20;

--Union All
select empno, ename, sal, deptno from emp where deptno=10 union all select empno, ename, sal, deptno from emp where deptno=10;


--With
WITH abc(userID, total) AS(SELECT userID, SUM(price*amount) FROM buyTbl GROUP BY userID ) SELECT * FROM abc ORDER BY total DESC;

WITH HH(LOCATE, HEIGHT) as (SELECT ADDR, MAX(HEIGHT) FROM USERTBL GROUP BY ADDR)select avg(height) from HH;



--�ߺ� CTE
WITH AAA(userID, total)
AS (SELECT userID, SUM(price*amount) FROM buyTbl GROUP BY userID ),
BBB(sumtotal)
AS (SELECT SUM(total) FROM AAA ),
CCC(sumavg)
AS (SELECT sumtotal / (SELECT count(*) FROM buyTbl) FROM BBB)
SELECT * FROM AAA;



--����
--
--1��
WITH abc(groupname, avg)
AS
(SELECT groupname, min(price) FROM buyTbl GROUP BY groupname)
SELECT avg(avg) FROM abc;

--2��
with aaa(job_id, maxsalary)
as
(select job_id, max(salary) from employees group by job_id)
select cast(avg(maxsalary) as number(20,2)), sum(maxsalary) from aaa;



--Oracl �����Լ�
select concat('�̰���', 'oracle�̴�'), '�̰���' || '' || '����Ŭ�̴�' from dual;
select concat('�����', '305ȣ��') from dual;

select LPAD('�̰���', 10, '##'), RPAD('�̰���', 10, '##') from dual;


--����� CTE
create table emptbl(emp NCHAR(3), MANAGER NCHAR(3), DEPARTMENT NCHAR(3));

insert into emptbl values('������', '����', '����');
insert into emptbl values('���繫', '������', '�繫��');
insert into emptbl values('�����', '���繫', '�繫��');
insert into emptbl values('�̺���', '���繫', '�繫��');
insert into emptbl values('��븮', '�̺���', '�繫��');
insert into emptbl values('�����', '�̺���', '�繫��');
insert into emptbl values('�̿���', '������', '������');
insert into emptbl values('�Ѱ���', '�̿���', '������');
insert into emptbl values('������', '������', '������');
insert into emptbl values('������', '������', '������');
insert into emptbl values('������', '������', '������');

WITH empCTE(empName, mgrName, dept, empLevel)
AS
(
( SELECT emp, manager, department , 0 FROM empTbl WHERE manager = '����' ) -- ����� ���� ����� �ٷ� ����
UNION ALL
(SELECT empTbl.emp, empTbl.manager, empTbl.department, empCTE.empLevel+1
FROM empTbl ,empCTE
WHERE EMPTBL.MANAGER=EMPCTE.EMPNAME)
)
SELECT * FROM empCTE ORDER BY dept, empLevel;




















