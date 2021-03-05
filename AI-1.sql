--Length, Lengthb, concat
--
--(LENGTH 는 문자열의 길이를 LENGTHB는 문자열에 할당된 BYTE 수를 반환)
SELECT LENGTH('한글'), LENGTH('AB'), LENGTHB('한글'),LENGTHB('AB') FROM DUAL;

--(CONCAT(문자열1, 문자열2) 또는 || 는 문자열을 이어준다)
SELECT CONCAT('이것이', 'Oracle이다'), '이것이' || 'Oracle이다' FROM DUAL;



--Instr, Instrb
--
--(문자열이 시작하는 위치 반환)
SELECT INSTR('이것이 Oracle이다. 이것도 오라클이다', '이것') FROM DUAL;

SELECT INSTR('이것이 Oracle이다. 이것도 오라클이다', '이것', 2) FROM DUAL;

--(문자열이 시작하는 위치를 BYTE단위로 세서 반환)
SELECT INSTRB('이것이 Oracle이다. 이것도 오라클이다', '이것', 2) FROM DUAL;



--Upper, Lower, Initcap
--
--(UPPER 모두 대문자, LOWER 모두 소문자, INITCATP 첫 글자를 모두 대문자)
SELECT LOWER('abcdEFGH'), UPPER('abcdEFGH'), INITCAP('this is oracle') FROM DUAL;

SELECT e.ename, e.sal from emp e where lower(e.ename) = lower('ward');



--Replace, Translate, Substr, Reverse
--
--(REPLACE 문자열을 바꿔준다)
SELECT REPLACE ('이것이 Oracle이다', '이것이' , 'This is') FROM DUAL;

--(TRANSLATE 문자열을 한 글자씩 바꿔준다)
SELECT TRANSLATE('이것이 Oracle이다', '이것' , 'AB') FROM DUAL;

SELECT TRANSLATE('이것이 OracleOradddleclt이다', 'Orac', '123') FROM DUAL;

--(SUBSTR(문자열, 시작위치, 길이) 시작위치부터 길이만큼 문자반환)
SELECT SUBSTR('대한민국만세', 3, 2) FROM DUAL;

SELECT (SUBSTR('삼성전자와 애플의 전자대결.', 1, 4) || 'VS' || SUBSTR('삼성전자와 애플의 전자대결.', 7, 2)) FROM DUAL;

--(REVERSE 문자열의 순서를 거꾸로 만든다)
SELECT REVERSE('Oracle') FROM DUAL;



--Lpad, Rpad, Trim, Ltrim, Rtrim
--
--(LPAD or RPAD(문자열, 길이, 채울 문자열), 문자열을 길이 만큼 늘린 후 빈 곳을 채울 문자열로 채운다.)
SELECT LPAD('이것이', 10, '##'), RPAD('이것이', 10, '##') FROM DUAL;

SELECT LTRIM('$$$$$이것이', '$'), RTRIM('이것이$$$$$', '$') FROM DUAL;

SELECT TRIM(' 이것이 '), TRIM(BOTH 'ㅋ' FROM 'ㅋㅋㅋ재밌어요.ㅋㅋㅋ') FROM DUAL;



--Abs, Round, Ceil, Floor, Trunc
--(ABS : 절대값, ROUND: 반올림, CEIL: 올림, FLOOR: 내림, TRUNC : 숫자를 기준으로 정수 위치까지 구하고 나머지는 버린다)
--
SELECT ABS(-100) FROM DUAL;

SELECT CEIL(4.7), FLOOR(4.7), ROUND(4.7) FROM DUAL;

SELECT ROUND(252,-2) FROM DUAL;

SELECT TRUNC(12345.12345, 2), TRUNC(12345.12345, -2) FROM DUAL;



--Mod, Power, Sqrt
--
--(MOD :나누고 남은 나머지 값, POWER : 거듭제곱 값, SQRT: 제곱근)
SELECT MOD(157, 10) FROM DUAL;

SELECT POWER(2,3), SQRT(9) FROM DUAL;



--Sysdate, Add_months
--
--(SYSDATE 현재의 날짜를 반환)
SELECT SYSDATE FROM DUAL;

--(ADD_MONTHS(날짜, 개월) : 날짜를 기준으로 개월을 더하거나 뺀 월을 반환)
SELECT ADD_MONTHS('2020-01-01', 5), ADD_MONTHS(SYSDATE, -5) FROM DUAL;



--Last_day, Next_day, Months_between
--
--(LAST_DAY 주어진 날짜의 달의 마지막 날짜를 구한다)
SELECT LAST_DAY('2020-02-01') FROM DUAL;

--(NEXT_DAY 주어진 날짜의 다음에 오는 요일의 날짜를 구한다)
SELECT NEXT_DAY('2020-02-01', '월요일'), NEXT_DAY(SYSDATE, '일요일') FROM DUAL;

--(MONTHS_BETWEEN 주어진 날짜 사이의 개월 수를 구한다)
SELECT MONTHS_BETWEEN (SYSDATE, '1996-10-21') FROM DUAL;


