--Length, Lengthb, concat
--
--(LENGTH �� ���ڿ��� ���̸� LENGTHB�� ���ڿ��� �Ҵ�� BYTE ���� ��ȯ)
SELECT LENGTH('�ѱ�'), LENGTH('AB'), LENGTHB('�ѱ�'),LENGTHB('AB') FROM DUAL;

--(CONCAT(���ڿ�1, ���ڿ�2) �Ǵ� || �� ���ڿ��� �̾��ش�)
SELECT CONCAT('�̰���', 'Oracle�̴�'), '�̰���' || 'Oracle�̴�' FROM DUAL;



--Instr, Instrb
--
--(���ڿ��� �����ϴ� ��ġ ��ȯ)
SELECT INSTR('�̰��� Oracle�̴�. �̰͵� ����Ŭ�̴�', '�̰�') FROM DUAL;

SELECT INSTR('�̰��� Oracle�̴�. �̰͵� ����Ŭ�̴�', '�̰�', 2) FROM DUAL;

--(���ڿ��� �����ϴ� ��ġ�� BYTE������ ���� ��ȯ)
SELECT INSTRB('�̰��� Oracle�̴�. �̰͵� ����Ŭ�̴�', '�̰�', 2) FROM DUAL;



--Upper, Lower, Initcap
--
--(UPPER ��� �빮��, LOWER ��� �ҹ���, INITCATP ù ���ڸ� ��� �빮��)
SELECT LOWER('abcdEFGH'), UPPER('abcdEFGH'), INITCAP('this is oracle') FROM DUAL;

SELECT e.ename, e.sal from emp e where lower(e.ename) = lower('ward');



--Replace, Translate, Substr, Reverse
--
--(REPLACE ���ڿ��� �ٲ��ش�)
SELECT REPLACE ('�̰��� Oracle�̴�', '�̰���' , 'This is') FROM DUAL;

--(TRANSLATE ���ڿ��� �� ���ھ� �ٲ��ش�)
SELECT TRANSLATE('�̰��� Oracle�̴�', '�̰�' , 'AB') FROM DUAL;

SELECT TRANSLATE('�̰��� OracleOradddleclt�̴�', 'Orac', '123') FROM DUAL;

--(SUBSTR(���ڿ�, ������ġ, ����) ������ġ���� ���̸�ŭ ���ڹ�ȯ)
SELECT SUBSTR('���ѹα�����', 3, 2) FROM DUAL;

SELECT (SUBSTR('�Ｚ���ڿ� ������ ���ڴ��.', 1, 4) || 'VS' || SUBSTR('�Ｚ���ڿ� ������ ���ڴ��.', 7, 2)) FROM DUAL;

--(REVERSE ���ڿ��� ������ �Ųٷ� �����)
SELECT REVERSE('Oracle') FROM DUAL;



--Lpad, Rpad, Trim, Ltrim, Rtrim
--
--(LPAD or RPAD(���ڿ�, ����, ä�� ���ڿ�), ���ڿ��� ���� ��ŭ �ø� �� �� ���� ä�� ���ڿ��� ä���.)
SELECT LPAD('�̰���', 10, '##'), RPAD('�̰���', 10, '##') FROM DUAL;

SELECT LTRIM('$$$$$�̰���', '$'), RTRIM('�̰���$$$$$', '$') FROM DUAL;

SELECT TRIM(' �̰��� '), TRIM(BOTH '��' FROM '��������վ��.������') FROM DUAL;



--Abs, Round, Ceil, Floor, Trunc
--(ABS : ���밪, ROUND: �ݿø�, CEIL: �ø�, FLOOR: ����, TRUNC : ���ڸ� �������� ���� ��ġ���� ���ϰ� �������� ������)
--
SELECT ABS(-100) FROM DUAL;

SELECT CEIL(4.7), FLOOR(4.7), ROUND(4.7) FROM DUAL;

SELECT ROUND(252,-2) FROM DUAL;

SELECT TRUNC(12345.12345, 2), TRUNC(12345.12345, -2) FROM DUAL;



--Mod, Power, Sqrt
--
--(MOD :������ ���� ������ ��, POWER : �ŵ����� ��, SQRT: ������)
SELECT MOD(157, 10) FROM DUAL;

SELECT POWER(2,3), SQRT(9) FROM DUAL;



--Sysdate, Add_months
--
--(SYSDATE ������ ��¥�� ��ȯ)
SELECT SYSDATE FROM DUAL;

--(ADD_MONTHS(��¥, ����) : ��¥�� �������� ������ ���ϰų� �� ���� ��ȯ)
SELECT ADD_MONTHS('2020-01-01', 5), ADD_MONTHS(SYSDATE, -5) FROM DUAL;



--Last_day, Next_day, Months_between
--
--(LAST_DAY �־��� ��¥�� ���� ������ ��¥�� ���Ѵ�)
SELECT LAST_DAY('2020-02-01') FROM DUAL;

--(NEXT_DAY �־��� ��¥�� ������ ���� ������ ��¥�� ���Ѵ�)
SELECT NEXT_DAY('2020-02-01', '������'), NEXT_DAY(SYSDATE, '�Ͽ���') FROM DUAL;

--(MONTHS_BETWEEN �־��� ��¥ ������ ���� ���� ���Ѵ�)
SELECT MONTHS_BETWEEN (SYSDATE, '1996-10-21') FROM DUAL;