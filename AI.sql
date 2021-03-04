--집계 함수

select price from buyTBL;

select sum(price) from buyTBL;

--(소수점 3자리까지 표현)
select cast(avg(price) as number(8,3)) from buyTBL;

select min(price) from buyTBL;

select max(price) from buyTBL;

--(표준편차)
select cast(STDDEV(price) as number(8,2)) from buyTBL;

--(분산)
select cast(variance(price) as number(20,3)) from buyTBL;



--Group by
--
Select userID, Sum(amount) from buyTBL Group BY userID;

Select userID as "사용자 아이디", Sum(price*amount) as "총구매액" from buyTBL Group BY userID;

--(Group by에선 where절을 사용할 수 없다)
Select userID as "사용자 아이디", Sum(price*amount) as "총구매액" from buyTBL Group BY userID where userID = BBK;

--(HAVING절은 꼭 GROUP BY 다음에 나와야 한다)
Select userID as "사용자 아이디", Sum(price*amount) as "총구매액" from buyTBL Group BY userID having sum(price * amount) > 1000;



--Rollup
--
Select idNum, groupName, Sum(price*amount) as "비용" from buyTbl Group by RollUp(groupName, idNum);

Select groupName, Sum(price*amount) as "비용" from buyTbl Group by RollUp(groupName);



--Grouping_ID
--
select groupname, sum(price*amount) as "비용", grouping_id(groupname) as "추가행 여부" from buyTbl group by rollup(Groupname);

select idnum, groupname, sum(price*amount) as "비용", grouping_id(idnum) as "추가행 여부" from buyTbl group by rollup(Groupname, idnum);



--연습문제
--
--1번
Select deptno as "부서", count(deptno) as "인원", avg(sal) as "평균급여", sum(sal) as "급여의 합" from emp Group BY deptno;
select deptno, count(*), avg(sal), sum(sal) from emp group by deptno;

--2번
Select job as "업무", count(job) as "인원", cast(avg(sal) as number(8,2)) as "평균급여", max(sal) as "최고급여액", min(sal) as "최저급여액", sum(sal) as "합계" from emp Group BY job;
select job, count(*), avg(sal), max(sal), min(sal), sum(sal) from emp group by job;

--3번
Select job as "직업", SUM(sal) as "월급여합계" from emp Group BY job HAVING sum(sal) > 5000;
select job, sum(sal) from emp group by job having sum(sal) > 5000;

--4번
Select job_id, employee_id, Sum(salary), grouping_id(employee_id) from employees Group by rollup (job_id, employee_id);
select job_id as "직업", employee_id as "직원ID", sum(salary) as "급여합계", grouping_id(employee_id) as "합계열 여부"from employees group by rollup(job_id, employee_id);

--5번
select addr, username, avg(height), grouping_id(height) as "추가행 여부" from usertbl group by rollup(addr, username);
select addr, username, avg(height), grouping_id(username) as "추가행 여부" from usertbl group by rollup(addr, username);



--Union
select empno, ename, sal, deptno from emp where deptno=10 union select empno, ename, sal, deptno from emp where deptno=20;

--Union All
select empno, ename, sal, deptno from emp where deptno=10 union all select empno, ename, sal, deptno from emp where deptno=10;


--With
WITH abc(userID, total) AS(SELECT userID, SUM(price*amount) FROM buyTbl GROUP BY userID ) SELECT * FROM abc ORDER BY total DESC;

WITH HH(LOCATE, HEIGHT) as (SELECT ADDR, MAX(HEIGHT) FROM USERTBL GROUP BY ADDR)select avg(height) from HH;



--중복 CTE
WITH AAA(userID, total)
AS (SELECT userID, SUM(price*amount) FROM buyTbl GROUP BY userID ),
BBB(sumtotal)
AS (SELECT SUM(total) FROM AAA ),
CCC(sumavg)
AS (SELECT sumtotal / (SELECT count(*) FROM buyTbl) FROM BBB)
SELECT * FROM AAA;



--문제
--
--1번
WITH abc(groupname, avg)
AS
(SELECT groupname, min(price) FROM buyTbl GROUP BY groupname)
SELECT avg(avg) FROM abc;

--2번
with aaa(job_id, maxsalary)
as
(select job_id, max(salary) from employees group by job_id)
select cast(avg(maxsalary) as number(20,2)), sum(maxsalary) from aaa;



--Oracl 내장함수
select concat('이것이', 'oracle이다'), '이것이' || '' || '오라클이다' from dual;
select concat('여기는', '305호다') from dual;

select LPAD('이것이', 10, '##'), RPAD('이것이', 10, '##') from dual;


--재귀적 CTE
create table emptbl(emp NCHAR(3), MANAGER NCHAR(3), DEPARTMENT NCHAR(3));

insert into emptbl values('나사장', '없음', '없음');
insert into emptbl values('김재무', '나사장', '재무부');
insert into emptbl values('김부장', '김재무', '재무부');
insert into emptbl values('이부장', '김재무', '재무부');
insert into emptbl values('우대리', '이부장', '재무부');
insert into emptbl values('지사원', '이부장', '재무부');
insert into emptbl values('이영업', '나사장', '영업부');
insert into emptbl values('한과장', '이영업', '영업부');
insert into emptbl values('최정보', '나사장', '정보부');
insert into emptbl values('윤차장', '최정보', '정보부');
insert into emptbl values('이주임', '윤차장', '정보부');

WITH empCTE(empName, mgrName, dept, empLevel)
AS
(
( SELECT emp, manager, department , 0 FROM empTbl WHERE manager = '없음' ) -- 상관이 없는 사람이 바로 사장
UNION ALL
(SELECT empTbl.emp, empTbl.manager, empTbl.department, empCTE.empLevel+1
FROM empTbl ,empCTE
WHERE EMPTBL.MANAGER=EMPCTE.EMPNAME)
)
SELECT * FROM empCTE ORDER BY dept, empLevel;




