SELECT TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss') FROM DUAL;
SELECT TO_CHAR(355500, '$999,999') FROM DUAL;
SELECT TO_CHAR(355500, '999,000') FROM DUAL;
SELECT TO_DATE('20210305') FROM DUAL;
SELECT TO_NUMBER('123456') FROM DUAL;



--Inner join
--
--(Select <열 목록> From <첫 번째 테이블> Inner Join <두 번째 테이블> On <조인될 조건> [Where 검색조건];)
SELECT B.USERID, U.USERNAME, B.PRODNAME, U.ADDR, U.MOBILE1 || U.MOBILE2 AS "연락처" FROM BUYTBL B INNER JOIN USERTBL U ON B.USERID=U.USERID ;

SELECT B.USERID, U.USERNAME, B.PRODNAME, U.ADDR, U.MOBILE1 || U.MOBILE2 AS "연락처" FROM BUYTBL B, USERTBL U WHERE B.USERID=U.USERID ;

SELECT DISTINCT U.USERID, U.USERNAME, U.ADDR FROM USERTBL U, BUYTBL B WHERE U.USERID = B.USERID;



--Exists
--
--(EXISTS 의 서브쿼리 결과가 존재하면 TRUE 없으면 FALSE, TRUE 일때 실행)
SELECT U.USERID, U.USERNAME,U.ADDR FROM USERTBL U WHERE EXISTS(SELECT B.USERID FROM BUYTBL B WHERE E.USERID=B.USERID) ;



--Cross join
--
--(테스트로 사용할 많은 용량의 데이터를 생성할 때 주로 사용한다)


--Outer join
--
--(조인의 조건에 만족되지 않는 행까지도 포함시키는 것)
--(SELECT <열 목록> FROM <첫 번째 테이블(LEFT 테이블)> <LEFT | RIGHT | FULL> OUTER JOIN <두 번째 테이블(RIGHT 테이블)> ON <조인될 조건>)
SELECT U.USERID, U.USERNAME, B.PRODNAME, U.ADDR, U.MOBILE1||'-'||U.MOBILE2 AS "연락처" FROM USERTBL U LEFT OUTER JOIN BUYTBL B ON B.USERID=U.USERID; 

SELECT U.USERID, U.USERNAME, B.PRODNAME, U.ADDR, U.MOBILE1||'-'||U.MOBILE2 AS "연락처" FROM BUYTBL B RIGHT OUTER JOIN USERTBL U ON B.USERID=U.USERID;



--Self join
--
--(자기 자신과 조인한다)
SELECT A.EMP AS 부하직원, B.EMP AS 직속상관, B.DEPARTMENT AS 직속상관부서 FROM EMPTBL A INNER JOIN EMPTBL B ON A.MANAGER = B.EMP WHERE A.EMP = '김재무';





--문제1
SELECT E.ENAME, D.DEPTNO, D.DNAME FROM EMP E INNER JOIN DEPT D ON E.DEPTNO=D.DEPTNO ;

--문제2
SELECT E.ENAME, E.JOB, E.SAL, D.DNAME FROM EMP E INNER JOIN DEPT D ON E.DEPTNO=D.DEPTNO WHERE D.LOC = 'NEW YORK';

--문제3
SELECT E.ENAME, D.DNAME, D.LOC FROM EMP E INNER JOIN DEPT D ON E.DEPTNO=D.DEPTNO WHERE E.COMM is not null;

--문제4
SELECT E.EMPNO, E.ENAME, E.SAL, D.DNAME FROM EMP E INNER JOIN DEPT D ON E.DEPTNO=D.DEPTNO  WHERE SAL >= 2000 ORDER BY E.SAL DESC;

--문제5
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DNAME FROM EMP E INNER JOIN DEPT D ON E.DEPTNO=D.DEPTNO WHERE E.JOB = 'MANAGER' AND E.SAL >= 2500 ORDER BY E.EMPNO ASC;

--문제6
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE FROM EMP E, SALGRADE S WHERE SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE = 4 ORDER BY E.SAL DESC;

--문제7
SELECT E.ENAME, E.JOB, D.DNAME, D.LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND E.ENAME like '%L%';

--문제8
SELECT A.ENAME  AS "사원", A.HIREDATE  AS "사원 입사일", B.ENAME  AS "관리자", B.HIREDATE  AS "관리자 입사일" FROM EMP A INNER JOIN EMP B ON A.EMPNO=B.MGR WHERE A.HIREDATE<B.HIREDATE;

--문제9
SELECT E.ENAME, E.SAL, E.HIREDATE, E.COMM FROM EMP E, DEPT D WHERE D.DEPTNO=E.DEPTNO AND D.LOC = 'DALLAS' AND E.SAL > 1500;

--문제10
SELECT E.ENAME, E.SAL, E.HIREDATE, D.DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND MONTHS_BETWEEN(SYSDATE, HIREDATE) > (12*30);






