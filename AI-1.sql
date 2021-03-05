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