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